<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Collection;
use App\Models\Panelrecruit;
use Illuminate\Http\Request;
use App\Models\Panelservicing;
use App\Models\Periodeshoplist;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class ReportUserController extends Controller
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
        $menu = Menu::with('children')
            ->whereNull('parent_id')
            ->where('roles', 'LIKE', '%' . auth()->user()->status . '%')
            ->get();

        $periodeShoplist = Periodeshoplist::select('periodeshoplist_name', DB::raw('MAX(id) as id'))->where('periode_startdate', '<=', date('Y-m-d'))->where('periode_enddate', '>=', date('Y-m-d'))->groupBy('periodeshoplist_name')->get();

        $data = [
            'title' => 'Report',
            'menu' => $menu,
            'periodeShoplist' => $periodeShoplist,
        ];
        return view('user.report', $data);
    }

    public function export_report(Request $request)
    {
        $data = $request->all();
        // dd($data);
        if ($request->reporttodo == 'collection') {
            $this->collection($data);
        } elseif ($request->reporttodo == 'servicing') {
            $this->servicing($data);
        } elseif ($request->reporttodo == 'recruitment') {
            // $this->dataQC($data);
            $this->recruitment($data);
        } elseif ($segmen == '4') {
            // $this->dataYanmen($id);
            $this->recruitment($id);
        }
    }

    public function collection($data)
    {
        $values = Collection::where('periode_name', $data['periode_num'])->get();
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $column = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S'];
        $header = ['id', 'period_name', 'gsnr_id', 'status', 'reason', 'pgfill', 'new_model', 'remind', 'display', 'missing', 'feedback', 'startload', 'staffname', 'imgpath', 'lat', 'long', 'country', 'created_at', 'updated_at'];
        $col = ['id', 'periode_name', 'gsnr', 'collection_status', 'collection_reason', 'collection_pgfill', 'collection_newmodel', 'collection_remind', 'collection_display', 'collection_missing', 'collection_feedback', 'collection_startload', 'collection_staffname', 'collection_image', 'collection_lat', 'collection_long', 'country', 'created_at', 'updated_at'];
        foreach ($column as $key => $value) {
            $sheet->setCellValue($value . '1', $header[$key]);
        }

        foreach ($values as $key => $value) {
            foreach ($column as $key2 => $value2) {
                $sheet->setCellValue($value2.($key+2), $value[$col[$key2]]);
            }
        }

        $writer = new Xlsx($spreadsheet);
        $filename = 'Report Collection';
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $filename . '.xlsx"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
    }

    public function servicing($data)
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $values = Panelservicing::where('periode_name', $data['periode_num'])->get();
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $column = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
        $header = ['period_name', 'gsnr_id', 'method', 'feedback', 'startload', 'staffname', 'imgpath', 'lat', 'long', 'country'];
        $col = ['periode_name', 'gsnr', 'panelservicing_method', 'panelservicing_feedback', 'panelservicing_startload', 'panelservicing_staffname', 'panelservicing_image', 'panelservicing_lat', 'panelservicing_long', 'country', 'created_at', 'updated_at'];
        foreach ($column as $key => $value) {
            $sheet->setCellValue($value . '1', $header[$key]);
        }

        foreach ($values as $key => $value) {
            foreach ($column as $key2 => $value2) {
                $sheet->setCellValue($value2.($key+2), $value[$col[$key2]]);
            }
        }

        $writer = new Xlsx($spreadsheet);
        $filename = 'Report Servicing';
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $filename . '.xlsx"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
    }

    public function recruitment($data)
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $values = Panelrecruit::where('periode_name', $data['periode_num'])->get();
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $column = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'];
        $header = ['shop_name', 'period_name', 'shop_type', 'shop_size', 'shop_address', 'shop_city', 'status', 'reason', 'startload', 'staffname', 'imgpath', 'lat', 'long', 'country'];
        $col = ['shopname', 'periode_name', 'shoptype', 'shopsize', 'address', 'city', 'status', 'reason', 'startload', 'staffname', 'image', 'lat', 'long', 'country'];
        foreach ($column as $key => $value) {
            $sheet->setCellValue($value . '1', $header[$key]);
        }

        foreach ($values as $key => $value) {
            foreach ($column as $key2 => $value2) {
                $sheet->setCellValue($value2.($key+2), $value[$col[$key2]]);
            }
        }

        $writer = new Xlsx($spreadsheet);
        $filename = 'Report Recruitment';
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $filename . '.xlsx"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
    }
}
