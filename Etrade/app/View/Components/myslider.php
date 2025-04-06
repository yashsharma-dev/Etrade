<?php

namespace App\View\Components;

use Illuminate\View\Component;

use DB;

class myslider extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    var $cat_id;
    public function __construct($catid)
    {
        //
        $this->cat_id = $catid;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     * 
     * 
     */
   
    public function render()
    {
        $rs = DB::select("select * from category where id=".$this->cat_id);

        $cat_name = $rs[0]->cat_name;

        $result = DB::select("select * from products where cat_id=".$this->cat_id);

        return view('components.myslider',array('result'=>$result,'cat_name'=>$cat_name));
        
    }
}
