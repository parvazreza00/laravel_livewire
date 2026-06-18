<?php

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\Post;


new class extends Component {

    public $openForm = false;
    public $openEditForm = false;
    public $title, $description,$postId;

    #[Computed]
    public function posts(){
        return Post::latest()->get();
    }

    public function showForm()
    {
        $this->openForm = true;
        $this->openEditForm = false;
        $this->reset('title','description');
    }
    public function closeForm()
    {
        $this->openForm = false;
        $this->openEditForm = false;
    }

    protected $rules = [
        'title' => ['required'],
        'description' => ['required'],
    ];

    public function updated($propertyName)
    {
        $this->validateOnly($propertyName);
    }
    public function saveForm()
    {
        $this->validate();

        Post::create([
            'title' => $this->title,
            'description' => $this->description,
        ]);
        $this->reset();
    }

    public function editPost($id)
    {
        $editPost = Post::find($id);
        // dd($editPost);
        $this->title = $editPost->title;
        $this->description = $editPost->description;
        $this->postId = $editPost->id;
        $this->openEditForm = true;
        $this->openForm = false;
    }

    public function updateForm() {
        $post = Post::find($this->postId);
        // dd($post);
        $post->update([
            'title' => $this->title,
            'description' => $this->description,
        ]);
        $this->reset();

    }

    public function deletePost($id){
        Post::find($id)->delete();    }
};
?>

<div>



    @if ($openForm)
        @include('post_form')
    @endif

    @if ($openEditForm)
        @include('post_edit_form')
    @endif



    <div>
        <button class="btn btn-primary my-2" wire:click="showForm">Create</button>
    </div>

    <table class="table table-bordered">
        <thead>
            <tr class="text-center">
                <th scope="col">SL</th>
                <th scope="col">Title</th>
                <th scope="col">Desctription</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            @if ($this->posts->count() > 0)
                @foreach ($this->posts as $key => $post)
                    <tr class="text-center">
                        <th scope="row">{{ $key + 1 }}</th>
                        <td>{{ $post->title }}</td>
                        <td class="w-75">{{ $post->description }}</td>
                        <td>
                            <button class="btn btn-danger mb-1" wire:confirm="Are you sure to delete?" wire:click="deletePost({{ $post->id }})">Delete</button>
                            <button class="btn btn-info"  wire:click="editPost({{ $post->id }})">Edit</button>
                        </td>
                    </tr>
                @endforeach
            @else
                <tr class="text-center">
                    <td>There have no data</td>
                </tr>
            @endif


        </tbody>
    </table>

</div>
