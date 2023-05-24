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

    public function customLogin(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
             if (auth()->user()->role == '1') {
                return redirect()->route('admin');
            }
            return redirect()->intended('/')
                ->withSuccess('Signed in');
        }

        return redirect("index")->withSuccess('Login details are not valid');
    }

    public function registration()
    {
        return view('auth.registration');
    }


    public function AddUser(Request $request)
    {
        return view('Admin/AddUser');
    }

    public function customRegistration(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6'
        ], [
                'password.confirmed' => 'The password confirmation does not match.',
            ]);

        // Tạo user mới và lưu vào CSDL
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->save();

        return redirect("account")->withSuccess('You have signed-in');
    }
    public function RegisterUsersAdmin(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6'
        ], [
                'password.confirmed' => 'The password confirmation does not match.',
            ]);

        // Tạo user mới và lưu vào CSDL
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->save();

        return redirect("index6")->withSuccess('You have signed-in');
    }

    
    public function DeleteUser(Request $request)
    {
        User::where('id', $request->deleteID)->delete();

        return redirect("index6")->withSuccess('You have signed-in');
    }



    public function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password'])
        ]);
    }
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

    // Hien thi san pham theo danh muc
    public function indexUserCustomer()
    {
        $categories = Categorys::with([
            'products' => function ($query) {
                $query->join('products_image', 'products.id', '=', 'products_image.products_id')
                    ->select('products.*', 'products_image.img_name');
            }
        ])->get();

        return view('home.index', compact('categories'));
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
    public function index5()
    {
        return view('admin.index5');
    }
    public function index6()
    {
        $users = User::all();

        return view('admin.index6',compact('users'));
    }
    public function index7()
    {
        $categories = Categorys::with([
            'products' => function ($query) {
                $query->join('products_image', 'products.id', '=', 'products_image.products_id')
                    ->select('products.*', 'products_image.img_name');
            }
        ])->get();
        
    //    $products = Products::all();
        return view('admin.index7', compact('categories') );
    }
}
