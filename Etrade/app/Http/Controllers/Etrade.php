<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;

class Etrade extends Controller
{
    
    public function whome(Request $request)
    {
        $result = DB::select("select * from products");
        
        $cart_item = "";

        if($request->session()->get("email")){
            $email = $request->session()->get("email");
            $cart_item = DB::select("select products.pr_name, products.pr_image, products.pr_sale_price , cart.id FROM products INNER join cart ON products.id = cart.product_id where cart.email =  '".$email."'");
        }

        return view('whome', array('result' => $result, 'cart_items' => $cart_item));
    }

    public function single_product($id)
    {
        $result = DB::select("select * from products where id =" . $id);

        return view('single_product', array('row' => $result[0]));
    }

    public function resgister_form()
    {
        return view('resgister_form');
    }

   
    public function do_register(Request $request)
    {

        $request->validate([
            'email'=>['required', new emailcheck() ],
            'password'=>['required'],
             'name'=>['required'] ] ) ;
            

        $email = $request->input("email");

        $password = $request->input("password");

        $name = $request->input("name");

        DB::insert("INSERT INTO `user`(`email`, `pass`, `name`) VALUES ('".$email."','".$password."','".$name."')");

        $request->session()->put("login","true");
        $request->session()->put("name",$name);
        
        return redirect("/whome");

    }

    public function login()
    {
        return view("login", array('msg' => ""));
    }

    public function w_do_login(Request $request)
    {
        $email = $request->input("email");

        $password = $request->input("password");

        $result = DB::select("select * from user where email='".$email."' and pass='".$password."' ");

        $count = 0;

        $name = "";

        foreach($result as $row)
        {
            $count=1;
            $name = $row->name;
        }

        if($count==1)
        {
            $request->session()->put("login","true");
            $request->session()->put("name",$name);
            $request->session()->put("email",$email);
            
            return redirect("/whome");
        }
        else
        {
            
            return view("/login",array('msg'=>"* Invalid User ID or Password"));
        }
    }


    public function logout(Request $request)
    {
        $request->session()->forget("login");
        $request->session()->forget("name");
        $request->session()->forget("email");

        return redirect("/whome");
    }
    public function add_to_cart(Request $request, $id)
    {
        $email = $request->session()->get("email");

        DB::insert("INSERT INTO `cart`(`email`, `product_id`) VALUES ('".$email."',".$id.")");

        return redirect("whome");
    }

    public function remove_cart_item($id)
    {
        DB::delete("delete from cart where id=".$id);

        return redirect("whome");
    }

    public function checkout(Request $request)
    {
        $cart_items="";

        if($request->session()->get("email"))
        {
            $email = $request->session()->get("email");

            $cart_items = DB::select("SELECT products.pr_name,products.pr_image,products.pr_sale_price,cart.id FROM products INNER JOIN cart ON products.id = cart.product_id WHERE cart.email='".$email."'");
        }

        $shippers = DB::select("select * from shippers");

        return view("checkout",array('cart_items'=>$cart_items,'shippers'=>$shippers,'order_id'=>''));
    }


    public function place_order(Request $request)
    {
        $t = time();

        $address = $request->input("address");

        $email = $request->session()->get("email");

        $amount =  $request->input("total_amount");

        $shipper =  $request->input("shipping_charge");

        $shipper_id = explode("-",$shipper)[1];


       // $id = DB::insert("INSERT INTO `orders`(`date`, `email`, `address`, `amount`, `shipper_id`, `status`) VALUES ('".$t."','".$email."','".$address."',".$amount.",".$shipper_id.",'pending')");

    //    INSERT INTO `orders`(`id`, `date`, `email`, `address`, `amount`, `shipper_id`, `status`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7])

        $user_order_id = $this->generateRandomString(20);

        $order_id = DB::table('orders')->insertGetId( array('date' => $t, 'email' => $email, 'address'=> $address, 'amount'=> $amount, 'shipper_id'=> $shipper_id, 'status'=>'pending', 'order_number'=> $user_order_id));

        $cart_items = DB::select("select * from cart where email='".$email."' ");

        foreach($cart_items as $item) 
        {
        // DB::insert("INSERT INTO `order_deatails`(`order_id`, `product_id`) VALUES (".$order_id.",".$item->product_id.")");

        DB::insert("INSERT INTO `order_details`( `order_id`, `product_id`) VALUES (".$order_id.",".$item->product_id.")");
        }


        DB::delete("delete from cart where email='".$email."'");

        $cart_items = DB::select("select * from cart where email='".$email."' ");


        $shippers = DB::select("select * from shippers");

        return view("checkout",array('cart_items'=>$cart_items,'shippers'=>$shippers,'order_id'=>$user_order_id));
        

        
        
    }


    public function generateRandomString($length = 10) {
            
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
    
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[random_int(0, $charactersLength - 1)];
        }
    
        return $randomString;
    }
    
    public function myaccount(Request $request)
    {
        $cart_items = "";

        $orders = "";

        if($request->session()->get("email")){
            $email = $request->session()->get("email");
            $orders = DB::select(
                "SELECT orders.date , orders.email , orders.order_number , orders.amount , orders.status , shippers.shipperName , shippers.shipperPhone FROM orders INNER JOIN shippers ON orders.shipper_id = shippers.shipperID WHERE orders.email = '".$email."'");

            $cart_items = DB::select("SELECT products.pr_name, products.pr_image, products.pr_sale_price ,cart.id FROM cart INNER JOIN products ON products.id = cart.product_id WHERE cart.email = '".$email."' ");
        }

        return view("myaccount",array('orders'=>$orders,'cart_items'=>$cart_items));
    }
    

    // public function order_details(Request $request,$id)
    // {
    //     if($request->session()->get('email')){
    //         $email = $request->session()->get('email');

    //         $order_detail = DB::select("SELECT orders.date , orders.amount,products.pr_name,products.pr_image,products.pr_sale_price,shippers.shipperName,shippers.shipperPhone,shippers.shipping_charge FROM orders INNER JOIN order_details ON order_details.order_id = orders.id INNER JOIN shippers ON shippers.shipperID = orders.shipper_id INNER JOIN products ON products.id = order_details.product_id = products.id WHERE orders.order_number = '".$id."' ");

    //         $cart_items = DB::select("SELECT products.pr_name,products.pr_image,products.pr_sale_price,cart.id FROM products INNER JOIN cart ON products.id = cart.product_id WHERE cart.email='".$email."'");
    //     }
    //     return view("order_details",array("cart_items"=>$cart_items,"order_details"=>$order_detail[0]));
    // }


    public function order_details(Request $request, $id)
{
    if ($request->session()->get('email')) {
        $email = $request->session()->get('email');

        $order_detail = DB::select("SELECT orders.date, orders.amount, products.pr_name, products.pr_image, products.pr_sale_price, shippers.shipperName as shipper_name, shippers.shipperPhone, shippers.shipping_charge as shipper_charge FROM orders 
        INNER JOIN order_details ON order_details.order_id = orders.id 
        INNER JOIN shippers ON shippers.shipperID = orders.shipper_id 
        INNER JOIN products ON products.id = order_details.product_id 
        WHERE orders.order_number = ?", [$id]);

        $cart_items = DB::select("SELECT products.pr_name, products.pr_image, products.pr_sale_price, cart.id 
        FROM products 
        INNER JOIN cart ON products.id = cart.product_id 
        WHERE cart.email = ?", [$email]);

        if (count($order_detail) === 0) {
            return redirect()->back()->with('error', 'No order found.');
        }

        return view("order_details", [
            "cart_items" => $cart_items,
            "order_details" => $order_detail,
            "order_summary" => $order_detail[0]
        ]);
    }

    return redirect("login")->with('error', 'You must be logged in to view orders.');
}


    

}
