<?php

namespace App\Models2;

use App\Models2\User;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model {
	public $timestamps = false;
	protected $table = 'payments';

	public static function payment_methods()
	{
		$payment_methods = [
			'cash' => 'Cash',
			'cheque' => 'Cheque',
			'online' => 'Online',
			'bank_deposit' => 'Bank Deposit',
			'card' => 'Card'
		];

		return $payment_methods;
	}

	public static function getPaymentIdsByClassId($class_id)
	{
		$payment_ids = [];

		$student_ids = User::where('role','student')
		  ->where('studentClass', $class_id)
		  ->select('id')
		  ->pluck('id');

		$payment_ids = self::whereIn('paymentStudent', $student_ids)->pluck('id');

		return $payment_ids;
	}

	public static function getPaymentIdsBySectionId($section_id)
	{
		$payment_ids = [];

		$student_ids = User::where('role','student')
		  ->where('studentSection', $section_id)
		  ->select('id')
		  ->pluck('id');

		$payment_ids = self::whereIn('paymentStudent', $student_ids)->pluck('id');

		return $payment_ids;
	}

	public static function getInvoiceRowsInArray($custom_payment_ids) {
		$rows_collection = self::whereIn('id', $custom_payment_ids)
			->select('paymentRows')
		  ->pluck('paymentRows');

		$unique_rows = [];
		foreach($rows_collection as $key => $rows) {
			$rows = (array) json_decode($rows);
			foreach ($rows as $key => $row) {
				if(!in_array($row->title, $unique_rows)) {
					$unique_rows[] = $row->title;
				}
			}
		}

		return $unique_rows;
	}
}