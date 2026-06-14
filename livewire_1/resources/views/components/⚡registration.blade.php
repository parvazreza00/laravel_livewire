<?php

use Livewire\Component;
use Livewire\WithFileUploads;
use App\Models\Registration;

new class extends Component {
    use WithFileUploads;

    public $name, $email, $password, $image;

    protected $rules = [
        'name' => ['required', 'min:3', 'max:10'],
        'email' => ['required', 'email'],
        'password' => ['required', 'min:6', 'max:15'],
        'image' => ['required'],
    ];

    public function updated($propertyName)
    {
        $this->validateOnly($propertyName);
    }

    public function submitForm()
    {
        $this->validate();

        $imagePaht = $this->image->store('register_images', 'public');
        Registration::create([
            'name' => $this->name,
            'email' => $this->email,
            'password' => $this->password,
            'image' => $imagePaht,
        ]);

        $this->reset('name', 'email', 'password', 'image');

        // $this->dispatch('sweet.alert', message: 'Registerd successfully!');
        // return redirect()->route('registration-list')->with('success','Registerd successfully!');
        $this->js("Livewire:navigate('registration-list')");
    }
};
?>

<div>
    <div class="">
        <h2>Registration</h2>
        <form action="" wire:submit.prevent="submitForm">
            <div class="row">
                <div class="col-md-2">
                    <label for="name">Name</label>
                </div>
                <div class="col-md-10 mb-3">
                    <input type="text" wire:model.live="name" class="form-control" placeholder="Enter Name">
                    @error('name')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>

                <div class="col-md-2">
                    <label for="email">Email</label>
                </div>
                <div class="col-md-10 mb-3">
                    <input type="email" wire:model.live="email" class="form-control" placeholder="Enter Email">
                    @error('email')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>

                <div class="col-md-2">
                    <label for="password"> Password</label>
                </div>
                <div class="col-md-10 mb-3">
                    <input type="password" wire:model.live="password" class="form-control" placeholder="Enter password">
                    @error('password')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="col-md-2">
                    <label for="image"> Image</label>
                </div>
                <div class="col-md-10 mb-3">
                    <input type="file" wire:model.live="image" class="form-control">
                    @error('image')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                    @if ($image)
                        <img src="{{ $image->temporaryUrl() }}" alt="" class="fornded"
                            style="width: 150px;height: 150px">
                    @else
                    @endif
                </div>
                <div class="col-md-12 text-end">
                    <button class="btn btn-primary">Submit</button>
                </div>

            </div>
        </form>
    </div>
</div>
