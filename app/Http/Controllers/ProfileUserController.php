<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\User;
use App\Models\Userdetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProfileUserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $menu = Menu::with('children')->whereNull('parent_id')->where('roles', 'LIKE', '%'.auth()->user()->status.'%')->get();
        $user = User::where('id', decrypt(session('user_id')))->first();
        $userDetail = Userdetail::where('id_user', decrypt(session('user_id')))->first();

        $data = [
            'title' => "Profile User",
            'menu'  => $menu,
            'user'  => $user,
            'userDetail'  => $userDetail,
        ];
        return view('user.profile', $data);
    }
    public function update_detail(Request $request)
    {
        // Validasi form
        $validator = Validator::make($request->all(), [
            'idcardnumber' => 'min:16|max:16',
            'idcardfile' => 'image|mimes:jpeg,png,jpg,gif|max:100', // Validasi untuk gambar dengan maksimal ukuran 100KB
            'taxcardnumber' => 'min:15|max:16',
            'taxcardfile' => 'image|mimes:jpeg,png,jpg,gif|max:100',
            'beneficiarybankcode' => 'max:12',
            'beneficiaryaccountnumber' => 'max:20',
            'coverbookbankfile' => 'image|mimes:jpeg,png,jpg,gif|max:100',
            'familycardfile' => 'image|mimes:jpeg,png,jpg,gif|max:100'
        ]);
        // [
        //     'idcardnumber.required' => 'ID Card Number required.',
        //     'idcardnumber.min' => 'ID Card Number must be at least 16 characters.',
        //     'idcardnumber.max' => 'ID Card Number must be 16 characters.',
        // ]

        // Cek jika validasi gagal
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput()->with('error', 'Validation failed!'); // Mengembalikan ke halaman sebelumnya dengan pesan error
        }

        //upload files
        if ($request->hasFile('idcardfile')) {
            $idcardfile = $request->file('idcardfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameIdCard = uniqid() . '.' . $idcardfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $idcardfile->move(public_path('assets/img'), $fileNameIdCard);
        }
        if ($request->hasFile('taxcardfile')) {
            $taxcardfile = $request->file('taxcardfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameTaxCard = uniqid() . '.' . $taxcardfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $taxcardfile->move(public_path('assets/img'), $fileNameTaxCard);
        }
        if ($request->hasFile('coverbookbankfile')) {
            $coverbookbankfile = $request->file('coverbookbankfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameCoverBank = uniqid() . '.' . $coverbookbankfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $coverbookbankfile->move(public_path('assets/img'), $fileNameCoverBank);
        }
        if ($request->hasFile('familycardfile')) {
            $familycardfile = $request->file('familycardfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameFamilyCard = uniqid() . '.' . $familycardfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $familycardfile->move(public_path('assets/img'), $fileNameFamilyCard);
        }

        $userId = decrypt(session('user_id'));
        $userDetail = UserDetail::findOrFail($userId);

        if ($userDetail) {
            $userDetail->update([
                'id_card_number' => $request->idcardnumber,
                'id_card_file' => $fileNameIdCard,
                'tax_card_number' => $request->taxcardnumber,
                'tax_card_file' => $fileNameTaxCard,
                'bank_full_name' => $request->fullnameinbankcover,
                'bank_code' => $request->beneficiarybankcode,
                'bank_account_number' => $request->beneficiaryaccountnumber,
                'bank_book' => $fileNameCoverBank,
                'marital_status' => $request->maritalstatus,
                'family_card' => $fileNameFamilyCard,
                'address' => $request->address,
            ]);
        }

        return redirect()->back()->with('success', 'Update Detail Profile Success');
    }
}
