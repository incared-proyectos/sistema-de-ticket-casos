<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ReportLine;
class Report extends Model
{
    use HasFactory;
    protected $fillable = [
        'number',
        'code',
        'empresa_id'
    ];
  
}
