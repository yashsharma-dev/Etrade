<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

use Illuminate\Support\Facades\DB;

class emailcheck implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        //

        $result = DB::select("select * from user where email='".$value."'");

        $count=0;

        foreach($result as $row)
        {
            $count=$count+1;
        }


        if($count==0)
        {
            return true;
        }
        else
        {
            return false;
        }

    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return '* This Email ID Already Exist.';
    }
}
