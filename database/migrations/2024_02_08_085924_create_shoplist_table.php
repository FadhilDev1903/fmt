<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('shoplists', function (Blueprint $table) {
            $table->id();
            $table->string('project')->nullable();
            $table->string('sh_type')->nullable();
            $table->string('gsnr');
            $table->string('shop_name')->nullable();
            $table->string('city')->nullable();
            $table->string('channel_name')->nullable();
            $table->string('shop_type')->nullable();
            $table->string('assembled')->nullable();
            $table->string('a_clients')->nullable();
            $table->string('region')->nullable();
            $table->string('region2')->nullable();
            $table->string('organisat_type')->nullable();
            $table->string('shopsize1')->nullable();
            $table->string('sample_status')->nullable();
            $table->string('metode_konversi')->nullable();
            $table->string('penyampaian_ke_gfK')->nullable();
            $table->string('datadeliverytyp')->nullable();
            $table->string('schedule')->nullable();
            $table->string('data_collector')->nullable();
            $table->string('base_staff')->nullable();
            $table->string('area')->nullable();
            $table->string('street')->nullable();
            $table->string('delivery_address')->nullable();
            $table->string('courier')->nullable();
            $table->string('telephone')->nullable();
            $table->string('mobile_phone')->nullable();
            $table->string('contact_person')->nullable();
            $table->string('v_type')->nullable();
            $table->string('v_amount')->nullable();
            $table->string('kelipatan_25')->nullable();
            $table->string('spv')->nullable();
            $table->string('spv_id');
            $table->string('country')->nullable();
            $table->string('nameofshop');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shoplists');
    }
};
