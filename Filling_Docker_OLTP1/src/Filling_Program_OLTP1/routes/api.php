<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\testController;


Route::get('/test', [testController::class, 'doSomething']);
