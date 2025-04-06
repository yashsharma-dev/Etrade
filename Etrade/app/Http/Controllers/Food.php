<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;

class Food extends Controller
{
    
    public function home(Request $request)
    {
        $result = DB::select("SELECT food_menu.id,food_menu.food_name,food_menu.food_desc,food_menu.food_image,food_menu.alias,main_category.cat_name,state_food.state_name FROM food_menu INNER JOIN main_category ON food_menu.food_main_cat = main_category.id INNER JOIN state_food ON state_food.id=food_menu.food_state_cat");

        foreach($result as $row){
            $row->food_image = asset("storage/".$row->food_image);
        }

        return response()->json($result);
    }

    public function states()
    {
        $result = DB::select("SELECT * FROM `state_food`");

        return response()->json($result);
    }

    public function categorys()
    {
        $result = DB::select("SELECT * FROM `main_category`");

        return response()->json($result);
    }
}
