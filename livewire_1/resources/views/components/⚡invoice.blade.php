<?php

use Livewire\Component;
use Livewire\WithFileUploads;
use App\Models\Invoice;
use Livewire\WithPagination;
use Livewire\Attributes\Computed;
use Livewire\Attributes\Url;

new class extends Component {
    use WithFileUploads, WithPagination;

    public $invoice_number,
        $amount,
        $payment_method,
        $gender,
        $invoice_file,
        $hobbies = [];
    // public $invoices;
    public $condition = false;

    protected $rules = [
        'invoice_number' => ['required'],
        'amount' => ['required', 'numeric'],
        'invoice_file' => ['required', 'file', 'mimes:pdf', 'max:2048'],
    ];

    public function updated($propertyName)
    {
        $this->validateOnly($propertyName);
    }

    public function submitForm()
    {
        $this->validate();

        $invoiceFile = $this->invoice_file->store('invoices', 'public');
        Invoice::create([
            'invoice_number' => $this->invoice_number,
            'amount' => $this->amount,
            'invoice_file' => $invoiceFile,
        ]);
        $this->reset('invoice_number', 'amount', 'invoice_file');

        // $this->dispatch('sweet.alert', message: 'Invoice Generated successfully!');
        // $this->mount();
    }

    // public function mount(){
    //     $this->invoices= Invoice::latest()->get();
    // }

    #[Url]
    public $search;
    #[Computed]
    public function invoices()
    {
        return Invoice::where('invoice_number', 'LIKE', "%{$this->search}%")
            ->orWhere('amount', 'LIKE', "%{$this->search}%")
            ->paginate(3);
    }

    public function downloadFile($id)
    {
        $data = Invoice::findOrFail($id);
        return response()->download(storage_path('app/public/' . $data->invoice_file), $data->invoice_number . '.pdf');
    }

    public function resetForm()
    {
        $this->reset('invoice_number', 'amount', 'invoice_file');
        // $this->invoice_number = '';
        // $this->amount = '';
        // $this->invoice_file = '';
    }

    public function delete($id)
    {
        Invoice::findOrFail($id)->delete();
        session()->flush('success', 'Data Deleted successfully');
    }

    public function toggle()
    {
        $this->condition = !$this->condition;
    }

    // public function placeholder()
    // {
    //     return <<<'HTML'

    //     <div >

    //         <img src="https://www.freeiconspng.com/uploads/spinner-icon-0.gif" class="mx-auto d-block" style="width:48px; height: 48px; margin-top:200px;"/>

    //         </div>
    //     HTML;
    // }
};
?>

<div>
    <form action="" wire:submit="submitForm">
        <div class="row">
            <div class="col-md-2">
                <label for="invoice_number">Invoice Number</label>
            </div>
            <div class="col-md-10 mb-3">
                <input type="text" wire:model="invoice_number" class="form-control" placeholder="Enter Number">
                @error('invoice_number')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>

            <div class="col-md-2">
                <label for="amount">Amount</label>
            </div>
            <div class="col-md-10 mb-3">
                <input type="amount" wire:model="amount" class="form-control" placeholder="Enter amount">
                @error('amount')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>

            <div class="col-md-2">
                <label for="invoice_file"> Invoice PDF</label>
            </div>
            <div class="col-md-10 mb-3">
                <input type="file" wire:model="invoice_file" class="form-control">
                @error('invoice_file')
                    <span class="text-danger">{{ $message }}</span>
                @enderror
            </div>

            <div class="col-md-12 text-end">
                <button class="btn btn-primary">Submit</button>
                <button class="btn btn-secondary" wire:click.prevent="resetForm">Reset</button>
            </div>

            <div>
                <input type="checkbox" class="" wire:click="toggle">
                <label for="tertms">Terms and Condition!</label>
            </div>

            @if($this->condition)
            <div class="p-2" style="background: rgb(207, 226, 207)"
            wire:transition.opacity.duration.'500ms'>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit nisi molestias amet fuga suscipit ea
                    ipsum, maxime vero est officiis et aut, repellat voluptatibus? Aliquid totam magnam voluptatum, unde
                    molestiae iusto, saepe culpa praesentium nemo similique quae. Aliquam, perferendis? Possimus sed,
                    natus voluptatibus quasi facilis ea nihil quaerat qui omnis.</p>
            </div>
            @endif


        </div>
    </form>

    <div class="row">
        <div class="col-md-12">
            <div class="">
                <h2 class="text-center py-2 fw-bolde fs-4">Invoice List Information</h2>
                <div class="mb-4">
                    <input type="text" wire:model="search" class="form-control" placeholder="Search Invoice">
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>SL</th>
                        <th>Invoice Number</th>
                        <th>Invoice Amount</th>
                        <th>PDF file</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($this->invoices as $key => $item)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td>{{ $item->invoice_number }}</td>
                            <td>{{ $item->amount }}</td>
                            <td><button wire:click="downloadFile({{ $item->id }})"
                                    class="btn btn-primary">Download</button></td>
                            <td><button wire:click="delete({{ $item->id }})" class="btn btn-danger"
                                    wire:confirm.prompt="Are you sure?\n\nType DELETE to confirm|DELETE">delete</button>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="d-flex justify-content-center mt-2">
        {{ $this->invoices->links('pagination::bootstrap-5') }}
    </div>
</div>
