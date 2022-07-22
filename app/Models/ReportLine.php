<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportLine extends Model
{
    use HasFactory;
    protected $table = 'report_lines';
    protected $fillable = [
        'title',
        'description',
        'page_type',
        'report_id'
    ];

}
