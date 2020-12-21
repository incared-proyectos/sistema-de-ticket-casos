<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mensaje extends Model
{
    use HasFactory;
    protected $fillable = [
        'from_id',
        'mensaje',
        'file_src',
        'img_src',
        'notice_message',
        'ticket_id',
    ];
}
