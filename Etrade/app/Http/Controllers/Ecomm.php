<?php

namespace App\Http\Controllers;
use DB;

use Illuminate\Http\Request;

class Ecomm extends Controller
{
    public function home()
  {
    $result = DB::select('SELECT products.id,products.cat_id,products.pr_name,products.pr_alias,products.pr_desc,products.pr_image,products.pr_price,products.pr_sale_price,category.cat_name FROM products INNER JOIN category ON products.cat_id=category.id');

    return view('home', array('result'=>$result));
  }

  public function product_delete($id)
  {
    DB::delete("delete from products where id=" . $id);

    return redirect("home");
  }

  public function product_details($id)
  {
      $result = DB::select("SELECT products.id,products.cat_id,products.pr_name,products.pr_alias,products.pr_desc,products.pr_image,products.pr_price,products.pr_sale_price,category.cat_name FROM products INNER JOIN category ON products.cat_id=category.id where products.id=".$id);

      return view("product_detail",array('row'=>$result[0]));
  }


  public function category_details($id)
  {
      $result = DB::select("SELECT products.id,products.cat_id,products.pr_name,products.pr_alias,products.pr_desc,products.pr_image,products.pr_price,products.pr_sale_price,category.cat_name FROM products INNER JOIN category ON products.cat_id=category.id where products.cat_id=".$id);

      return view("category_detail",array('result'=>$result));
  }

  public function insert_product()
  {
    $result = DB::select("select * from category");

    return view("insert_product",array('result'=>$result));
  }

  public function do_insert(Request $request)
  {
      $pr_name = $request->input("pr_name");
      $pr_alias = $request->input("pr_alias");
      $pr_desc = $request->input("pr_desc");
      $pr_price = $request->input("pr_price");
      $pr_sale_price = $request->input("pr_sale_price");
      $cat_id = $request->input("cat_id");
      
      if($request->hasFile("pr_image"))
      {
          $pr_image= $request->pr_image->getClientOriginalName();  //"abcd.jpg";//$request->input('pr_image');

          $request->pr_image->move(public_path('storage/kartik_images'), $pr_image);

          DB::update("INSERT INTO `products`( `pr_name`, `cat_id`, `pr_alias`, `pr_desc`, `pr_image`, `pr_price`, `pr_sale_price`) VALUES ('".$pr_name."',".$cat_id.",'".$pr_alias."','".$pr_desc."','".$pr_image."',".$pr_price.",".$pr_sale_price.")");

      }
     

      return redirect("home");
      
  }

  public function edit_product($id)
  {
    $result = DB::select("SELECT products.id,products.cat_id,products.pr_name,products.pr_alias,products.pr_desc,products.pr_image,products.pr_price,products.pr_sale_price,category.cat_name FROM products INNER JOIN category ON products.cat_id=category.id where products.id=".$id);

    $result1 = DB::select("select * from category");

    return view('edit_product', array('row'=>$result[0],'result' =>$result1));

  }

  public function do_edit(Request $request , $id)
  {
      $pr_name = $request->input("pr_name");
      $pr_alias = $request->input("pr_alias");
      $pr_desc = $request->input("pr_desc");
      $pr_price = $request->input("pr_price");
      $cat_id = $request->input("cat_id");
      $pr_sale_price = $request->input("pr_sale_price");
      
      if($request->hasFile("pr_image"))
      {
          $pr_image= $request->pr_image->getClientOriginalName();  //"abcd.jpg";//$request->input('pr_image');

          $request->pr_image->move(public_path('storage/kartik_images'), $pr_image);

          DB::update("update products set pr_name='".$pr_name."' , pr_alias='".$pr_alias."' , pr_price=".$pr_price." , pr_sale_price=".$pr_sale_price." , pr_image='".$pr_image."' , pr_desc= '".$pr_desc."', cat_id=".$cat_id."  where id=".$id);

      }
      else
      {
          DB::update("update products set pr_name='".$pr_name."' , pr_alias='".$pr_alias."' , pr_price=".$pr_price." , pr_sale_price=".$pr_sale_price."  , pr_desc= '".$pr_desc."', cat_id=".$cat_id."  where id=".$id);

      }

      
      
      return redirect("home");
      
  }

  public function search_products()
  {

    $search=$_GET['search'];
    
    $result = DB::select("SELECT products.id,products.cat_id,products.pr_name,products.pr_alias,products.pr_desc,products.pr_image,products.pr_price,products.pr_sale_price,category.cat_name FROM products INNER JOIN category ON products.cat_id=category.id where products.pr_name like '%".$search."%' ");

    $count=0;
      foreach($result as $row)
      {
          $count=$count+1;
      }

    return view('search_products', array('result'=>$result,'count'=>$count));
    
  }

  public function signup()
  {

      return View("signup_form");
  }

  public function do_signup(Request $request)
  {
      $email = $request->input("email");
      $password = $request->input("password");
      $name = $request->input("name");

      DB::insert("INSERT INTO `user`( `email`, `pass`, `name`) VALUES ('".$email."','".$password."','".$name."')");


      $request->session()->put("login","true");
      $request->session()->put("name",$name);
      

      return redirect("home");
      
  }

  public function logout(Request $request)
  {
      $request->session()->forget("login");
      $request->session()->forget("name");
      
      return redirect("home");
  }


  public function login()
  {

      return view("login_form",array('msg'=>""));
  }

  public function do_login(Request $request)
  {
      $email = $request->input("email");
      $password = $request->input("password");
      

      $result = DB::select("select * from user where email='".$email."' and pass='".$password."' ");

      $count=0;

      $name="";

      foreach($result as $row)
      {
          $count=1;
          $name=$row->name;
      }

      if($count==1)
      {
      $request->session()->put("login","true");
      $request->session()->put("name",$name);
      }
      else
      {
          return view("login_form",array('msg'=>"* Invalid User ID or Password"));
      }

      return redirect("home");
  }



}
