<?php

namespace App\Jobs;

use Exception;
use App\Libraries\InnerConvertApi;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CreatePdfConverterJob implements ShouldQueue
{
    use InteractsWithQueue, SerializesModels, Queueable;

    protected $saveDir;
    protected $file_path;

    public function __construct($saveDir, $file_path)
    {
        $this->saveDir = $saveDir;
        $this->file_path = $file_path;
    }

    public function handle() {
    	$dir = base_path($this->saveDir);
    	if(!\File::exists($dir)) {
				\File::makeDirectory($dir, 0777, true);
    	}

			$convertApi = new InnerConvertApi;
			$result = $convertApi->convert('jpg', [
		        'File' => base_path($this->file_path),
		        'ScaleImage' => 'true',
		        'JpgQuality' => '80',
		        'ImageWidth' => '800',
		        'Timeout' => '300',
		    ], 'pdf'
			);
			$result->saveFiles($dir);
    }

    public function failed(Exception $exception)
    {
      \Log::error($exception->getMessage());
    }
}