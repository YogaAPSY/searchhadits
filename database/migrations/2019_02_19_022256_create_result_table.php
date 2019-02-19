<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateResultTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('result', function (Blueprint $table) {
            $table->increments('id');
            $table->string('keyword');
            $table->integer('tp_cosine');
            $table->integer('tp_jaccard');
            $table->integer('fp_cosine');
            $table->integer('fp_jaccard');
            $table->integer('fn_cosine');
            $table->integer('fn_jaccard');
            $table->integer('recall_cosine');
            $table->integer('recall_jaccard');
            $table->integer('precision_cosine');
            $table->integer('precision_jaccard');
            $table->timestamps();
        });

         Schema::create('hadits', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('no_hadits');
            $table->string('index');
            $table->text('hadits');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('result');
    }
}
