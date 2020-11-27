<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;
    protected $fillable = [
        'codigo',
        'titulo',
        'descripcion',
        'apertura',
        'users_id',
    ];
    public function categorias(){
        return $this->belongsToMany('App\Models\Categoria','Categorias_has_tickets');
    }
}
