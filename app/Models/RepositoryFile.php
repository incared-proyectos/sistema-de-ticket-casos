<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RepositoryFile extends Model
{
    use HasFactory;
    protected $table = 'repository_files';

    protected $fillable = [
        'original_name',
        'name_file',
        'type_file',
        'src_file',
        'user_id'
    ];
}
