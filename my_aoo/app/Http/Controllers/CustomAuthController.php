<?php
namespace App\Http\Controllers;

use App\Models\Categorys;
use App\Models\Products;
use App\Models\User;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Session;
use Termwind\Components\Dd;


//Unknow
class CustomAuthController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }

    public function getUserById($id)
    {
        $users = User::where('id', $id)->first();
        return view('trangchitiet', compact('users'));
        // return redirect("login")->withSuccess('Login details are not valid');
    }
    public function customLogin(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            return redirect()->intended('index ')
                ->withSuccess('Signed in');
        }

        return redirect("index")->withSuccess('Login details are not valid');
    }

    public function registration()
    {
        return view('auth.registration');
    }

    public function customRegistration(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
        ]);

        // Tạo user mới và lưu vào CSDL
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->save();

        return redirect("account")->withSuccess('You have signed-in');
    }

    public function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password'])
        ]);
    }

    // public function dashboard()
    // {
    //     if (Auth::check()) {
    //         return view('dashboard');
    //     }

    //     return redirect("login")->withSuccess('You are not allowed to access');
    // }

    public function signOut()
    {
        Session::flush();
        Auth::logout();

        return Redirect('login');
    }
    public function _404()
    {
        return view('404');
    }
    public function account()
    {
        return view('account');
    }
    public function blog2()
    {
        return view('blog-archive-2');
    }
    public function blog1()
    {
        return view('blog-archive');
    }
    public function blog()
    {
        return view('blog-single');
    }
    public function cart()
    {
        return view('cart');
    }
    public function checkout()
    {
        return view('checkout');
    }
    public function contact()
    {
        return view('contact');
    }
    public function indexUser()
    {
        $categories = Categorys::with(['products' => function ($query) {
            $query->join('products_image', 'products.id', '=', 'products_image.products_id')
                  ->select('products.*', 'products_image.img_name');
        }])->get();
        return view('index', compact('categories'));
    }

    public function product_detail()
    {
        return view('product-detail');
    }
    public function product()
    {
        return view('product');
    }
    public function wishlist()
    {
        return view('wishlist');
    }
     public function index5(){
        return view('index5');
     }
     public function index6(){
        return view('index6');
     }
     public function index7(){
        return view('index7');
     }
}
