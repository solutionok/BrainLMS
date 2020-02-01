<?php

use App\Helpers\TruncateWithForeignKey;
use App\Models2\Setting;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
		use TruncateWithForeignKey;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      $this->TruncateWithForeignKey('settings');

      $settings = array(
			  array('fieldName' => 'address','fieldValue' => 'South Office Para, New Parastoli, Shyamali Colony, Doranda, Ranchi, Jharkhand 834002'),
			  array('fieldName' => 'footer','fieldValue' => 'All Rights Reserved, virtu.co'),
			  array('fieldName' => 'lastUpdateCheck','fieldValue' => '1561789833'),
			  array('fieldName' => 'latestVersion','fieldValue' => '3.0'),
			  array('fieldName' => 'latestVersionUrl','fieldValue' => 'http:'),
			  array('fieldName' => 'phoneNo','fieldValue' => '2253777'),
			  array('fieldName' => 'siteTitle','fieldValue' => 'Virtu School'),
			  array('fieldName' => 'systemEmail','fieldValue' => 'demo.virtucutebrains@gmail.com'),
			  array('fieldName' => 'finishInstall','fieldValue' => '1'),
			  array('fieldName' => 'schoolTerms','fieldValue' => 'Privacy Policy of CuteBrains<br />
					With Effect From &ndash; 22.03.2019<br />
					Privacy Policy<br />
					Virtu Information Technologies Pvt. Ltd. (&ldquo;our&rdquo;, &ldquo;we&rdquo;, or &ldquo;us&rdquo;) operates the CuteBrains web and mobile application ( the &ldquo;Service&rdquo;).<br />
					This page provides you the information regarding our policies concerning disclosure, use, and collection of personal data, when you opt to use our services. This section also explains the choices that you have regarding our data.<br />
					We make use of the data to provide you the service and data is also used to improve the services being offered. When you use this service, it is implied that you give your consent to the use and collection of information according to this policy. If not stated specifically in this Privacy Policy, the terminologies used in this Privacy Policy carries the same meaning as mentioned in our Terms and Conditions.<br />
					Information Gathering And Further Use<br />
					Various types of Information is collated by us to offer you and further improve this service.<br />
					Kinds of Data Collection<br />
					Personal Data<br />
					When you make use of our services, we may ask you to furnish a certain kind of personally identifiable information.&nbsp; This data would be used either to contact you or for your identification (&ldquo;Personal Data&rdquo;). The scope of personally identifiable information is inclusive of but not limited to the following:
					<ul>
						<li>First name, middle name and last name</li>
						<li>Email ID</li>
						<li>Usage and Cookies Data</li>
						<li>Phone number</li>
					</ul>
					Usage Data<br />
					When you access the application through any device, some information may be collected by us automatically. This information is inclusive but not limited to type of device, unique ID of your device, the IP address of device, your operating system, type of internet browser you use, unique device identifiers and various other kinds of Usage data (&ldquo;Diagnostic Data&rdquo;) .<br />
					Cookies &amp; Tracking Data<br />
					We make use of cookies and other similar type of tracking data to follow the activities done by you on our application or service and we withhold some information.<br />
					Cookies are nothing but files with little amount of data. They may or may not include an anonymous unique identifier. The website sends cookies to your browser, which is stored on your device. Use of scripts, tags, and beacons is made by the tracking technologies to collate and keep a track of information. This is done for improvement and analysis of our services.<br />
					However, you can instruct your browser not to accept all cookies or to give you an indication when a cookie is being sent. But we would like to mention specifically that if you refuse to accept cookies, you would not be able to use some sections of our service being offered.<br />
					Some Examples of Cookies used by us:-
					<ul>
						<li>Security Cookies: These are used for security purposes.</li>
						<li>Session Cookies: These are used to operate our service.</li>
						<li>Preference Cookies: These are used to remember certain settings and your preferences.</li>
					</ul>
					Data Usage<br />
					CuteBrains makes use of the collected data for various purposes:
					<ul>
						<li>For prevention, detection and addressing of technical issues</li>
						<li>For monitoring service usage</li>
						<li>For collection of valuable insights to improve the service</li>
						<li>For providing support and customer care services</li>
						<li>For allowing you to participate in interactive options of our application , when you choose to do so</li>
						<li>For sending you notification about changes of our service</li>
						<li>For maintenance and providing of service</li>
					</ul>
					Data Transfer<br />
					The information that you choose to furnish to us inclusive of Personal Data may be sent to computers outside your own region of stay. In these circumstances the governmental jurisdiction and data protection law may be different from what is applicable in your region of stay or country. &nbsp;<br />
					If your region of stay is outside India, then please note that we send your personal identifiable data to India and process it there.<br />
					When you agree to this privacy policy and provide the submission of information, then it is understood that you agree to this clause of Data Transfer.<br />
					CuteBrains would assure that your data is treated securely and according to the Privacy Policy stated herein. &nbsp;We would also ensure that no transfer of your personal identifiable data takes place to any organization or country where adequate controls and data security measures are not in place.<br />
					Data Disclosure<br />
					Legal Prerequisites<br />
					CuteBrains may disclose your personal identifiable data in good belief where the action is needed for:
					<ul>
						<li>For protection against legal liability</li>
						<li>For protection of personal safety of users of the service or the public at large</li>
						<li>For investigating and protecting against possible wrongdoing related to the service</li>
						<li>For defending and protecting the rights or property of CuteBrains</li>
						<li>For complying with a legal obligation</li>
					</ul>
					Data Security<br />
					The safety and security of your data is very vital to us, but remember that the process of data transfer over the internet, or electronic data interchange is never 100% secure. Hence, it must be understood by you that however, we fully strive to protect and safeguard your personal data, but we cannot guarantee the absolute security of the data.<br />
					Providers of Service<br />
					We may make use or employ third party companies to assist us in providing you the services on our behalf, to perform service related activities or in the analysis of the service usage.<br />
					The third party companies that we would be employing shall just offer you the services on our behalf and are in no way obligated to use or disclose your personal data for any other purpose.<br />
					Links to Other Sites<br />
					Our application may contain links to other sites that are not operated by us. We strictly recommend that you visit the Privacy policy of each and every site you visit.&nbsp;<br />
					We do not supervise or control the content, privacy policies etc. of the third party services or sites.<br />
					Privacy for Children<br />
					Our services are not meant to be addressed for any one below the age of 18 (Children).<br />
					Our policy is not to collect the personally identifiable information from any one below the age of 18. If your child has knowingly or unknowingly provided us the personal identifiable information, then you as a parent must bring this to our notice. We would then take steps to remove this information from our servers.<br />
					Changes to this existing Privacy Policy<br />
					Our privacy policy is subject to updates from time to time. We are supposed to post the new privacy policy on this page time to time when such updates are available.<br />
					You would be sent an email or other conspicuous notice may be sent to you, in order to notify you regarding the abovementioned changes. We are also mentioning an effective date at the top of this Privacy Policy.<br />
					This is a general advice to you, that you keep checking this page for sighting any changes that are made to this privacy policy.<br />
					Contact Us<br />
					If you have any queries regarding this privacy policy, please get in touch with us via email info@virtu.co'),
			  array('fieldName' => 'attendanceModel','fieldValue' => 'class'),
			  array('fieldName' => 'smsProvider','fieldValue' => '{"smsProvider":"nexmo","nexmoApiKey":"","nexmoApiSecret":"","nexmoPhoneNumber":"dfc","twilioSID":"ee","twilioToken":"","twilioFN":"","hoiioAppId":"","hoiioAccessToken":"","clickatellApiKey":"","clickatellUserName":"","clickatellPassword":"","intellismsUserName":"","intellismsPassword":"","intellismsSenderNumber":"","bulksmsUserName":"","bulksmsPassword":"","conceptoUserName":"","conceptoPassword":"","conceptoSenderId":"","msg91Authkey":"","msg91SenderId":"","customHTTPToFormat":"+","customHTTPType":"post","nexmoFromId":""}'),
			  array('fieldName' => 'mailProvider','fieldValue' => '{"mailProvider":"mail","smtpHost":"","smtpPort":"","smtpUserName":"","smtpPassWord":"","AmazonSESAccessKey":"","AmazonSESSecretKey":"","AmazonSESVerifiedSender":"","smtpTLS":"TLS"}'),
			  array('fieldName' => 'examDetailsNotif','fieldValue' => 'mailsms'),
			  array('fieldName' => 'examDetailsNotifTo','fieldValue' => 'both'),
			  array('fieldName' => 'absentNotif','fieldValue' => 'mailsms'),
			  array('fieldName' => 'address2','fieldValue' => 'address line 2'),
			  array('fieldName' => 'paypalPayment','fieldValue' => ''),
			  array('fieldName' => 'paymentTax','fieldValue' => '0'),
			  array('fieldName' => 'activatedModules','fieldValue' => '["eventsAct","attendanceAct","staffAttendanceAct","bookslibraryAct","assignmentsAct","mediaAct","paymentsAct","pollsAct","reportsAct","materialsAct","vacationAct","transportAct","staticPages","messagesAct","calendarAct","classSchAct","sendNotifAct","mailSmsAct","homeworkAct","payrollAct","incomeAct","conMessAct","employeesAct","newsboardAct","certAct","visitorsAct","phoneCallsAct","postalAct","complainAct","enquiriesAct","staticpagesAct"]'),
			  array('fieldName' => 'languageDef','fieldValue' => '1'),
			  array('fieldName' => 'languageAllow','fieldValue' => '1'),
			  array('fieldName' => 'layoutColor','fieldValue' => 'red'),
			  array('fieldName' => 'thisVersion','fieldValue' => '5.1'),
			  array('fieldName' => 'currency_code','fieldValue' => 'INR'),
			  array('fieldName' => 'currency_symbol','fieldValue' => '₹'),
			  array('fieldName' => 'studentVacationDays','fieldValue' => '21'),
			  array('fieldName' => 'teacherVacationDays','fieldValue' => '18'),
			  array('fieldName' => 'daysWeekOff','fieldValue' => '["1"]'),
			  array('fieldName' => 'officialVacationDay','fieldValue' => '[]'),
			  array('fieldName' => 'attendanceOnMarksheet','fieldValue' => '1'),
			  array('fieldName' => 'layoutColorUserChange','fieldValue' => '1'),
			  array('fieldName' => 'siteLogo','fieldValue' => 'image'),
			  array('fieldName' => 'siteLogoAdditional','fieldValue' => 'Virtu School'),
			  array('fieldName' => 'allowPublicReg','fieldValue' => '1'),
			  array('fieldName' => 'invoiceGenStudentCreated','fieldValue' => '1'),
			  array('fieldName' => 'invoiceGenStudentPromotion','fieldValue' => '1'),
			  array('fieldName' => 'dateformat','fieldValue' => 'd/m/Y'),
			  array('fieldName' => 'enableSections','fieldValue' => '1'),
			  array('fieldName' => 'emailIsMandatory','fieldValue' => '0'),
			  array('fieldName' => 'allowTeachersMailSMS','fieldValue' => 'both'),
			  array('fieldName' => 'gTrackId','fieldValue' => ''),
			  array('fieldName' => 'loginPageStyle','fieldValue' => 'c'),
			  array('fieldName' => 'registerPageStyle','fieldValue' => 'c'),
			  array('fieldName' => 'forgetPwdPageStyle','fieldValue' => 'c'),
			  array('fieldName' => 'pullAppClosed','fieldValue' => '600'),
			  array('fieldName' => 'pullAppActive','fieldValue' => '3'),
			  array('fieldName' => 'pullAppMessagesActive','fieldValue' => '2'),
			  array('fieldName' => 'timezone','fieldValue' => 'Asia/Kolkata'),
			  array('fieldName' => 'gcalendar','fieldValue' => 'gregorian'),
			  array('fieldName' => 'studentsSort','fieldValue' => 'fullName ASC'),
			  array('fieldName' => 'teachersSort','fieldValue' => 'id + 0 DESC'),
			  array('fieldName' => 'parentsSort','fieldValue' => 'fullName ASC'),
			  array('fieldName' => 'favicon','fieldValue' => 'd'),
			  array('fieldName' => 'paypalEnabled','fieldValue' => '0'),
			  array('fieldName' => '2coEnabled','fieldValue' => '0'),
			  array('fieldName' => 'twocheckoutsid','fieldValue' => ''),
			  array('fieldName' => 'twocheckoutHash','fieldValue' => ''),
			  array('fieldName' => 'payumoneyEnabled','fieldValue' => '0'),
			  array('fieldName' => 'payumoneyKey','fieldValue' => ''),
			  array('fieldName' => 'payumoneySalt','fieldValue' => ''),
			  array('fieldName' => 'authPageImage','fieldValue' => '1'),
			  array('fieldName' => 'authPageColor','fieldValue' => '#c0c0c0'),
			  array('fieldName' => 'leftmenuScroller','fieldValue' => 'e'),
			  array('fieldName' => 'calendarOffset','fieldValue' => '0'),
			  array('fieldName' => 'firebase_apikey','fieldValue' => 'AAAA1Rsyd5E:APA91bGLOzWcPwrFUiOZAgI3bJ7l6uXTzL2xg_-BRQeu1_LHO4CSuav6dUVX71EScIXoXGH3ldFYW2FHuHTQG_37ruT5URMbFvF5etIz9G-0DsL1Z1kufAsmDAXkJYmZlk2wqF_F_CoQ'),
			  array('fieldName' => 'dueInvoicesNotif','fieldValue' => 'mailsms'),
			  array('fieldName' => 'dueInvoicesNotifTo','fieldValue' => 'both'),
			  array('fieldName' => 'https_enabled','fieldValue' => '1'),
			  array('fieldName' => 'country','fieldValue' => 'IN'),
			  array('fieldName' => 'wysiwyg_type','fieldValue' => 'advanced'),
			  array('fieldName' => 'cms_active','fieldValue' => '1'),
			  array('fieldName' => 'cms_template','fieldValue' => 'modern'),
			  array('fieldName' => 'cms_facebook','fieldValue' => 'http://facebook.com/'),
			  array('fieldName' => 'cms_google','fieldValue' => ''),
			  array('fieldName' => 'cms_twitter','fieldValue' => 'https://twitter.com/'),
			  array('fieldName' => 'cms_footer_right','fieldValue' => '&copy; 2018. Your company / name goes here'),
			  array('fieldName' => 'cms_footer_left','fieldValue' => '&copy; 2018. Your company / name goes here'),
			  array('fieldName' => 'biometric_device_ip','fieldValue' => '192.168.1.224'),
			  array('fieldName' => 'biometric_device_status','fieldValue' => ''),
			  array('fieldName' => 'cms_theme','fieldValue' => 'blue'),
			  array('fieldName' => 'sAttendanceInOut','fieldValue' => '1'),
			  array('fieldName' => 'finishInstall','fieldValue' => '1'),
			  array('fieldName' => 'eazypayEnabled','fieldValue' => '1'),
			  array('fieldName' => 'enc_key','fieldValue' => '2119472418501000'),
			  array('fieldName' => 'merch_id','fieldValue' => '211851'),
			  array('fieldName' => 'returnUrl','fieldValue' => 'https://payments.cutebrains.com/return'),
			  array('fieldName' => 'fineAmount','fieldValue' => '2'),
			  array('fieldName' => 'invoice_sc_1','fieldValue' => '01/06/2019'),
			  array('fieldName' => 'months_1','fieldValue' => '2'),
			  array('fieldName' => 'invoice_sc_due_1','fieldValue' => '21/06/2019'),
			  array('fieldName' => 'invoice_sc_2','fieldValue' => ''),
			  array('fieldName' => 'months_2','fieldValue' => '2'),
			  array('fieldName' => 'invoice_sc_due_2','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_3','fieldValue' => ''),
			  array('fieldName' => 'months_3','fieldValue' => '2'),
			  array('fieldName' => 'invoice_sc_due_3','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_4','fieldValue' => ''),
			  array('fieldName' => 'months_4','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_due_4','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_5','fieldValue' => ''),
			  array('fieldName' => 'months_5','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_due_5','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_6','fieldValue' => ''),
			  array('fieldName' => 'months_6','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_due_6','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_7','fieldValue' => ''),
			  array('fieldName' => 'months_7','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_due_7','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_8','fieldValue' => ''),
			  array('fieldName' => 'months_8','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_due_8','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_9','fieldValue' => ''),
			  array('fieldName' => 'months_9','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_due_9','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_10','fieldValue' => ''),
			  array('fieldName' => 'months_10','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_due_10','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_11','fieldValue' => ''),
			  array('fieldName' => 'months_11','fieldValue' => '0'),
			  array('fieldName' => 'invoice_sc_due_11','fieldValue' => ''),
			  array('fieldName' => 'invoice_sc_12','fieldValue' => ''),
			  array('fieldName' => 'months_12','fieldValue' => '0'),
			  array('fieldName' => 'invoice_sc_due_12','fieldValue' => ''),
			  array('fieldName' => 'fine_tra','fieldValue' => '50')
			);

			foreach ($settings as $key => $value) {
	      $item = new Setting;
	      $item->fieldName = $value['fieldName'];
	      $item->fieldValue = $value['fieldValue'];
	      $item->save();
			}
    }
}
