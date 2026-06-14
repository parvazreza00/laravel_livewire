<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    <div class="row my-4 text-center">
        <div class="col-md-12">
            <a href="{{ route('home') }}" wire:navigate.hover wire:current.exact="fw-bold bg-primary text-white ">Home</a>
            <a href="{{ route('about') }}" wire:navigate.hover wire:current="fw-bold bg-primary text-white ">About</a>
            <a href="{{ route('contact') }}" wire:navigate.hover wire:current="fw-bold bg-primary text-white">Contact</a>
        </div>
    </div>

</body>
</html>
