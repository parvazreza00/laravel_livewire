<div>
    <form wire:submit="updateForm">
        <div class="mb-3">
            
            <label for="title" class="form-label">Titel</label>
            <input type="text" class="form-control" wire:model.live="title">
            @error('title')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <input type="text" class="form-control" id="description" wire:model.live="description">
            @error('description')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="text-center">
            <button class="btn btn-primary">Update</button>
            <button type="button" class="btn btn-danger" wire:click="closeForm">Cancel</button>
        </div>
    </form>
</div>
