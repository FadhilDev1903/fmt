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
        Schema::create('adhocprojects', function (Blueprint $table) {
            $table->id();
            $table->string('parent_id')->nullable();
            $table->string('wbs_number')->nullable();
            $table->string('cost_center')->nullable();
            $table->string('name');
            $table->string('description')->nullable();
            $table->string('remark');
            $table->string('manage');
            $table->string('budget');
            $table->string('startdate');
            $table->string('enddate');
            $table->string('country');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('adhocprojects');
    }
};
