<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected function sort_pdf_image_array($images_array) {
    	sort($images_array, SORT_NATURAL);
			if(count(explode('-', end($images_array))) == 1) {
				// move last item in array to first
				$lastvalue = end($images_array);
				$lastkey = key($images_array);
				$arr1 = array($lastkey=>$lastvalue);
				array_pop($images_array);
				$images_array = array_merge($arr1,$images_array);
			}
			return $images_array;
    }
}
