<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>@yield('title')</title>

        @fonts

        <!-- Styles / Scripts -->
        @if (file_exists(public_path('build/manifest.json')) || file_exists(public_path('hot')))
            @vite(['resources/css/app.css', 'resources/js/app.js'])
        @else

        @endif
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    @livewireStyles

    </head>
    <body>

        <div class="container mt-4">

           <main>
             @include('layouts.navbar')
            @yield('content')
           </main>

        </div>


        @livewireScripts

        <script>
            Livewire.on('sweet.alert', (event) => {
                Swal.fire({
                    title: "Good job!",
                    text: event.message,
                    icon: "success"
                });
            });
       </script>
    </body>
</html>
