<?php

namespace App\Http\Controllers;

use App\Http\Requests\SpaceFlightRequest;
use App\Models\SpaceFlight;
use App\Models\UserFlight;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class SpaceFlightController extends Controller
{
    /**
     * Create space flight
     *
     * @param SpaceFlightRequest $request
     * @return JsonResponse
     */
    public function store(SpaceFlightRequest $request): JsonResponse
    {
        SpaceFlight::query()->create($request->validated());

        return response()->json([
            'data' => [
                'code' => 201,
                'message' => 'Космический полет создан',
            ],
        ], 201);
    }

    /**
     * Get space flights
     *
     * @return array
     */
    public function index(): array
    {
        return [
            'data' => SpaceFlight::query()->get()->map(function (SpaceFlight $flight) {
                return [
                    'flight_number' => $flight->flight_number,
                    'destination' => $flight->destination,
                    'launch_date' => $flight->launch_date,
                    'seats_available' => $flight->seats_available - $flight->books()->count(),
                ];
            }),
        ];
    }

    /**
     * Create book
     *
     * @return JsonResponse
     */
    public function book(): JsonResponse
    {
        $flightNumber = request()->input('flight_number');

        $spaceFlight = SpaceFlight::query()
            ->where('flight_number', $flightNumber)
            ->first();

        if (!$spaceFlight) {
            throw new NotFoundHttpException();
        }

        if ($spaceFlight->seats_available <= $spaceFlight->books()->count()) {
            throw new AccessDeniedHttpException();
        }

        $spaceFlight->books()->create([
            'user_id' => auth()->id(),
        ]);

        return response()->json([
            'data' => [
                'code' => 201,
                'message' => 'Рейс забронирован',
            ],
        ], 201);
    }
}
