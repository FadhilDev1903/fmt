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
        Schema::table('events', function (Blueprint $table) {
            $table->enum('submit', [0, 1])->default(0);
            $table->string('submit_by')->nullable();
            $table->dateTime('submit_at')->nullable();
            $table->enum('approved_status', ["Wait", "Approve", "Reject"])->default("Wait");
            $table->string('approved_by')->nullable();
            $table->dateTime('approved_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('events', function (Blueprint $table) {
            $table->dropColumn('submit', 'approved_status', 'approved_by', 'approved_at');
        });
    }
};
