<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WatermarkController extends Controller
{    
    public function __invoke(Request $request)
    {
        $request->validate([
            'fileimage' => 'required|file|mimes:png,jpg|max:5000',
            'message' => 'required|string|min:10|max:20',
        ]);

        $file = $request->file('fileimage');
        $text = $request->input('message');

        return response()->stream(function () use ($text, $file) {
            $image = null;

            if ($file->getClientOriginalExtension() === 'png') {
                $image = imagecreatefrompng($file);
                
                header('Content-Type: image/png');
            } else {
                $image = imagecreatefromjpeg($file);
                
                header('Content-Type: image/jpeg');
            }
            
            $textColor = imagecolorallocate($image, 100, 100, 100);

            $fontSize = 5; 
            $margin = 10; 

            $textWidth = imagefontwidth($fontSize) * mb_strlen($text);
            $textHeight = imagefontheight($fontSize);

            $x = imagesx($image) - $textWidth - $margin;
            $y = imagesy($image) - $textHeight - $margin;

            imagestring($image, $fontSize, $x, $y, $text, $textColor);

            if ($file->getClientOriginalExtension() === 'png') {
                imagepng($image);
            } else {
                imagejpeg($image);
            }

            imagedestroy($image);
        }, 200, ['Content-Type' => 'image/jpeg']);
    }
}
