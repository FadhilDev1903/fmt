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
        Schema::create('shoplistchanges', function (Blueprint $table) {
            $table->id();
            $table->string('id_shoplist');
            $table->string('project')->nullable();
            $table->string('shop_name')->nullable();
            $table->string('city')->nullable();
            $table->string('channel_name')->nullable();
            $table->string('shop_type')->nullable();
            $table->string('region')->nullable();
            $table->string('region2')->nullable();
            $table->string('organisat_type')->nullable();
            $table->string('shopsize1')->nullable();
            $table->string('sample_status')->nullable();
            $table->string('metode_konversi')->nullable();
            $table->string('data_collector')->nullable();
            $table->string('base_staff')->nullable();
            $table->string('spv')->nullable();
            $table->string('status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shoplistchanges');
    }
};
