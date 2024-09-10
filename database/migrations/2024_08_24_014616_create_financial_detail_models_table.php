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
        Schema::create('financial_details', function (Blueprint $table) {
            $table->id();
            $table->string('user_id');
            $table->string('location');
            $table->decimal('dailyfee', 10, 2);
            $table->date('joindate');
            $table->date('endcontract');
            $table->string('contract');
            $table->string('filename')->nullable();
            $table->enum('status', [0, 1])->default(0);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('financial_details');
    }
};
