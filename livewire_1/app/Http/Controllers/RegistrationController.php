<?php

namespace App\Http\Controllers;

use App\Models\Registration;
use Illuminate\Http\Request;

class RegistrationController extends Controller
{
    public function index(){
        $list = Registration::latest()->get();
        return view('registration_list', compact('list'));
    }
}
