<?php

namespace App\Http\Controllers;

use App\Models\Bank;
use App\Models\User;
use App\Models\Userdetail;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $bank = Bank::All();

        $data = [
            'title' => 'Registration',
            'bank' => $bank,
        ];
        return view('auth.register2', $data);
    }
    public function proses_register(Request $request)
    {
        // dd($request->all());
        // Validasi form
        $validator = Validator::make($request->all(), [
            'idcardnumber' => 'required|digits:16',
            'idcardfile' => 'required|image|mimes:jpeg,png,jpg,gif', // Validasi untuk gambar dengan maksimal ukuran 100KB
            'taxcardnumber' => 'min:15|max:16',
            'taxcardfile' => 'image|mimes:jpeg,png,jpg,gif', // Validasi untuk gambar dengan maksimal ukuran 100KB
            'fullnameinbankcover' => 'required',
            'beneficiarybankcode' => 'required|max:12',
            'beneficiaryaccountnumber' => 'required|max:20',
            'coverbookbankfile' => 'required|image|mimes:jpeg,png,jpg,gif', // Validasi untuk gambar dengan maksimal ukuran 100KB
            'maritalstatus' => 'required',
            // 'familycardfile' => 'required|image|mimes:jpeg,png,jpg,gif|max:100', // Validasi untuk gambar dengan maksimal ukuran 100KB
            'address' => 'required',
            'terms' => 'required',
            'captcha' => 'required|captcha',
        ]);
// dd($validator->validated());
        // Cek jika validasi gagal
        // if ($validator->fails()) {
        //     return back()->withErrors($validator)->withInput()->with('error', 'Validation failed!'); // Mengembalikan ke halaman sebelumnya dengan pesan error
        // }

        //upload files
        if ($request->hasFile('idcardfile')) {
            $idcardfile = $request->file('idcardfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameIdCard = uniqid() . '.' . $idcardfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $w = Image::make($idcardfile)->width();
            $h = Image::make($idcardfile)->height();
            Image::make($idcardfile)
                ->resize($w / 3, $h / 3)
                ->save('assets/img/' . $fileNameIdCard, 10);
            // $idcardfile->move(public_path('assets/img'), $fileNameIdCard);
        }
        if ($request->hasFile('taxcardfile')) {
            $taxcardfile = $request->file('taxcardfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameTaxCard = uniqid() . '.' . $taxcardfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $w = Image::make($taxcardfile)->width();
            $h = Image::make($taxcardfile)->height();
            Image::make($taxcardfile)
                ->resize($w / 3, $h / 3)
                ->save('assets/img/' . $fileNameTaxCard, 10);
            // $taxcardfile->move(public_path('assets/img'), $fileNameTaxCard);
        }
        if ($request->hasFile('coverbookbankfile')) {
            $coverbookbankfile = $request->file('coverbookbankfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameCoverBank = uniqid() . '.' . $coverbookbankfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $w = Image::make($coverbookbankfile)->width();
            $h = Image::make($coverbookbankfile)->height();
            Image::make($coverbookbankfile)
                ->resize($w / 3, $h / 3)
                ->save('assets/img/' . $fileNameCoverBank, 10);
            // $coverbookbankfile->move(public_path('assets/img'), $fileNameCoverBank);
        }
        if ($request->hasFile('familycardfile')) {
            $familycardfile = $request->file('familycardfile');
            // Buat nama file acak dengan ekstensi yang sesuai
            $fileNameFamilyCard = uniqid() . '.' . $familycardfile->getClientOriginalExtension();
            // Pindahkan file foto ke direktori yang ditentukan dengan nama yang diacak
            $w = Image::make($familycardfile)->width();
            $h = Image::make($familycardfile)->height();
            Image::make($familycardfile)
                ->resize($w / 3, $h / 3)
                ->save('assets/img/' . $fileNameFamilyCard, 10);
            // $familycardfile->move(public_path('assets/img'), $fileNameFamilyCard);
        }

        // Buat koleksi baru
        Userdetail::create([
            'id_user' => decrypt(session('user_id')),
            'id_card_number' => $request->idcardnumber,
            'id_card_file' => $fileNameIdCard,
            'tax_card_number' => $request->taxcardnumber,
            'tax_card_file' => $fileNameTaxCard,
            'bank_full_name' => $request->fullnameinbankcover,
            'bank_code' => $request->beneficiarybankcode,
            'bank_account_number' => $request->beneficiaryaccountnumber,
            'bank_book' => $fileNameCoverBank,
            'marital_status' => $request->maritalstatus,
            'family_card' => isset($fileNameFamilyCard) ?? $fileNameFamilyCard,
            'address' => $request->address,
        ]);

        $user = User::findOrFail(decrypt(session('user_id')));

        if ($user) {
            $user->update([
                'register_2' => now(),
            ]);
        }

        return redirect()->route('home_user')->with('success', 'Registration was complete');
    }
}
