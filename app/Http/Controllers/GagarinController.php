<?php

namespace App\Http\Controllers;

use App\Models\GagarinFlight;
use Illuminate\Http\Request;

class GagarinController extends Controller
{
    public function __invoke(Request $request)
    {
        return [
            'data' => GagarinFlight::query()->get()->map->data,
        ];
    }
}
