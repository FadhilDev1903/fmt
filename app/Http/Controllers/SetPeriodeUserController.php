<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Periodeshoplist;
use App\Models\Project;
use App\Models\Shoplist;
use DateTime;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Yajra\DataTables\DataTables as DataTables;

class SetPeriodeUserController extends Controller
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
        $project = Shoplist::select('project')->where('country', session('country_user'))->distinct()->get();
        // $project = Project::select('id', 'name')->where('country', session('country_user'))->get();
        $channel = Shoplist::select('channel_name')->where('country', session('country_user'))->distinct()->get();
        $shop_type = Shoplist::select('shop_type')->where('country', session('country_user'))->distinct()->get();
        $city = Shoplist::select('city')->where('country', session('country_user'))->distinct()->get();
        $region = Shoplist::select('region')->where('country', session('country_user'))->distinct()->get();
        $region2 = Shoplist::select('region2')->where('country', session('country_user'))->distinct()->get();
        $organisat_type = Shoplist::select('organisat_type')->where('country', session('country_user'))->distinct()->get();
        $metode_konversi = Shoplist::select('metode_konversi')->where('country', session('country_user'))->distinct()->get();
        $base_staff = Shoplist::select('base_staff')->where('country', session('country_user'))->distinct()->get();
        $spv = Shoplist::select('spv')->where('country', session('country_user'))->distinct()->get();
        $collector = Shoplist::select('data_collector')->where('country', session('country_user'))->distinct()->get();
        $data = [
            'title' => 'Set Periode',
            'menu' => $menu,
            'project' => $project,
            'channel' => $channel,
            'shop_type' => $shop_type,
            'city' => $city,
            'region' => $region,
            'region2' => $region2,
            'organisat_type' => $organisat_type,
            'metode_konversi' => $metode_konversi,
            'base_staff' => $base_staff,
            'spv' => $spv,
            'collector' => $collector,
        ];
        return view('user.setperiode', $data);
    }

    public function allData()
    {
        $data = Shoplist::with('detailchange')->select('id', 'shop_name', 'shop_type', 'shopsize1', 'city', 'region', 'data_collector', 'spv')->get();

        // Encrypt the IDs
        $encryptedProjects = $data->map(function ($project) {
            $project->ids = encrypt($project->id);
            return $project;
        });

        // Tambahkan nomor urut ke setiap proyek
        $counter = 1;
        foreach ($encryptedProjects as $project) {
            $project->no = $counter++;
        }

        return DataTables::of($encryptedProjects)->make(true);
    }

    public function createData(Request $request)
    {
        //validate form
        $this->validate($request, [
            'file' => 'required|mimes:csv,xls,xlsx|max:2048',
            'start_date' => 'required',
            'end_date' => 'required',
        ]);
        // Create a DateTime object from the original string, using the 'd/m/Y' format
        $dateTimeStart = DateTime::createFromFormat('d/m/Y', $request->start_date);
        $dateTimeEnd = DateTime::createFromFormat('d/m/Y', $request->end_date);

        // Format the DateTime object as 'Y-m-d'
        $formattedDateStart = $dateTimeStart->format('Y-m-d');
        $formattedDateEnd = $dateTimeEnd->format('Y-m-d');

        //upload files
        $file = $request->file('file');
        // Check if file is present
        if ($file) {
            // Load the Excel file
            $spreadsheet = IOFactory::load($file);

            // Get the first worksheet
            $worksheet = $spreadsheet->getActiveSheet();

            // Get the highest row number
            $highestRow = $worksheet->getHighestRow();

            // Start from row 2 to skip header row
            for ($row = 2; $row <= $highestRow; $row++) {
                $project = $worksheet->getCell('A' . $row)->getValue();
                $sh_type = $worksheet->getCell('B' . $row)->getValue();
                $gsnr = $worksheet->getCell('C' . $row)->getValue();
                $shop_name = $worksheet->getCell('D' . $row)->getValue();
                $city = $worksheet->getCell('E' . $row)->getValue();
                $channel_name = $worksheet->getCell('F' . $row)->getValue();
                $shop_type = $worksheet->getCell('G' . $row)->getValue();
                $assembled = $worksheet->getCell('H' . $row)->getValue();
                $a_clients = $worksheet->getCell('I' . $row)->getValue();
                $region = $worksheet->getCell('J' . $row)->getValue();
                $region2 = $worksheet->getCell('K' . $row)->getValue();
                $organisat_type = $worksheet->getCell('L' . $row)->getValue();
                $shopsize1 = $worksheet->getCell('M' . $row)->getValue();
                $sample_status = $worksheet->getCell('N' . $row)->getValue();
                $metode_konversi = $worksheet->getCell('O' . $row)->getValue();
                $penyampaian_ke_gfK = $worksheet->getCell('P' . $row)->getValue();
                $datadeliverytyp = $worksheet->getCell('Q' . $row)->getValue();
                $schedule = $worksheet->getCell('R' . $row)->getValue();
                $data_collector = $worksheet->getCell('S' . $row)->getValue();
                $base_staff = $worksheet->getCell('T' . $row)->getValue();
                $area = $worksheet->getCell('U' . $row)->getValue();
                $street = $worksheet->getCell('V' . $row)->getValue();
                $delivery_address = $worksheet->getCell('W' . $row)->getValue();
                $courier = $worksheet->getCell('X' . $row)->getValue();
                $telephone = $worksheet->getCell('Y' . $row)->getValue();
                $mobile_phone = $worksheet->getCell('Z' . $row)->getValue();
                $contact_person = $worksheet->getCell('AA' . $row)->getValue();
                $v_type = $worksheet->getCell('AB' . $row)->getValue();
                $v_amount = $worksheet->getCell('AC' . $row)->getValue();
                $kelipatan_25 = $worksheet->getCell('AD' . $row)->getValue();
                $spv = $worksheet->getCell('AE' . $row)->getValue();
                $spv_id = $worksheet->getCell('AF' . $row)->getValue();

                $periodeShoplist = Periodeshoplist::where('periodeshoplist_gsnr', $gsnr)->get();
                $shoplist = Shoplist::where('gsnr', $gsnr)->get();

                // Check if $gsnr is not null before proceeding
                if ($gsnr !== null) {
                    $periodeShoplist = Periodeshoplist::where('periodeshoplist_gsnr', $gsnr)->first();
                    $shoplist = Shoplist::where('gsnr', $gsnr)->first();

                    if (!$periodeShoplist) {
                        Periodeshoplist::create([
                            'periode_startdate' => $formattedDateStart,
                            'periode_enddate' => $formattedDateEnd,
                            'periodeshoplist_name' => $request->periode_name,
                            'periodeshoplist_gsnr' => $gsnr,
                            'periodeshoplist_inputdate' => date('Y-m-d'),
                        ]);
                    } else {
                        $periodeShoplist->update([
                            'periode_startdate' => $formattedDateStart,
                            'periode_enddate' => $formattedDateEnd,
                            'periodeshoplist_name' => $request->periode_name,
                            'periodeshoplist_inputdate' => date('Y-m-d'),
                        ]);
                    }

                    if (!$shoplist) {
                        // Create new entry if shoplist not found
                        Shoplist::create([
                            'project' => $project,
                            'sh_type' => $sh_type,
                            'gsnr' => $gsnr,
                            'shop_name' => $shop_name,
                            'city' => $city,
                            'channel_name' => $channel_name,
                            'shop_type' => $shop_type,
                            'assembled' => $assembled,
                            'a_clients' => $a_clients,
                            'region' => $region,
                            'region2' => $region2,
                            'organisat_type' => $organisat_type,
                            'shopsize1' => $shopsize1,
                            'sample_status' => $sample_status,
                            'metode_konversi' => $metode_konversi,
                            'penyampaian_ke_gfK' => $penyampaian_ke_gfK,
                            'datadeliverytyp' => $datadeliverytyp,
                            'schedule' => $schedule,
                            'data_collector' => $data_collector,
                            'base_staff' => $base_staff,
                            'area' => $area,
                            'street' => $street,
                            'delivery_address' => $delivery_address,
                            'courier' => $courier,
                            'telephone' => $telephone,
                            'mobile_phone' => $mobile_phone,
                            'contact_person' => $contact_person,
                            'v_type' => $v_type,
                            'v_amount' => $v_amount,
                            'kelipatan_25' => $kelipatan_25,
                            'spv' => $spv,
                            'spv_id' => $spv_id,
                            'country' => session('country_user'),
                            'nameofshop' => $gsnr . '-' . $shop_name . '-' . $city,
                        ]);
                    } else {
                        // Update existing shoplist entry
                        $shoplist->update([
                            'project' => $project,
                            'sh_type' => $sh_type,
                            'shop_name' => $shop_name,
                            'city' => $city,
                            'channel_name' => $channel_name,
                            'shop_type' => $shop_type,
                            'assembled' => $assembled,
                            'a_clients' => $a_clients,
                            'region' => $region,
                            'region2' => $region2,
                            'organisat_type' => $organisat_type,
                            'shopsize1' => $shopsize1,
                            'sample_status' => $sample_status,
                            'metode_konversi' => $metode_konversi,
                            'penyampaian_ke_gfK' => $penyampaian_ke_gfK,
                            'datadeliverytyp' => $datadeliverytyp,
                            'schedule' => $schedule,
                            'data_collector' => $data_collector,
                            'base_staff' => $base_staff,
                            'area' => $area,
                            'street' => $street,
                            'delivery_address' => $delivery_address,
                            'courier' => $courier,
                            'telephone' => $telephone,
                            'mobile_phone' => $mobile_phone,
                            'contact_person' => $contact_person,
                            'v_type' => $v_type,
                            'v_amount' => $v_amount,
                            'kelipatan_25' => $kelipatan_25,
                            'spv' => $spv,
                            'spv_id' => $spv_id,
                            'country' => session('country_user'),
                            'nameofshop' => $gsnr . '-' . $shop_name . '-' . $city,
                        ]);
                    }
                }
            }

            // Excel::import(new Shoplist(), request()->file('file'));
        }

        return back()->with('success', 'Created successfully!');
    }

    public function getData(Request $request)
    {
        // Ambil ID dari request
        $id = $request->id;
        $decryptedId = decrypt($id);

        // Misalnya, ambil data detail dari model berdasarkan ID
        $detailData = Shoplist::find($decryptedId);
        $project = Project::select('id', 'name')->where('country', session('country_user'))->get();

        if ($detailData) {
            // Jika data ditemukan, kembalikan sebagai respons JSON
            return response()->json(['detailData' => $detailData, 'project' => $project]);
        } else {
            // Jika data tidak ditemukan, kembalikan respons dengan status 404
            return response()->json(['message' => 'Data detail tidak ditemukan'], 404);
        }
    }

    public function updateData(Request $request)
    {
        $id = $request->id;
        // dd($request->all());
        var_dump($id);
        if ($id) {
            $shoplist = Shoplist::findorfail($id);
            $shoplist->update([
                'project' => $request->project,
                'shop_name' => $request->shop_name,
                'city' => $request->city,
                'channel_name' => $request->channel_name,
                'shop_type' => $request->shop_type,
                'region' => $request->region,
                'region2' => $request->region2,
                'organisat_type' => $request->organisat_type,
                'shopsize1' => $request->shop_size,
                'sample_status' => $request->sample_status,
                'metode_konversi' => $request->metode_konversi,
                'base_staff' => $request->base_staff,
                'spv' => $request->spv_name,
                'data_collector' => $request->collector,
            ]);
        }

        return back()->with('success', 'Updated successfully!');
    }
}
