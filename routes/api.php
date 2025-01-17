<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\GagarinController;
use App\Http\Controllers\LunarMissionController;
use App\Http\Controllers\SpaceFlightController;
use App\Http\Controllers\WatermarkController;
use Illuminate\Support\Facades\Route;

Route::post('/registration', [AuthController::class, 'registration']);
Route::post('/authorization', [AuthController::class, 'authorization']);

Route::get('/flight', function () {
    return json_decode('{
    "data": [ {
        "name": " Apollo-11",
        "crew_capacity": 3,
        "cosmonaut": [
            {
                "name": "Neil Armstrong ",
                "role": "Commander "
            },
            {
                "name": "Buzz Aldrin",
                "role": "Lunar module pilot "
            },
            {
                "name": "Michael Collins",
                "role": "Command Module Pilot"
            }
        ],
        "launch_details": {
            "launch_date": "1969-07-16",
            "launch_site": {
                "name": "Kennedy Space Center",
                "latitude": 28.5721000,
                "longitude": -80.6480000
            }
        },
        "landing_details": {
            "landing_date": "1969-07-20",
            "landing_site": {
                "name": "Sea of tranquility",
                "latitude": 0.6740000,
                "longitude": 23.4720000
            }
        }
    }
  ]
}');
});

Route::get('/gagarin-flight', GagarinController::class);
Route::get('/search', [LunarMissionController::class, 'search']);
Route::get('/lunar-missions', [LunarMissionController::class, 'index']);
Route::get('/lunar-missions/{mission}', [LunarMissionController::class, 'show']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/logout', [AuthController::class, 'logout']);

    Route::post('/lunar-missions', [LunarMissionController::class, 'store']);
    Route::patch('/lunar-missions/{mission}', [LunarMissionController::class, 'update'])->can('manage,mission');
    Route::delete('/lunar-missions/{mission}', [LunarMissionController::class, 'delete'])->can('manage,mission');

    Route::post('/space-flights', [SpaceFlightController::class, 'store']);
    Route::get('/space-flights', [SpaceFlightController::class, 'index']);
    Route::post('/book-flight', [SpaceFlightController::class, 'book']);

    Route::post('/lunar-watermark', WatermarkController::class);
});
