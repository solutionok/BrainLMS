<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateItemsStockTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('items_stock', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('refno', 250);
			$table->integer('cat_id');
			$table->integer('item_id');
			$table->integer('store_id');
			$table->integer('supplier_id');
			$table->string('qty', 250);
			$table->string('stock_date', 250);
			$table->string('stock_attach', 250);
			$table->text('stock_notes', 65535);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('items_stock');
	}

}
