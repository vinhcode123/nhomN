<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products_Image extends Model
{
    use HasFactory;
    protected $primaryKey = 'id';
    protected $fillable = [
        'img_name',
        'products_id',
    ];
}
