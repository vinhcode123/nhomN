<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\homeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/
Route::get('dashboard', [CustomAuthController::class, 'dashboard']);
Route::get('login', [CustomAuthController::class, 'index'])->name('login');
Route::post('custom-login', [CustomAuthController::class, 'customLogin'])->name('login.custom');
Route::get('registration', [CustomAuthController::class, 'registration'])->name('register-user');
Route::post('custom-registration', [CustomAuthController::class, 'customRegistration'])->name('register.custom');
Route::get('signout', [CustomAuthController::class, 'signOut'])->name('signout');
Route::get('trangchu', [homeController::class, 'trangchu'])->name('trangchu');
Route::get('detail_user/{id}', [CustomAuthController::class, 'getUserById'])->name('detail_user');
Route::get('404', [CustomAuthController::class, '_404'])->name('404');
Route::get('account', [CustomAuthController::class, 'account'])->name('account');
Route::get('blog-archive-2', [CustomAuthController::class, 'blog2'])->name('blog2');
Route::get('blog-archive', [CustomAuthController::class, 'blog1'])->name('blog1');
Route::get('blog-single', [CustomAuthController::class, 'blog'])->name('blog');
Route::get('cart', [CustomAuthController::class, 'cart'])->name('cart');
Route::get('checkout', [CustomAuthController::class, 'checkout'])->name('checkout');
Route::get('contact', [CustomAuthController::class, 'contact'])->name('contact');
Route::get('index', [CustomAuthController::class, 'indexUser'])->name('index');
Route::get('product-detail', [CustomAuthController::class, 'product_detail'])->name('product_detail');
Route::get('product', [CustomAuthController::class, 'product'])->name('product');
Route::get('wishlist', [CustomAuthController::class, 'wishlist'])->name('wishlist');
Route::post('cart/{id}, ', [CartController::class], 'cart');
Route::get('index5', [CustomAuthController::class, 'index5']);
Route::get('index6', [CustomAuthController::class, 'index6']);
Route::get('index7', [CustomAuthController::class, 'index7']);