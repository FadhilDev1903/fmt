<?php

namespace App\Imports;

use App\Models\Shoplist;
use Maatwebsite\Excel\Concerns\ToModel;

class ShoplistImport implements ToModel
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        return new Shoplist([
            'project' => $row['PROJECT'],
            'sh_type' => $row['SH_TYPE'],
            'gsnr' => $row['GSNR'],
            'shop_name' => $row['SHOP NAME'],
            'city' => $row['CITY'],
            'channel_name' => $row['CHANNELNAME'],
            'shop_type' => $row['SHOP TYPE'],
            'assembled' => $row['ASSEMBLED'],
            'a_clients' => $row['A_CLIENTS'],
            'region' => $row['REGION'],
            'region2' => $row['REGION2'],
            'organisat_type' => $row['ORGANISAT TYPE'],
            'shopsize1' => $row['SHOPSIZE1'],
            'sample_status' => $row['SAMPLE STATUS'],
            'metode_konversi' => $row['Metode Konversi'],
            'penyampaian_ke_gfK' => $row['Penyampaian ke GfK'],
            'datadeliverytyp' => $row['DATADELIVERYTYP'],
            'schedule' => $row['SCHEDULE'],
            'data_collector' => $row['DATA COLLECTOR'],
            'base_staff' => $row['BASE STAFF'],
            'area' => $row['AREA'],
            'street' => $row['STREET'],
            'delivery_address' => $row['DELIVERY ADDRESS'],
            'courier' => $row['COURIER'],
            'telephone' => $row['TELEPHON'],
            'mobile_phone' => $row['Mobile Phone/SMS'],
            'contact_person' => $row['CONTACT PERSON'],
            'v_type' => $row['V TYPE'],
            'v_amount' => $row['V Regular'],
            'kelipatan_25' => $row['kelipatan 2.5'],
            'spv' => $row['SPV'],
            'spv_id' => $row['SPVID'],
            'country' => $row['PROJECT'],
            'nameofshop' => $row['GSNR'] . '-' . $row['SHOP NAME'] . '-' . $row['CITY'],
        ]);
    }
}
