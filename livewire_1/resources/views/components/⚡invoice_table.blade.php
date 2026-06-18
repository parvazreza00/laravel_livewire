<?php

use Livewire\Component;

new class extends Component
{
    public $invoices;
};
?>

<div>
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
                        <th>Status</th>
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

                             <td wire:poll.20s>
                                @if($item->status==='pending')
                                <span class="badge bg-danger p-2 rounded">{{ $item->status }}</span>
                                @elseif($item->status === 'approved')
                                 <span class="badge bg-success p-2 rounded">{{ $item->status }}</span>
                                 @elseif($item->status === 'sumbit')
                                  <span class="badge bg-info p-2 rounded">{{ $item->status }}</span>
                                  @endif
                            </td>

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
