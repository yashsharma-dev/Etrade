<?php

namespace App\View\Components;

use Illuminate\View\Component;

use DB;

class mymenu extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $cat = DB::select("select * from category");

        return view('components.mymenu',array('cat'=>$cat));
    }
}
