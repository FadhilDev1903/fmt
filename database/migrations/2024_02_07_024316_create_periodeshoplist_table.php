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
        Schema::create('periodeshoplists', function (Blueprint $table) {
            $table->id();
            $table->date('periode_startdate');
            $table->date('periode_enddate');
            $table->string('periodeshoplist_name');
            $table->string('periodeshoplist_gsnr');
            $table->string('periodeshoplist_inputdate');
            $table->integer('dispatch_id')->nullable();
            $table->integer('collection_id')->nullable();
            $table->integer('recruitment_id')->nullable();
            $table->integer('servicing_id')->nullable();
            $table->integer('shopDetail_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('periodeshoplists');
    }
};
