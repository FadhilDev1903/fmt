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
        Schema::create('panelservicings', function (Blueprint $table) {
            $table->id();
            $table->string('periode_name');
            $table->string('gsnr');
            $table->string('panelservicing_method');
            $table->string('panelservicing_feedback');
            $table->string('panelservicing_startload');
            $table->string('panelservicing_inputdate');
            $table->string('panelservicing_staffname');
            $table->string('panelservicing_image');
            $table->string('panelservicing_lat');
            $table->string('panelservicing_long');
            $table->string('country');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('panelservicing');
    }
};
