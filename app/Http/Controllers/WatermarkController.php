<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WatermarkController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $request->validate([
            'fileimage' => 'required|file|mimes:png,jpg|max:5000',
            'message' => 'required|string|min:10|max:20',
        ]);

        $file = $request->file('fileimage');
        $text = $request->input('message');

        return response()->stream(function () use ($text, $file) {
            $image = imagecreatefromjpeg($file);

            // Определяем цвет текста (например, белый)
            $textColor = imagecolorallocate($image, 100, 100, 100);

            // Устанавливаем параметры шрифта
            $fontSize = 5; // Размер шрифта (1-5 для встроенных шрифтов PHP)
            $margin = 10; // Отступ от края изображения

            // Получаем ширину и высоту текста
            $textWidth = imagefontwidth($fontSize) * strlen($text);
            $textHeight = imagefontheight($fontSize);

            // Рассчитываем позицию текста в правом нижнем углу
            $x = imagesx($image) - $textWidth - $margin;
            $y = imagesy($image) - $textHeight - $margin;

            // Добавляем текст на изображение
            imagestring($image, $fontSize, $x, $y, $text, $textColor);

            // Устанавливаем заголовок для вывода изображения
            header('Content-Type: image/jpeg');

            // Отправляем изображение пользователю
            imagejpeg($image);

            // Освобождаем память
            imagedestroy($image);
        }, 200, ['Content-Type' => 'image/jpeg']);
    }
}
