<?php

namespace App\Http\Controllers;

use App\Http\Requests\LunarMissionRequest;
use App\Http\Resources\LunarMissionResource;
use App\Http\Resources\SearchMissionResource;
use App\Models\LunarMission;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Http\Response;

class LunarMissionController extends Controller
{
    /**
     * Get missions
     *
     * @return AnonymousResourceCollection
     */
    public function index(): AnonymousResourceCollection
    {
        return LunarMissionResource::collection(LunarMission::query()->get());
    }

    public function search()
    {
        $query = request()->input('query', '');

        return SearchMissionResource::collection(LunarMission::query()
            ->where('name', 'like', '%' . $query . '%')
            ->orWhere('spacecraft', 'like', '%' . $query . '%')
            ->get());
    }

    /**
     * Show one mission
     *
     * @param LunarMission $mission
     * @return LunarMissionResource
     */
    public function show(LunarMission $mission): LunarMissionResource
    {
        return LunarMissionResource::make($mission);
    }

    /**
     * Store lunar mission
     *
     * @param LunarMissionRequest $request
     * @return JsonResponse
     */
    public function store(LunarMissionRequest $request): JsonResponse
    {
        /** @var User $user */
        $user = auth()->user();
        $user->lunarMissions()->create($request->validated()['mission']);

        return response()->json([
            'data' => [
                'code' => 201,
                'message' => 'Миссия добавлена',
            ],
        ], 201);
    }

    /**
     * Update mission
     *
     * @param LunarMission $mission
     * @param LunarMissionRequest $request
     * @return array[]
     */
    public function update(LunarMission $mission, LunarMissionRequest $request): array
    {
        $mission->update($request->validated()['mission']);

        return [
            'data' => [
                'code' => 200,
                'message' => 'Миссия обновлена',
            ],
        ];
    }

    /**
     * Delete mission
     *
     * @param LunarMission $mission
     * @return Response
     */
    public function delete(LunarMission $mission): Response
    {
        $mission->delete();

        return response()->noContent();
    }
}
