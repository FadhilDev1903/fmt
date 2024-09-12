<?php

namespace App\Models;

use App\Models\Collection;
use App\Models\shoplistchange;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Shoplist extends Model
{
    use HasFactory;
    protected $fillable = [
        'project',
        'sh_type',
        'gsnr',
        'shop_name',
        'city',
        'channel_name',
        'shop_type',
        'assembled',
        'a_clients',
        'region',
        'region2',
        'organisat_type',
        'shopsize1',
        'sample_status',
        'metode_konversi',
        'penyampaian_ke_gfK',
        'datadeliverytyp',
        'schedule',
        'data_collector',
        'base_staff',
        'area',
        'street',
        'delivery_address',
        'courier',
        'telephone',
        'mobile_phone',
        'contact_person',
        'v_type',
        'v_amount',
        'kelipatan_25',
        'spv',
        'spv_id',
        'country',
        'nameofshop',
    ];

    /**
     * Get the user associated with the Shoplist
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function detailchange(): HasOne
    {
        return $this->hasOne(shoplistchange::class, 'id_shoplist', 'id');
    }

    public function collection()
    {
        return $this->hasOne(Collection::class, 'gsnr', 'gsnr');
    }
}
