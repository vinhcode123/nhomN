<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    use HasFactory;

    protected $table = 'products';
    protected $primaryKey = 'id';
    protected $fillable = ['products_name','products_price', 'description', 'categorys_id','quality'];
    
    public function category()
    {
        return $this->belongsTo(Categorys::class);
    }
}