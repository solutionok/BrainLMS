<?php
namespace App\Http\Controllers;

use App\Jobs\CreatePdfConverterJob;

class LibraryController extends Controller {

	var $data = array();
	var $panelInit ;
	var $layout = 'dashboard';

	public function __construct(){
		if(app('request')->header('Authorization') != "" || \Input::has('token')){
			$this->middleware('jwt.auth');
		}else{
			$this->middleware('authApplication');
		}

		$this->panelInit = new \DashboardInit();
		$this->data['panelInit'] = $this->panelInit;
		$this->data['breadcrumb']['Settings'] = \URL::to('/dashboard/languages');
		$this->data['users'] = $this->panelInit->getAuthUser();
		if(!isset($this->data['users']->id)){
			return \Redirect::to('/');
		}

	}

	public function listAll($page = 1)
	{

		if(!$this->panelInit->can( array(
			"Library.list","Library.addBook",
			"Library.editBook","Library.delLibrary",
			"Library.Download","Library.mngSub",
			"Library.export","Library.import",
		) )){
			exit;
		}

		$toReturn = array();
		$toReturn['bookLibrary'] = \book_library::orderBy('id','DESC')
		  ->take(all_pagination_number())
		  ->skip(all_pagination_number() * ($page - 1) )
		  ->get()->toArray();

		foreach ($toReturn['bookLibrary'] as $key => $book) {
			$item_dir = explode('.', $book['bookFile'])[0];
			$images_dir = uploads_config()['uploads_file_path'] . '/books/' . $item_dir;
			if(\File::exists($images_dir) && !empty($item_dir)) {
				$toReturn['bookLibrary'][$key]['dir_images_count'] = count(\File::files($images_dir));
				$dir_images_array = [];
				foreach (\File::files($images_dir) as $image_path) {
					$_image_path = str_replace(
						uploads_config()['uploads_file_path'],
						uploads_config()['uploads_provider'],
						$image_path
					);
					$dir_images_array[] = $_image_path;
				}
				$dir_images_array = $this->sort_pdf_image_array($dir_images_array);
				$toReturn['bookLibrary'][$key]['dir_images_array'] = $dir_images_array;
			} else {
				$toReturn['bookLibrary'][$key]['dir_images_count'] = 0;
				$toReturn['bookLibrary'][$key]['dir_images_array'] = [];
			}
		}

		$toReturn['totalItems'] = \book_library::count();
		$toReturn['userRole'] = $this->data['users']->role;
		return $toReturn;
	}

	public function search($keyword,$page = 1)
	{

		if(!$this->panelInit->can( array("Library.list","Library.addBook","Library.editBook","Library.delLibrary","Library.Download","Library.mngSub") )){
			exit;
		}

		$toReturn = array();
		$toReturn['bookLibrary'] = \book_library::where('bookName','like','%'.$keyword.'%')->orWhere('bookDescription','like','%'.$keyword.'%')->orWhere('bookAuthor','like','%'.$keyword.'%')->orderBy('id','DESC')->take(all_pagination_number())->skip(all_pagination_number()* ($page - 1) )->get()->toArray();
		$toReturn['totalItems'] = \book_library::where('bookName','like','%'.$keyword.'%')->orWhere('bookDescription','like','%'.$keyword.'%')->orWhere('bookAuthor','like','%'.$keyword.'%')->count();
		return $toReturn;
	}

	public function delete($id){

		if(!$this->panelInit->can( "Library.delLibrary" )){
			exit;
		}

		if ( $postDelete = \book_library::where('id', $id)->first() ) {
			$dirname = explode('.', $postDelete->bookFile)[0];

			@unlink(uploads_config()['uploads_file_path'] . '/books/'.$postDelete->bookFile);
			$current_dir_path = uploads_config()['uploads_file_path'] . '/books/'.$dirname.'/';
			if(\File::exists($current_dir_path)) {
				// chmod($current_dir_path, 0777);
				\File::deleteDirectory($current_dir_path);
			}

			user_log('Library', 'delete', $postDelete->bookName);
      $postDelete->delete();
      return $this->panelInit->apiOutput(true,$this->panelInit->language['delLibrary'],$this->panelInit->language['itemdel']);
    }else{
        return $this->panelInit->apiOutput(false,$this->panelInit->language['delLibrary'],$this->panelInit->language['itemNotExist']);
    }
	}

	public function download($id){

		if(!$this->panelInit->can( "Library.Download" )){
			exit;
		}

		$toReturn = \book_library::where('id',$id)->first();
		if(file_exists(uploads_config()['uploads_file_path'] . '/books/'.$toReturn->bookFile)){
			$fileName = preg_replace('/[^a-zA-Z0-9-_\.]/','-',$toReturn->bookName). "." .pathinfo($toReturn->bookFile, PATHINFO_EXTENSION);
			user_log('Library', 'download', $toReturn->bookName);
			header("Content-Type: application/force-download");
			header("Content-Disposition: attachment; filename=" . $fileName);
			echo file_get_contents(uploads_config()['uploads_file_path'] . '/books/'.$toReturn->bookFile);
		}else{
			echo "<br/><br/><br/><br/><br/><center>File not exist, Please contact site administrator to reupload it again.</center>";
		}
		exit;
	}

	public function create(){

		if(!$this->panelInit->can( "Library.addBook" )){
			exit;
		}

		$bookLibrary = new \book_library();
		$bookLibrary->bookName = \Input::get('bookName');
		$bookLibrary->bookDescription = \Input::get('bookDescription');
		$bookLibrary->bookAuthor = \Input::get('bookAuthor');
		$bookLibrary->bookType = \Input::get('bookType');
		$bookLibrary->bookPrice = \Input::get('bookPrice');
		$bookLibrary->bookState = \Input::get('bookState');
		if(\Input::has('bookQuantity')){
			$bookLibrary->bookQuantity = \Input::get('bookQuantity');
		}
		if(\Input::has('bookShelf')){
			$bookLibrary->bookShelf = \Input::get('bookShelf');
		}
		if(\Input::has('bookPublisher')){
			$bookLibrary->bookPublisher = \Input::get('bookPublisher');
		}
		if(\Input::get('bookISBN')){
			$bookLibrary->bookISBN = \Input::get('bookISBN');
		}
		$bookLibrary->save();

		user_log('Library', 'create', $bookLibrary->bookName);

		if (\Input::hasFile('bookFile')) {
			$fileInstance = \Input::file('bookFile');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addBook'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['addBook'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$newFileNameWithoutExt = "book_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/books/',$newFileName);

			$bookLibrary->bookFile = $newFileName;
			$bookLibrary->save();

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/books/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/books/' . $newFileName
			));
		}

		return $this->panelInit->apiOutput(true,$this->panelInit->language['addBook'],$this->panelInit->language['bookAdded'],$bookLibrary->toArray() );
	}

	function fetch($id){

		if(!$this->panelInit->can( "Library.editBook" )){
			exit;
		}

		$data = \book_library::where('id',$id)->first()->toArray();
		return json_encode($data);
	}

	function edit($id){

		if(!$this->panelInit->can( "Library.editBook" )){
			exit;
		}

		$bookLibrary = \book_library::find($id);
		$bookLibrary->bookName = \Input::get('bookName');
		$bookLibrary->bookDescription = \Input::get('bookDescription');
		$bookLibrary->bookAuthor = \Input::get('bookAuthor');
		$bookLibrary->bookType = \Input::get('bookType');
		$bookLibrary->bookPrice = \Input::get('bookPrice');
		$bookLibrary->bookState = \Input::get('bookState');
		if(\Input::has('bookQuantity')){
			$bookLibrary->bookQuantity = \Input::get('bookQuantity');
		}
		if(\Input::has('bookShelf')){
			$bookLibrary->bookShelf = \Input::get('bookShelf');
		}
		if(\Input::has('bookPublisher')){
			$bookLibrary->bookPublisher = \Input::get('bookPublisher');
		}
		if(\Input::get('bookISBN')){
			$bookLibrary->bookISBN = \Input::get('bookISBN');
		}
		if (\Input::hasFile('bookFile')) {

			$fileInstance = \Input::file('bookFile');

			if(!$this->panelInit->validate_upload($fileInstance)){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editBook'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			if($fileInstance->getClientOriginalExtension() != 'pdf'){
				return $this->panelInit->apiOutput(false,$this->panelInit->language['editBook'],"Sorry, This File Type Is Not Permitted For Security Reasons ");
			}

			$dirname = explode('.', $bookLibrary->bookFile)[0];
			@unlink(uploads_config()['uploads_file_path'] . "/books/".$bookLibrary->bookFile);
			$current_dir_path = uploads_config()['uploads_file_path'] . '/books/'.$dirname.'/';
			if(\File::exists($current_dir_path)) {
				// chmod($current_dir_path, 0777);
				\File::deleteDirectory($current_dir_path);
			}

			$newFileNameWithoutExt = "book_".uniqid();
			$newFileName = $newFileNameWithoutExt.".".$fileInstance->getClientOriginalExtension();
			$fileInstance->move(uploads_config()['uploads_file_path'] . '/books/',$newFileName);

			$bookLibrary->bookFile = $newFileName;

			dispatch(new CreatePdfConverterJob(
				uploads_config()['uploads_file_path'] . '/books/' . $newFileNameWithoutExt,
				uploads_config()['uploads_file_path'] . '/books/' . $newFileName
			));
		}
		$bookLibrary->save();

		user_log('Library', 'edit', $bookLibrary->bookName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['editBook'],$this->panelInit->language['bookModified'],$bookLibrary->toArray() );
	}

	function library_members(){

		if(!$this->panelInit->can( "Library.mngSub" )){
			exit;
		}

		$retArray = array();
		$retArray['users'] = array();

		$user = \Input::get('user_search');
		$retArray['users'] = \User::where(function($query) use ($user){
						$query->where('fullName','like','%'.$user.'%')->orWhere('username','like','%'.$user.'%')->orWhere('email','like','%'.$user.'%');
					})->select('id','fullName','email','role_perm','library_id')->get();

		$retArray['prems'] = array();
		$perms = \roles::select('id','role_title')->get();
		foreach ($perms as $key => $value) {
			$retArray['prems'][$value->id] = $value->role_title;
		}

		return $retArray;
	}

	function library_members_set(){

		if(!$this->panelInit->can( "Library.mngSub" )){
			exit;
		}

		$User = \User::find( \Input::get('user') );
		$User->library_id = \Input::get('library_id');
		$User->save();

		user_log('Library', 'assign_library', $User->fullName);

		return $this->panelInit->apiOutput(true,$this->panelInit->language['mngSub'],$this->panelInit->language['subChged']);
	}

	public function import($type){
		if(!$this->panelInit->can( "Library.Import" )){
			exit;
		}

		if (\Input::hasFile('excelcsv')) {

			if ( $_FILES['excelcsv']['tmp_name'] )
			{
				$readExcel = \Excel::load($_FILES['excelcsv']['tmp_name'], function($reader) { })->get();

				$dataImport = array("ready"=>array(),"revise"=>array());

				foreach ($readExcel as $row)
				{
					$importItem = array();
					if(isset($row['book_name']) AND $row['book_name'] != null){
						$importItem['book_name'] = $row['book_name'];
					}
          if(isset($row['book_isbn']) AND $row['book_isbn'] != null){
						$importItem['book_isbn'] = $row['book_isbn'];
					}
					if(isset($row['author']) AND $row['author'] != null){
						$importItem['author'] = $row['author'];
					}
					if(isset($row['publisher']) AND $row['publisher'] != null){
						$importItem['publisher'] = $row['publisher'];
					}
					if(isset($row['type']) AND $row['type'] != null){
						$importItem['type'] = $row['type'];
					}
					if(isset($row['price']) AND $row['price'] != null){
						$importItem['price'] = $row['price'];
					}

					if(isset($importItem['error']) && count($importItem['error']) > 0){
						$dataImport['revise'][] = $importItem;
					}else{
						$dataImport['ready'][] = $importItem;
					}
				}

				user_log('Library', 'import');

				$toReturn = array();
				$toReturn['dataImport'] = $dataImport;

				return $toReturn;
			}
		}else{
			return json_encode(array(
				"jsTitle"=>$this->panelInit->language['Import'],
				"jsStatus"=>"0",
				"jsMessage"=>$this->panelInit->language['specifyFileToImport'] ));
			exit;
		}
		exit;
	}

	public function reviewImport(){

		if(!$this->panelInit->can( "Library.Import" )){
			exit;
		}

		if(\Input::has('importReview')){
			$importReview = \Input::get('importReview');
			if(!isset($importReview['ready'])){
				$importReview['ready'] = array();
			}
			if(!isset($importReview['revise'])){
				$importReview['revise'] = array();
			}
			$importReview = array_merge($importReview['ready'], $importReview['revise']);

			if(count($importReview) > 0){
				foreach($importReview as $value){
					$book = new \App\Models2\book_library;
					if(isset($value['book_name'])){
						$book->bookName = $value['book_name'];
					}
					if(isset($value['book_isbn'])){
						$book->bookISBN = $value['book_isbn'];
					}
					if(isset($value['author'])){
						$book->bookAuthor = $value['author'];
					}
					if(isset($value['publisher'])){
						$book->bookPublisher = $value['publisher'];
					}
					if(isset($value['type'])){
						$book->bookType = $value['type'];
					}
					if(isset($value['price'])){
						$book->bookPrice = $value['price'];
					}
					$book->save();
				}
				return $this->panelInit->apiOutput(true,
					$this->panelInit->language['Import'],
					$this->panelInit->language['dataImported']
				);
			}
		}else{
			return $this->panelInit->apiOutput(true,
				$this->panelInit->language['Import'],
				$this->panelInit->language['noDataImport']);
			exit;
		}
		exit;
	}

	public function export(){

		if(!$this->panelInit->can( "Library.Export" )){
			exit;
		}

		$data = array(1 => array (
			'Book name',
			'Book ISBN',
			'Author',
			'Publisher',
			'Type',
			'Price',
		));

		$books = \book_library::get();

		foreach ($books as $key => $book) {
			$data[] = [
				$book->bookName,
				$book->bookISBN,
				$book->bookAuthor,
				$book->bookPublisher,
				$book->bookType,
				$book->bookPrice,
			];
		}

		user_log('Library', 'export');

		\Excel::create('Book-library-Sheet', function($excel) use($data) {

	    // Set the title
	    $excel->setTitle('Book library Sheet');

	    // Chain the setters
	    $excel->setCreator('Cutebrains')->setCompany('Virtu');

			$excel->sheet('Book-library', function($sheet) use($data) {
				$sheet->freezeFirstRow();
				$sheet->fromArray($data, null, 'A1', true,false);
			});

		})->download('xls');
	}

	public function exportpdf(){
		if(!$this->panelInit->can( "Library.Export" )){
			exit;
		}

		$header = array (
			'Book name',
			'Book ISBN',
			'Author',
			'Publisher',
			'Type',
			'Price',
		);

		$data = array();
		$books = \book_library::get();
		foreach ($books as $key => $book) {
			$data[] = [
				$book->bookName,
				$book->bookISBN,
				$book->bookAuthor,
				$book->bookPublisher,
				$book->bookType,
				$book->bookPrice,
			];
		}

		$doc_details = array(
							"title" => "Books List",
							"author" => $this->data['panelInit']->settingsArray['siteTitle'],
							"topMarginValue" => 10
							);

		if( $this->panelInit->isRTL == "1" ){
			$doc_details['is_rtl'] = true;
		}

		user_log('Library', 'export');

		$pdfbuilder = new \PdfBuilder($doc_details);

		$content = "<table cellspacing=\"0\" cellpadding=\"4\" border=\"1\">
	        <thead><tr>";
			foreach ($header as $value) {
				$content .="<th style='width:15%;border: solid 1px #000000; padding:2px;'>".$value."</th>";
			}
		$content .="</tr></thead><tbody>";

		foreach($data as $row)
		{
			$content .= "<tr>";
			foreach($row as $col){
				$content .="<td>".$col."</td>";
			}
			$content .= "</tr>";
		}

        $content .= "</tbody></table>";

		$pdfbuilder->table($content, array('border' => '0','align'=>'') );
		$pdfbuilder->output('Books_list.pdf');
	}
}
