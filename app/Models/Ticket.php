<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Ticket extends Model
{
    use HasFactory;
    use LogsActivity;

    protected $fillable = [
        'codigo',
        'titulo',
        'descripcion',
        'apertura',
        'fecha_caducidad',
        'status',
        'users_id',
        'users_asigne_json',
    ];

    protected static $logAttributes = [        
        'codigo',
        'titulo',
        'descripcion',
        'apertura',
        'fecha_caducidad',
        'status',
        'users_asigne_json',
    ];

    protected static $logOnlyDirty = true;

    protected static $submitEmptyLogs = false;


    public function categorias(){
        return $this->belongsToMany('App\Models\Categoria','categorias_has_tickets');
    }
    public function users(){
        return $this->belongsTo('App\Models\User');
    }
}
