<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {


	 public function __construct()
    {
        parent::__construct();
           
        $this->load->model('admin/event_model');       

     }

	public function index()
	{
		$data = array();

		$data["file"]="index";
		$data["title"]="Funriture Website";
		$this->load->view('template',$data);
	}

	public function about()
	{
		$data = array();

		$data["file"]="about-us";
		$data["title"]="Funriture Website : About Us";
		$this->load->view('template',$data);
	}

	public function events()
	{
		$data = array();

	/*	$where = array();
		$where['table'] = 'z_event';
		$where['status'] = '1';
		$data['event_dtl'] = $this->event_model->findDynamic($where);*/

		$data["file"]="event";
		$data["title"]="Funriture Website : Services";
		$this->load->view('template',$data);
	}

	public function contact()
	{
		$data = array();

		$data["file"]="contact-us";
		$data["title"]="Funriture Website : Contact Us";
		$this->load->view('template',$data);
	}

	public function privacypolicy()
	{
		$data = array();

		$data["file"]="privacy-policy";
		$data["title"]="Funriture Website : Privacy Policy";
		$this->load->view('template',$data);
	}


	public function refundpolicy()
	{
		$data = array();

		$data["file"]="refund-policy";
		$data["title"]="Funriture Website : Refund Policy";
		$this->load->view('template',$data);
	}


	public function terms()
	{
		$data = array();

		$data["file"]="terms";
		$data["title"]="Funriture Website : Terms & Conditions";
		$this->load->view('template',$data);
	}


}
