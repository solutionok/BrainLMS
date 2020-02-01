<?php

use App\Helpers\TruncateWithForeignKey;
use App\Models2\AcademicYear;
use App\Models2\Attendance;
use App\Models2\BookLibrary;
use App\Models2\ClassSchedule;
use App\Models2\Department;
use App\Models2\Dormitory;
use App\Models2\Event;
use App\Models2\ExamMark;
use App\Models2\Homework;
use App\Models2\MClass;
use App\Models2\Mailsms;
use App\Models2\Message;
use App\Models2\MessagesList;
use App\Models2\MobNotification;
use App\Models2\Newsboard;
use App\Models2\NotificationMobHistory;
use App\Models2\Payment;
use App\Models2\PhoneCall;
use App\Models2\Role;
use App\Models2\Section;
use App\Models2\StaticPage;
use App\Models2\StudentCategory;
use App\Models2\Subject;
use App\Models2\TransportVehicle;
use App\Models2\Transportation;
use App\Models2\exams_list;
use App\Models2\postal;
use App\Models2\student_academic_years;
use App\User;
use Carbon\Carbon;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Session;

class InitSeeder extends Seeder
{
		use TruncateWithForeignKey;

		protected $leaderBoard = [
  		'Principal',
  		'Captain: Yellow House',
  		'Captain: Blue House',
  		'Vice Principal',
  		'Pro',
  		'Advanced one',
  		'Clever',
  	];

    public function run()
    {
	    // Static
	    // $this->seedAcademic_year();
	    // $this->seedDepartments();
	    // $this->seedDormitories();
	    // $this->seedTransportVehicles(10);
	    // $this->seedTransports(15);

	    // users (dynamic)
	    // $this->seedAdmins(); // <<<<< truncate all users account here
	    // $this->seedEmployees(15);
	    // $this->seedTeachers(15);
	    // $this->seedSubjects(10);
	    // $this->seedClasses(8);
	    // $this->seedSections(60);
	    // $this->seedStudents(40);
	    // $this->seedParents(20);

	    // $this->seedPayFees(400, 150);
	    // $this->seedNewsBoard(20);
	    // $this->seedEvents(10);
	    // $this->seedAttendance(50);
	    // $this->seedPhoneCalls(10);
	    // $this->seedPostal(50);
	    // $this->seedMailsms(50);
	    // $this->seedMobileNotifications(50);
	    // $this->seedMessages(300);
	    // $this->seedStaticPages();
	    // $this->seedStudentCategories(8);
	    $this->seedNotificationMobHistory(150);
	    // $this->seedHomeworks(15);
	    // $this->seedSyllabus(15);
	    // $this->seedBookLibrary(35);
	    // $this->seedStudentAcademicYears(100);
	    // $this->seedExamsList(4);
	    // $this->seedExamsMarks();
	    // $this->seedTimetable(50);
    }

    // Generate array in string for relationships
    // ---------------------------------------------------

	    protected function generateTeachersString($custom_class_id = null) {
	    	if(is_null($custom_class_id)) {
		    	$teachers_array = User::where('role', 'teacher')
		  		  ->inRandomOrder()
		  		  ->select('id')
		  		  ->limit(mt_rand(6, 15))
		  		  ->get()->pluck('id');
	    	} else {
	    		// to get current teacher ids from detected class id
	    		$classTeacherIds = MClass::where('id', $custom_class_id)->first()->classTeacher;
	    		$teachers_query = User::where('role', 'teacher')
		  		  ->inRandomOrder()
		  		  ->whereIn('id', json_decode($classTeacherIds));
		  		$teachers_array = $teachers_query
		  		  ->limit(round($teachers_query->count() / mt_rand(2, 3)))
		  		  ->select('id')
		  		  ->get()->pluck('id');
	    	}

	    	$teachers_string = '[';
	  		foreach ($teachers_array as $key => $value) {
	  			$teachers_string .= '"' . $value . '",';
	  		}
	  		$teachers_string = substr($teachers_string, 0, -1);
	  		$teachers_string .= ']';

	  		return $teachers_string;
	    }

	    protected function generateClassesInArray() {
	    	$classes = MClass::inRandomOrder()->limit(mt_rand(1, 3))->get()->pluck('id');
	    	$class_string = '[';
	  		foreach ($classes as $key => $value) {
	  			$class_string .= '"' . $value . '",';
	  		}
	  		$class_string = substr($class_string, 0, -1);
	  		$class_string .= ']';

	  		return $class_string;
	    }

	    protected function generateSectionsInArray() {
	    	$sections = Section::inRandomOrder()->limit(mt_rand(1, 3))->get()->pluck('id');
	    	$section_string = '[';
	  		foreach ($sections as $key => $value) {
	  			$section_string .= '"' . $value . '",';
	  		}
	  		$section_string = substr($section_string, 0, -1);
	  		$section_string .= ']';

	  		return $section_string;
	    }

	    protected function generateSubjectsInArray() {
	    	$items = Subject::inRandomOrder()->limit(mt_rand(1, 6))->get()->pluck('id');
	    	$item_string = '[';
	  		foreach ($items as $key => $value) {
	  			$item_string .= '"' . $value . '",';
	  		}
	  		$item_string = substr($item_string, 0, -1);
	  		$item_string .= ']';

	  		return $item_string;
	    }

	    protected function generateVehiclesInArray() {
	    	$vehicles = TransportVehicle::inRandomOrder()->limit(mt_rand(1, 3))->get()->pluck('id');
	    	$vehicles_string = '[';
	  		foreach ($vehicles as $key => $value) {
	  			$vehicles_string .= '"' . $value . '",';
	  		}
	  		$vehicles_string = substr($vehicles_string, 0, -1);
	  		$vehicles_string .= ']';

	  		return $vehicles_string;
	    }

	    protected function generatePaymentRowsInArray() {
	    	$rows = ['Transport fee', 'Tuition fee', 'Lap fee', 'Building fee', 'Library fee', 'Bus fee'];
	    	$string = '[';
	  		foreach ($rows as $value) {
	  			if(mt_rand(0, 1)) {
	  				$string .= '{"title":"' . $value . '","amount":"'. mt_rand(1, 8) * 100 .'"},';
	  			}
	  		}
	  		$string = substr($string, 0, -1);
	  		$string .= ']';

	  		return $string;
	    }

	    protected function generateSingleAdmin($name, $username, $password) {
	    	$faker = Faker::create();

	    	$user = new User;
	      $user->fullName = $name;
	      $user->username = $username;
	      $user->email = $faker->unique()->email;
	      $user->password = Hash::make($password);
	      $user->role = 'admin';
	      $user->role_perm = 2; // for admin
	      $user->department = Department::inRandomOrder()->first()->id;
	      $user->comVia = '["mail","sms","phone"]';
	      $user->phoneNo = mt_rand(100000, 999999);
	      $user->mobileNo = '+' . mt_rand(10, 99) . ' ' . mt_rand(1000000, 9999999);
	      $user->account_active = 1;
	      $user->activated = 1;
	      $user->photo = '0' . mt_rand(0, 98) . '.png';
	      $user->save();
	    }

	    protected function generateSingleParent($faker, $username) {
	    	$user = new User;
	      $user->fullName = '[Pa] ' . $faker->name;
	      $user->username = $username;
	      $user->email = $faker->unique()->email;
	      $user->password = Hash::make(123456);
	      $user->role = 'parent';
	      $user->role_perm = 7;
	      $user->department = mt_rand(1, Department::count());
	      $user->comVia = '["mail","sms","phone"]';
	      $user->phoneNo = mt_rand(1000000, 9999999) .  mt_rand(100, 999);
	      $user->mobileNo = mt_rand(1000000, 9999999);
	      $user->studentClass = mt_rand(1, MClass::count());
	      $user->studentSection = mt_rand(1, Section::count());
	      $random_user = User::where('role', 'student')->inRandomOrder()->first();
	      $user->parentOf = '[{"student":"' . $random_user->fullName . '","relation":"father","id":' . $random_user->id . '}]';
	      $user->account_active = 1;
	      $user->activated = 1;
	      $user->photo = '0' . mt_rand(0, 98) . '.png';
	      $user->save();
	    }

	    protected function generateSingleStudent($faker, $username) {
	    	$user = new User;
	      $user->fullName = '[St] ' . $faker->name;
	      $user->username = $username;
	      $user->email = $faker->unique()->email;
	      $user->password = Hash::make(123456);
	      $user->role = 'student';
	      $user->role_perm = 6;
	      $user->department = mt_rand(1, Department::count());
	      $user->comVia = '["mail","sms","phone"]';
	      $user->phoneNo = mt_rand(1000000, 9999999) .  mt_rand(100, 999);
	      $user->mobileNo = mt_rand(1000000, 9999999);

	      $defaultclassAcademicYearActiveId = AcademicYear::where('isDefault', 1)->first()->id;
	      $random_class_id = MClass::inRandomOrder()
	        ->where('classAcademicYear', $defaultclassAcademicYearActiveId)
	        ->first()->id;
	      $user->studentClass = $random_class_id;
	      $user->studentSection = Section::where('classId', $random_class_id)->inRandomOrder()->first()->id;

	      $user->account_active = 1;
	      $user->activated = 1;
	      $user->photo = '0' . mt_rand(0, 98) . '.png';
	      $user->isLeaderBoard = mt_rand(0, 1) ? $this->leaderBoard[mt_rand(0, count($this->leaderBoard) - 1)] : '';
	      $user->studentRollId = mt_rand(1, 99);
	      $user->admission_number = mt_rand(10, 99) .'-'. mt_rand(100, 999) .'-'. mt_rand(10, 99);

	      $rand_transport = Transportation::inRandomOrder()->first();
	      $current_vehicles_list_array = json_decode($rand_transport->vehicles_list);
	      $user->transport = $rand_transport->id;
	      $user->transport_vehicle = $current_vehicles_list_array[array_rand($current_vehicles_list_array)];
	      $user->save();
	    }

	    protected function generateSingleEmployee($faker, $username) {
	    	$user = new User;
	      $user->fullName = '[Em] ' . $faker->name;
	      $user->username = $username;
	      $user->email = $faker->unique()->email;
	      $user->password = Hash::make(123456);
	      $user->role = 'employee';
	      $user->role_perm = Role::inRandomOrder()->whereNotIn('id', [1, 2, 5, 6, 12])->first()->id;
	      $user->department = mt_rand(1, Department::count());
	      $user->comVia = '["mail","sms","phone"]';
	      $user->phoneNo = mt_rand(100000, 999999);
	      $user->mobileNo = '+' . mt_rand(10, 99) . ' ' . mt_rand(1000000, 9999999);
	      $user->account_active = 1;
	      $user->activated = 1;
	      $user->photo = '0' . mt_rand(0, 98) . '.png';
	      $user->save();
	    }

	    protected function generateSingleTeacher($faker, $username) {
	    	$user = new User;
	      $user->fullName = '[Te] ' . $faker->name;
	      $user->username = $username;
	      $user->email = $faker->unique()->email;
	      $user->password = Hash::make(123456);
	      $user->role = 'teacher';
	      $user->role_perm = 5;
	      $user->department = mt_rand(1, Department::count());
	      $user->comVia = '["mail","sms","phone"]';
	      $user->account_active = 1;
	      $user->activated = 1;
	      $user->photo = '0' . mt_rand(0, 98) . '.png';
	      $user->isLeaderBoard = mt_rand(0, 1) ? $this->leaderBoard[mt_rand(0, count($this->leaderBoard) - 1)] : '';
	      $user->phoneNo = mt_rand(100000, 999999);
	      $user->mobileNo = '+' . mt_rand(10, 99) . ' ' . mt_rand(1000000, 9999999);
	      $user->save();
	    }

	    protected function generateSinglePayFee($current_student_var) {
	    	$faker = Faker::create();

	    	$payment = new Payment();
	    	$payment->paymentTitle = $faker->word() . '_' . mt_rand(100, 999);
	    	$payment->paymentDescription = mt_rand(0, 1) ? $faker->sentence(8) : null;
	    	$payment->paymentRows = $this->generatePaymentRowsInArray();
	    	$payment->paymentDiscount = rand(1, 10) > 8 ? rand(1, 50) : 0;
	    	$payment->paymentDiscounted = rand(1, 10) > 8 ? rand(1, 50) : 0;
	    	$payment->paymentAmount = rand(10, 100) * 10;
	    	$payment->paidAmount = mt_rand(0, 1) ? rand(5, 10) * 10 : 0;
	    	$payment->fine_amount = mt_rand(0, 1) ? rand(1, 10) * 10 : 0;
	    	$payment->paymentStatus = rand(0, 1);
	    	$payment->paymentDate = Carbon::now()->subDays(mt_rand(3, 15))->timestamp;
	    	$payment->dueDate = mt_rand(0, 1) ? Carbon::now()->subDays(mt_rand(1, 3))->timestamp : Carbon::now()->addDays(mt_rand(1, 15))->timestamp;
	    	$payment->paidTime = mt_rand(0, 1) ? Carbon::now()->subDays(mt_rand(1, 15))->timestamp : Carbon::now()->addDays(mt_rand(1, 15))->timestamp;
	    	$payment->discount_id = rand(0, 1);
	    	$methods = Payment::payment_methods();
	    	$payment->paidMethod = $methods[array_rand($methods)];

	    	$student_id1 = json_decode(User::where('role', 'parent')->inRandomOrder()->first()->parentOf)[0]->id;
	    	$student_id2 = json_decode(User::where('username', 'parent')->first()->parentOf)[0]->id;

	    	$payment->paymentStudent = ${"student_id" . $current_student_var};
	    	$payment->save();
    	}



    // Seed tables
    // ---------------------------------------------------

    	protected function seedAttendance($count) {
    		$start = microtime(true);

    		$this->TruncateWithForeignKey('attendance');

  			foreach (range(1, $count) as $i) {
	    		$item = new Attendance;
	      	$item->date = time();
	      	$item->status = mt_rand(0, 1);
	      	$item->in_time = '';
	      	$item->out_time = '';
	      	$item->attNotes = '';
	      	$item->classId = MClass::inRandomOrder()->first()->id;
	      	$item->subjectId = Subject::inRandomOrder()->first()->id;
	      	$item->studentId = User::where('role', 'teacher')->inRandomOrder()->first()->id;
					$item->save();
  			}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedAttendance' . $taken_time . PHP_EOL;
    	}

    	protected function seedTimetable($count) {
    		$start = microtime(true);

    		$this->TruncateWithForeignKey('class_schedule');

	    	$classes = MClass::pluck('id')->toArray();
	    	$sections = Section::pluck('id')->toArray();

	    	foreach ($classes as $class_id) {
	    		foreach ($sections as $section_id) {
	    			foreach (range(1, $count) as $i) {
			    		$item = new ClassSchedule;
			      	$item->dayOfWeek = mt_rand(1, 7);
			      	$item->startTime = mt_rand(0, 1) . mt_rand(0, 9) . mt_rand(0, 5) * 10;
			      	$item->endTime = mt_rand(0, 1) . mt_rand(0, 9) . mt_rand(0, 5) * 10;
			      	$item->classId = $class_id;
			      	$item->sectionId = $section_id;
			      	$item->subjectId = Subject::inRandomOrder()->first()->id;
			      	$item->teacherId = User::where('role', 'teacher')->inRandomOrder()->first()->id;
							$item->save();
	    			}
					}
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedTimetable' . $taken_time . PHP_EOL;
    	}

    	protected function seedStudentAcademicYears($count) {
    		$start = microtime(true);

    		$this->TruncateWithForeignKey('student_academic_years');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$random_student = User::where('role', 'student')->inRandomOrder()->first();

	    		$item = new student_academic_years;
	      	$item->studentId = $random_student->id;
	      	$item->academicYearId = AcademicYear::where('isDefault', 1)->first()->id;
	      	$item->classId = $random_student->studentClass;
	      	$item->sectionId = $random_student->studentSection;
					$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedStudentAcademicYears' . $taken_time . PHP_EOL;
    	}

    	protected function seedExamsList($count) {
    		$start = microtime(true);

    		$this->TruncateWithForeignKey('exams_list');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new exams_list;
	      	$item->examTitle = $faker->sentence(mt_rand(1, 2));
	      	$item->examDescription = mt_rand(0, 1) ? $faker->sentence(mt_rand(8, 15)) : '';
	      	$item->examDate = mt_rand(0, 1) ? Carbon::now()->addDays(mt_rand(1, 15))->timestamp : Carbon::now()->subDays(mt_rand(1, 15))->timestamp;
	      	$item->examEndDate = mt_rand(0, 1) ? Carbon::now()->addDays(mt_rand(1, 15))->timestamp : Carbon::now()->subDays(mt_rand(1, 15))->timestamp;
	      	$item->examAcYear = AcademicYear::inRandomOrder()->first()->id;
	      	$item->examClasses = $this->generateClassesInArray();
	      	$item->examMarksheetColumns = '';
	      	$item->examSchedule = '';
					$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedExamsList' . $taken_time . PHP_EOL;
    	}

    	protected function seedExamsMarks() {
    		$start = microtime(true);

    		$this->TruncateWithForeignKey('exam_marks');
	    	$faker = Faker::create();

	    	$exam_lists = exams_list::pluck('id')->toArray();
	    	$classes = MClass::pluck('id')->toArray();
	    	$students = User::where('role', 'student')->pluck('id')->toArray();

	    	foreach ($exam_lists as $exam_id) {
	    		foreach ($classes as $class_id) {
		    		foreach ($students as $student_id) {
		    			$marks_init = [
			    			'1' => mt_rand(25, 100),
			    			'2' => mt_rand(25, 100),
			    			'3' => mt_rand(25, 100),
			    		];
			    		$totalMarks = 0;
			    		foreach ($marks_init as $key => $mark) {
			    			$totalMarks += $mark;
			    		}

		    			$item = new ExamMark;
			      	$item->examMark = json_encode($marks_init);
			      	$item->totalMarks = $totalMarks;
			      	$item->markComments = null;
			      	$item->examId = $exam_id;
			      	$item->classId = $class_id;
			      	$item->subjectId = Subject::inRandomOrder()->first()->id;
			      	$item->studentId = $student_id;
							$item->save();
			    	}
	    		}
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedExamsMarks' . $taken_time . PHP_EOL;
    	}

	    protected function seedBookLibrary($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('book_library');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new BookLibrary;
	      	$item->bookName = $faker->sentence(mt_rand(1, 2));
	      	$item->bookDescription = mt_rand(0, 1) ? $faker->sentence(mt_rand(8, 15)) : '';
	      	$item->bookISBN = mt_rand(1000, 9999);
	      	$item->bookAuthor = $faker->name();
	      	$item->bookPublisher = $faker->name();
	      	$item->bookType = 'traditional';
	      	$item->bookPrice = mt_rand(1, 99) * 10;
	      	$item->bookFile = null;
	      	$item->bookState = mt_rand(0, 1);
	      	$item->bookQuantity = mt_rand(0, 99);
	      	$item->bookShelf = mt_rand(0, 1) ? $faker->sentence(mt_rand(8, 15)) : '';
					$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedBookLibrary' . $taken_time . PHP_EOL;
	    }

	    protected function seedSyllabus($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('study_material');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new study_material;
	      	$item->class_id = $this->generateClassesInArray();
					$item->sectionId = $this->generateSectionsInArray();
					$item->subject_id = Subject::inRandomOrder()->first()->id;
					$item->teacher_id = User::where('role', 'teacher')->inRandomOrder()->first()->id;
					$item->material_title = $faker->sentence(mt_rand(1, 2));
					$item->material_description = '';
					$item->material_file = '';
					$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedSyllabus' . $taken_time . PHP_EOL;
	    }

	    protected function seedHomeworks($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('homeworks');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new Homework;
	      	$item->classId = $this->generateClassesInArray();
					$item->sectionId = $this->generateSectionsInArray();
					$item->subjectId = Subject::inRandomOrder()->first()->id;
					$item->teacherId = User::where('role', 'teacher')->inRandomOrder()->first()->id;
					$item->homeworkTitle = $faker->sentence(mt_rand(1, 2));
					$item->homeworkDescription = mt_rand(1, 10) <= 7 ? $faker->sentence(mt_rand(3, 7)) : '';
					$item->homeworkFile = '';
					$item->homeworkDate = time();
					$item->homeworkSubmissionDate = mt_rand(0, 1) ? Carbon::now()->addDays(mt_rand(1, 15))->timestamp : Carbon::now()->subDays(mt_rand(1, 15))->timestamp;
					$item->homeworkEvaluationDate = '';
					$item->studentsCompleted = '';
					$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedHomeworks' . $taken_time . PHP_EOL;
	    }

	    protected function seedSubjects($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('subject');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new Subject;
	    		$item->subjectTitle = $faker->sentence(mt_rand(1, 2));
	    		$item->teacherId = $this->generateTeachersString($item->id);
	    		$item->passGrade = mt_rand(1, 5) * 10;
	    		$item->finalGrade = mt_rand(6, 10) * 10;
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedHomeworks' . $taken_time . PHP_EOL;
	    }

	    protected function seedTransportVehicles($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('transport_vehicles');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new TransportVehicle;
	    		$item->plate_number = mt_rand(1000, 9999);
	    		$item->vehicle_color = '';
	    		$item->vehicle_model = $faker->word;
	    		$item->driver_name = $faker->name;
	    		$item->driver_photo = '';
	    		$item->driver_license = mt_rand(10000, 99999) . mt_rand(10000, 99999) . mt_rand(10000, 99999);
	    		$item->driver_contact = $faker->sentence(mt_rand(2, 4));
	    		$item->vehicle_notes = $faker->sentence(mt_rand(4, 6));
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedTransportVehicles' . $taken_time . PHP_EOL;
	    }

	    protected function seedTransports($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('transportation');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new Transportation;
	    		$item->transportTitle = $faker->sentence(1);
	    		$item->routeDetails = mt_rand(0, 1) ? $faker->sentence(mt_rand(2, 3)) : '';
	    		$item->vehicles_list = $this->generateVehiclesInArray();
	    		$item->transportFare = mt_rand(50, 90) * 10;
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedTransports' . $taken_time . PHP_EOL;
	    }

	    protected function seedNotificationMobHistory($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('notifications_mob_history');
	    	$faker = Faker::create();

	    	$names_array = [
	    		'Attenndance for student: '.$faker->name.' is present',
	    		'New home work is added',
	    		'New event was set'
	    	];
	    	$types_array = ['attendance', 'homework', 'events'];

	    	foreach (range(1, $count) as $i) {
	    		$random_value = array_rand($names_array);

	    		$item = new NotificationMobHistory;
	      	$item->name = $faker->sentence(mt_rand(1, 2));
					$item->value = $names_array[$random_value];
					$item->user_id = User::where('role', 'parent')->inRandomOrder()->first()->id;
					$item->date = mt_rand(0, 1) ? Carbon::now()->addDays(mt_rand(1, 5))->toDateTimeString() : Carbon::now()->subDays(mt_rand(1, 5))->toDateTimeString();
					$item->type = $types_array[$random_value];

					if($types_array[$random_value] == 'attendance') {
						$item->payload_id = Attendance::inRandomOrder()->first()->id;
					} else if($types_array[$random_value] == 'homework') {
						$item->payload_id = Homework::inRandomOrder()->first()->id;
					} else if($types_array[$random_value] == 'events') {
						$item->payload_id = Event::inRandomOrder()->first()->id;
					}

					$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedNotificationMobHistory' . $taken_time . PHP_EOL;
	    }

	    protected function seedStudentCategories($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('student_categories');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $i) {
	    		$item = new StudentCategory;
	    		$item->cat_title = $faker->sentence(1);
	      	$item->cat_desc = mt_rand(0, 1) ? $faker->sentence(mt_rand(8, 20)) : '';
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedStudentCategories' . $taken_time . PHP_EOL;
	    }

	    protected function seedStaticPages() {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('static_pages');
	    	$faker = Faker::create();
	    	$items = ['Home', 'About us', 'CMS', 'Sections', 'Subjects'];

	    	foreach ($items as $key => $value) {
	    		$item = new StaticPage;
	    		$item->pageTitle = $value;
	      	$item->pageContent = $faker->sentence(mt_rand(8, 20));
	      	$item->pageActive = 1;
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedStaticPages' . $taken_time . PHP_EOL;
	    }

	    protected function seedDormitories() {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('dormitories');
	    	$faker = Faker::create();
	    	$dormitories = ['dormitory 1', 'dormitory 2', 'dormitory 3', 'dormitory 4'];

	    	foreach ($dormitories as $key => $value) {
	    		$item = new Dormitory;
	    		$item->dormitory = $value;
	      	$item->dormDesc = '';
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedDormitories' . $taken_time . PHP_EOL;
	    }

	    protected function seedSections($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('sections');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $key => $value) {
	    		$item = new Section;
	    		$item->sectionName = $faker->word() . ' Sec';
	    		$random_class_id = MClass::inRandomOrder()->first()->id;
	      	$item->classId = $random_class_id;
	      	$item->classTeacherId = $this->generateTeachersString($random_class_id); // many
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedSections' . $taken_time . PHP_EOL;
	    }

	    protected function seedClasses($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('classes');
	    	$faker = Faker::create();

	    	foreach (range(1, $count) as $key => $value) {
	    		$teachers_string = $this->generateTeachersString();
	    		$item = new MClass;
	    		$item->className = $faker->sentence(1) . ' Class';
	      	$item->classTeacher = $teachers_string;
	      	$item->classAcademicYear = mt_rand(1, AcademicYear::count());
	      	$item->classSubjects = $this->generateSubjectsInArray();
	      	$item->dormitoryId = mt_rand(1, Dormitory::count());
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedClasses' . $taken_time . PHP_EOL;
	    }

	    protected function seedDepartments() {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('departments');
	    	$faker = Faker::create();
	    	$departments = ['department1', 'department2', 'department3', 'department4'];

	    	foreach ($departments as $key => $value) {
	    		$item = new Department;
	    		$item->depart_title = $value;
	      	$item->depart_desc = '';
	      	$item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedDepartments' . $taken_time . PHP_EOL;
	    }

	    protected function seedAdmins() {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('users');

	    	$this->generateSingleAdmin('Ahmed Sayed', 'ahmedsk', '123456');
	    	$this->generateSingleAdmin('Virtu', 'virtu', 'admin123');

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedAdmins' . $taken_time . PHP_EOL;
	    }

	    public function seedAcademic_year() {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('academic_year');
	    	$faker = Faker::create();

	      $item = new AcademicYear;
	      $item->yearTitle = '2019 - 2020';
	      $item->isDefault = 1;
	      $item->save();

	      $item = new AcademicYear;
	      $item->yearTitle = '2020 - 2021';
	      $item->isDefault = 0;
	      $item->save();

	      $end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	      echo "seedAcademic_year" . $taken_time . PHP_EOL;
	    }

	    protected function seedMessages($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('messages');
	    	$this->TruncateWithForeignKey('messages_list');

	    	$faker = Faker::create();
	    	foreach(range(1, $count) as $i) {
	    		$user_id = mt_rand(1, User::count());
	    		$to_id = mt_rand(1, User::count());
	    		$enable_reply = mt_rand(0, 1);

		      $item1 = new MessagesList;
		      $item1->userId = $user_id;
		      $item1->toId = $to_id;
		      $item1->lastMessage = $faker->sentence(mt_rand(1, 4));
		      $item1->lastMessageDate = time();
		      $item1->messageStatus = mt_rand(0, 1);
		      $item1->enable_reply = $enable_reply;
		      $item1->save();
		      // ------------------------------------
		      $item2 = new Message;
		      $item2->messageId = $item1->id;
		      $item2->userId = $user_id;
		      $item2->fromId = mt_rand(1, User::count());
		      $item2->toId = $to_id;
		      $item2->messageText = $faker->sentence(mt_rand(1, 4));
		      $item2->dateSent = time();
		      $item2->enable_reply = $enable_reply;
		      $item2->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedMessages' . $taken_time . PHP_EOL;
	    }

	    protected function seedMobileNotifications($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('mob_notifications');

	    	$faker = Faker::create();
	    	foreach(range(1, $count) as $i) {
		      $item = new MobNotification;
		      $item->notifTo = $faker->name();
		      $item->notifToIds = ['students', 'parents', 'teachers', 'employees'][mt_rand(0, 3)];
		      $item->notifData = $faker->sentence(mt_rand(4, 8));
		      $item->notifDate = time();
		      $item->notifSender = $faker->name();
		      $item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedMobileNotifications' . $taken_time . PHP_EOL;
	    }

	    protected function seedMailsms($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('mailsms');

	    	$faker = Faker::create();
	    	foreach(range(1, $count) as $i) {
		      $item = new Mailsms;
		      $item->mailTo = $faker->name();
		      $item->mailType = $faker->word();
		      $item->messageData = $faker->sentence(mt_rand(4, 8));
		      $item->messageDate = time();
		      $item->messageSender = $faker->name();
		      $item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedMailsms' . $taken_time . PHP_EOL;
	    }

	    protected function seedPostal($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('postal');

	    	$faker = Faker::create();
	    	foreach(range(1, $count) as $i) {
		      $item = new postal;
		      $item->postal_type = $faker->word();
		      $item->refno = mt_rand(10000, 99999);
		      $item->postal_from = $faker->sentence(mt_rand(1, 2));
		      $item->postal_to = $faker->sentence(mt_rand(1, 2));
		      $item->postal_desc = $faker->sentence(mt_rand(3, 6));
		      $item->postal_time = time();
		      $item->postal_notes = $faker->sentence(mt_rand(3, 6));
		      $item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedPostal' . $taken_time . PHP_EOL;
	    }

	    protected function seedPhoneCalls($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('phone_calls');

	    	$faker = Faker::create();
	    	foreach(range(1, $count) as $i) {
		      $item = new PhoneCall;
		      $item->FullName = $faker->sentence(mt_rand(2, 4));
		      $item->phoneNo = mt_rand(10000, 99999);
		      $item->email = $faker->unique()->email;
		      $item->call_type = $faker->word();
		      $item->purpose = $faker->word();
		      $item->call_time = time();
		      $item->nxt_follow = $faker->word();
		      $item->call_duration = mt_rand(1, 30) . ' minutes';
		      $item->call_details = $faker->sentence(mt_rand(6, 10));
		      $item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedPhoneCalls' . $taken_time . PHP_EOL;
	    }

	    protected function seedEvents($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('events');

	    	$faker = Faker::create();
	    	foreach(range(1, $count) as $i) {
		      $item = new Event;
		      $item->eventTitle = $faker->sentence(mt_rand(2, 4));
		      $item->eventDescription = $faker->sentence(mt_rand(5, 12));
		      $item->eventFor = ['all', 'teacher', 'students', 'parents'][mt_rand(0, 3)];
		      $item->enentPlace = $faker->sentence(1);
		      $item->fe_active = mt_rand(0, 1);
		      $item->eventDate = mt_rand(0, 1) ? Carbon::now()->addDays(mt_rand(1, 15))->timestamp : Carbon::now()->subDays(mt_rand(1, 15))->timestamp;
		      $item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedEvents' . $taken_time . PHP_EOL;
	    }

	    protected function seedNewsBoard($count) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('newsboard');

	    	$faker = Faker::create();
	    	foreach(range(1, $count) as $i) {
		      $item = new Newsboard;
		      $item->newsTitle = $faker->sentence(mt_rand(2, 4));
		      $item->newsText = $faker->sentence(mt_rand(7, 10));
		      $item->newsFor = ['all', 'teacher', 'students', 'parents'][mt_rand(0, 3)];
		      $item->newsDate = time();
		      $item->fe_active = mt_rand(0, 1);
		      $item->creationDate = time();
		      $item->save();
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedNewsBoard' . $taken_time . PHP_EOL;
	    }

	    protected function seedEmployees($count) {
	    	$start = microtime(true);

	    	User::where('role', 'employee')->delete();
	    	$faker = Faker::create();

	    	$this->generateSingleEmployee($faker, 'employee');

	    	foreach(range(1, $count) as $i) {
	    		$this->generateSingleEmployee($faker, $faker->username);
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedEmployees' . $taken_time . PHP_EOL;
	    }

	    protected function seedTeachers($count) {
	    	$start = microtime(true);

	    	User::where('role', 'teacher')->delete();
	    	$faker = Faker::create();

	    	$this->generateSingleTeacher($faker, 'teacher');

	    	foreach(range(1, $count) as $i) {
	    		$this->generateSingleTeacher($faker, $faker->username);
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedTeachers' . $taken_time . PHP_EOL;
	    }

	    protected function seedParents($count) {
	    	$start = microtime(true);

	    	// Truncate parents
	    	User::where('role', 'parent')->delete();

	    	$faker = Faker::create();

	    	$this->generateSingleParent($faker, 'parent');

	    	foreach(range(1, $count) as $i) {
	    		$this->generateSingleParent($faker, $faker->username);
		    }

		    $end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
		    echo 'seedParents' . $taken_time . PHP_EOL;
	    }

	    protected function seedStudents($count) {
	    	$start = microtime(true);

	    	User::where('role', 'student')->delete();

	    	$faker = Faker::create();

	    	$this->generateSingleStudent($faker, 'student');

	    	foreach(range(1, $count) as $i) {
	    		$this->generateSingleStudent($faker, $faker->username);
		    }

		    $end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
		    echo 'seedStudents' . $taken_time . PHP_EOL;
	    }

	    protected function seedPayFees($unpaid_counts, $paid_counts) {
	    	$start = microtime(true);

	    	$this->TruncateWithForeignKey('payments');

	    	foreach (range(1, $unpaid_counts) as $key => $value) {
		    	$this->generateSinglePayFee(1);
	    	}
	    	foreach (range(1, $paid_counts) as $key => $value) {
		    	$this->generateSinglePayFee(2);
	    	}

	    	$end = microtime(true);
	      $taken_time = " " . round($end - $start, 2) . 's';
	    	echo 'seedPayFees' . $taken_time . PHP_EOL;
    	}

    // ---------------------------------------------------
}
