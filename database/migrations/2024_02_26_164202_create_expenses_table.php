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
        Schema::create('expenses', function (Blueprint $table) {
            $table->id();
            $table->date('claim_date');
            $table->string('user_id');
            $table->string('department')->nullable();
            $table->enum('claim_type', ['local', 'travel']);
            $table->string('category')->nullable();
            $table->string('item')->nullable();
            $table->string('remarks')->nullable();
            $table->string('currency')->nullable();
            $table->string('project')->nullable();
            $table->string('amount')->nullable();
            $table->string('project_percentage')->nullable();
            $table->string('image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('expenses');
    }
};
