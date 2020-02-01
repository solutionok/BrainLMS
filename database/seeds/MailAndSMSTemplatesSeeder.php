<?php

use App\Helpers\TruncateWithForeignKey;
use App\Models2\MailsmsTemplate;
use Illuminate\Database\Seeder;

class MailAndSMSTemplatesSeeder extends Seeder
{
		use TruncateWithForeignKey;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->TruncateWithForeignKey('mailsms_templates');

        $mailsms_templates = array(
				  array('templateTitle' => 'Exam Details',
				  	'templateMail' => '<p>Dear {studentName},</p>
							<p>the following table contain the marks of exam : {examTitle} started on {examDate}</p>
							<p>{examGradesTable}</p>
							<p>Best Regards,</p>
							<p>{schoolTitle}</p>',
							'templateSMS' => 'Dear {studentName}, exam {examTitle} marks : {examGradesTable}',
							'templateVars' => '{studentName},{studentRoll},{studentEmail},{studentUsername},{examGradesTable},{examTitle},{examDescription},{examDate},{schoolTitle}'
					),
					array('templateTitle' => 'Exam Details mini',
						'templateMail' => '<p>Dear {studentName},</p>
							<p>total marks of exam : {examTitle} started on {examDate}</p>
							<p>{totalMarks}</p>
							<p>Best Regards,</p>',
						'templateSMS' => 'Dear {studentName}, exam {examTitle} total marks : {totalMarks}',
						'templateVars' => '{studentName},{studentRoll},{studentEmail},{studentUsername},{totalMarks},{examTitle},{examDate},{schoolTitle}'
					),
				  array('templateTitle' => 'Student Absent',
				  	'templateMail' => '<p>Dear {parentName},</p>
							<p>The student {studentName} is absent Today with status : {absentStatus}</p>
							<p>Absense date : {absentDate}</p>
							<p>Best Regards,</p>
							<p>{schoolTitle}</p>',
						'templateSMS' => 'Dear {parentName}, The student {studentName} is absent Today with status : {absentStatus}',
						'templateVars' => '{studentName},{studentRoll},{studentEmail},{studentUsername},{parentName},{parentEmail},{parentEmail},{absentDate},{absentStatus},{schoolTitle}'
					),
				  array('templateTitle' => 'New Template',
				  		'templateMail' => '<p>This template used when sending new mail&nbsp;</p>',
				  		'templateSMS' => 'This template used when sending new sms',
							'templateVars' => NULL
					),
				  array('templateTitle' => 'Due Invoice',
				  	'templateMail' => '<p>Hello {name},</p>
							<p>Invoice {invoice_id} is due.</p>
							<p>Invoice details : {invoice_details}</p>
							<p>Amount : {invoice_amount}</p>
							<p>Invoice Date : {invoice_date}</p>',
						'templateSMS' => 'Invoice {invoice_id} is due with amount {invoice_amount}',
						'templateVars' => NULL
					)
				);

        foreach ($mailsms_templates as $key => $value) {
		      $item = new MailsmsTemplate;
		      $item->templateTitle = $value['templateTitle'];
		      $item->templateMail = $value['templateMail'];
		      $item->templateSMS = $value['templateSMS'];
		      $item->templateVars = $value['templateVars'];
		      $item->save();
				}
    }
}
