<?php

use Livewire\Component;

new class extends Component
{
    public $counter = 0;
    public $name = "";

    public function increment(){
        return $this->counter++;
    }
    public function decrement(){
        return $this->counter--;
    }

};
?>

<div>
    <h1>I am coming from the counter page</h1>

    <p>Counter : {{ $counter }}</p>
    <button  wire:click="increment">Increment</button>
    <button wire:click="decrement">Decrement</button>

    <hr>
    <input type="text" wire:model.live="name" placeholder="Enter your name">
    <p>Name : {{ $name }}</p>

</div>
