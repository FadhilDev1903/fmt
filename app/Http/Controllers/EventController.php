<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;

class EventController extends Controller
{
    // Method to store an event
    public function store(Request $request)
    {
        dd($request->all());
        $validatedData = $request->validate([
            'title' => 'required',
            'start' => 'required|date',
            'end' => 'required|date',
        ]);

        $userId = decrypt(session('user_id'));

        $event = Event::create([
            'user_id' => $userId,
            'title' => $validatedData['title'],
            'start' => $validatedData['start'],
            'end' => $validatedData['end'],
        ]);

        return response()->json($event, 201);
    }
}
