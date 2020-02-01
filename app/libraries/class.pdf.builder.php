<?php

class PdfBuilder {

  public $tcpdf = array();
  public $doc_details = array();

	public function __construct($doc_details = array()){
    //require_once('app/libraries/TCPDF/tcpdf.php');
    $this->doc_details = $doc_details;

    if(!isset($this->doc_details['orientation'])){
    	$this->doc_details['orientation'] = 'P';
    }

		// create new PDF document
		$this->tcpdf = new \TCPDF($this->doc_details['orientation'], 'mm', 'A4', true, 'UTF-8', false);
		$this->tcpdf->SetCreator("Cutebrains 1.0");
		$this->tcpdf->SetAuthor($this->doc_details['author']);
		$this->tcpdf->SetTitle($this->doc_details['title']);
		$this->tcpdf->SetSubject($this->doc_details['title']);

        // set default header data
		$topMarginValue = $this->doc_details['topMarginValue'];

        // $this->tcpdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "", "",array(0,0,0), array(255,255,255) );
		$this->tcpdf->SetHeaderMargin('10');
		$topMarginValue = 13;
        $this->tcpdf->SetFont('freeserif', '', 9);

		// set header and footer fonts
		$this->tcpdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$this->tcpdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

		// set default monospaced font
		//$this->tcpdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

		// set margins
		$this->tcpdf->SetMargins('13', $topMarginValue, '13');
		$this->tcpdf->SetFooterMargin('10');

		// set auto page breaks
		$this->tcpdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

		// set image scale factor
		$this->tcpdf->setImageScale('1.25');

		// set some language-dependent strings (optional)
		$lg = Array();
		$lg['a_meta_charset'] = 'UTF-8';
		if ( isset($doc_details['is_rtl']) AND $doc_details['is_rtl'] == true ) {
			$lg['a_meta_dir'] = 'rtl';
			$lg['a_meta_language'] = 'fa';
		}

		$this->tcpdf->setLanguageArray($lg);

		// add a page
		$this->tcpdf->AddPage();

	}

    function addPage(){
        $this->tcpdf->AddPage();
    }

    function space($height){
        $this->tcpdf->Ln($height);
    }

    function setFont($name,$style,$size){
        $this->tcpdf->SetFont($name,$style, $size);
    }

    function table($table,$table_pro=array()){

        $this->tcpdf->writeHTML($table, true, false, false, false);
    }

    function html($html,$align=""){
        $this->tcpdf->writeHTML($html, true, false, false, false, $align);
    }

    function output($name,$viewordown="I"){
        $this->tcpdf->lastPage();
        $this->tcpdf->Output($name, $viewordown);
    }

}
