<?php

use App\Http\Controllers\RegistrationController;
use App\Http\Controllers\PageController;
use Illuminate\Support\Facades\Route;

Route::get('/home', function () {
    return view('welcome');
})->name('home');

Route::get('/registration-list', [RegistrationController::class, 'index'])->name('registration-list');

Route::get('/about', [PageController::class, 'about'])->name('about');
Route::get('/contact', [PageController::class, 'contact'])->name('contact');
