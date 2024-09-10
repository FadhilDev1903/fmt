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
        Schema::create('panelrecruits', function (Blueprint $table) {
            $table->id();
            $table->string('periode_name');
            $table->string('shopname');
            $table->string('shoptype');
            $table->string('shopsize');
            $table->string('address');
            $table->string('city');
            $table->string('status');
            $table->string('reason');
            $table->string('startload');
            $table->string('inputdate');
            $table->string('staffname');
            $table->string('image');
            $table->string('lat');
            $table->string('long');
            $table->string('country');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('panelrecruit');
    }
};
