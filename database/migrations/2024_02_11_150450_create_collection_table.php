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
        Schema::create('collections', function (Blueprint $table) {
            $table->id();
            $table->string('periode_name');
            $table->string('gsnr');
            $table->string('collection_status');
            $table->string('collection_reason')->nullable();
            $table->string('collection_pgfill')->nullable();
            $table->string('collection_newmodel')->nullable();
            $table->string('collection_remind')->nullable();
            $table->string('collection_display')->nullable();
            $table->string('collection_missing')->nullable();
            $table->string('collection_feedback')->nullable();
            $table->string('collection_startload')->nullable();
            $table->string('collection_dateinput')->nullable();
            $table->string('collection_staffname')->nullable();
            $table->string('collection_image')->nullable();
            $table->string('collection_lat')->nullable();
            $table->string('collection_long')->nullable();
            $table->string('country')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('collections');
    }
};
