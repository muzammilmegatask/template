<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Event extends BaseController
{
   
    public function __construct()
    {
        parent::__construct();
           
        $this->load->model('admin/event_model');
        $this->isLoggedIn(); 
        

     }

    
    public function index()
    {
        
        $data = array();
        
        $this->global['pageTitle']  = 'Dubai Capital Stone : Event List';


        $this->loadViews("admin/event/list", $this->global, $data , NULL);
        
    }

    // Add New 
    public function addnew()
    {
        
        // category
        
        $data = array();

         $where = array();
        $where['status'] = 1;
        $where['field'] = 'id,event_heading';
        $where['table'] = 'z_event';
        $organization_name = $this->event_model->findDynamic($where);
        $data['organization_list'] = $organization_name;

        $this->global['pageTitle'] = 'Dubai Capital Stone : Add New Admin';
        $this->loadViews("admin/event/addnew", $this->global, $data , NULL);
        
    } 

    public function insertnow()
    {
        
        
        
        
        $this->load->library('form_validation');
        $this->form_validation->set_rules('event_heading','Event Heading','trim|required');
        $this->form_validation->set_rules('event_location','Event Location','trim|required');
        $this->form_validation->set_rules('event_start_date','Event Start Date','trim|required');
        $this->form_validation->set_rules('event_end_date','Event End Date','trim|required');
        $this->form_validation->set_rules('event_start_time','Event Start Time','trim|required');
        $this->form_validation->set_rules('event_end_time','Event End Time','trim|required');
        $this->form_validation->set_rules('event_description','Event Description','trim|required');
        $this->form_validation->set_rules('status','status','trim|required');
        
         
        $form_data  = $this->input->post();
        if($this->form_validation->run() == FALSE)
        {
            $this->addnew();
        }
        else
        {
                $slug_url = strtolower( $form_data['event_heading']);
                $slug_url = str_replace(',', '', $slug_url);
                $slug_url = str_replace(' ', '-',  $slug_url);
                $date = date('Y-m-d H:i:s');

                $strt_date = date('Y-m-d H:i:s');
                $end_date = date('Y-m-d H:i:s');



                if(isset($_FILES['event_image']['name']) && $_FILES['event_image']['name'] != '') {



                $f_name         =$_FILES['event_image']['name'];
                $f_tmp          =$_FILES['event_image']['tmp_name'];
                $f_size         =$_FILES['event_image']['size'];
                $f_extension    =explode('.',$f_name);
                $f_extension    =strtolower(end($f_extension));
                $f_newfile      =uniqid().'.'.$f_extension;
                $store          ="uploads/event_img/".$f_newfile;
            
                if(!move_uploaded_file($f_tmp,$store))
                {
                    $this->session->set_flashdata('error', 'Image Upload Failed .');
                }
                else
                {
                   $insertData['event_image'] = $f_newfile;
                   
                }
             }
             
             
                $insertData['event_heading']   = $form_data['event_heading'];
                $insertData['event_location']        = $form_data['event_location'];
                $insertData['event_start_date']        = $strt_date;
                $insertData['event_end_date']        =   $end_date;
                $insertData['event_start_time']        = date("H:i:s",strtotime($form_data['event_start_time']));
                $insertData['event_end_time']        = date("H:i:s",strtotime($form_data['event_end_time']));
                $insertData['event_description']        = $form_data['event_description'];
                $insertData['slug_url']             = $slug_url;
                $insertData['status']       = "1";
                $insertData['date_at']      = $date;
                
                 
                $result = $this->event_model->save($insertData);
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'Event successfully Added');
                }
                else
                { 
                    $this->session->set_flashdata('error', 'Event Addition failed');
                }    
            redirect('admin/event');
          }  
        
    }
    
    

    // Member list
    public function ajax_list()
    {
		$list = $this->event_model->get_datatables();
	 
		$data = array();
        $no =(isset($_POST['start']))?$_POST['start']:'';
        foreach ($list as $currentObj) {

            $filename = (isset($currentObj->event_image) && $currentObj->event_image !=='') ? ($currentObj->event_image) : ("");

            $temp_date = $currentObj->date_at;
            $selected = ($currentObj->status == 0)?" selected ":"";
             
            $btn = '<select class="statusBtn" name="statusBtn" data-id="'.$currentObj->id.'">';
            $btn .= '<option value="1"  >Active</option>';
            $btn .= '<option value="0" '.$selected.' >Inactive</option>';
            $btn .= '</select>';
            $dateAt = date("d-m-Y H:ia", strtotime($temp_date));

            $no++;
            $row = array();
            $row[] = $no;
            
            $row[] = '<img src ="'.base_url().'uploads/event_img/'.$filename.'" width="80" alt = "event_img"/>';
            $row[] = $currentObj->event_heading;
            $row[] = $currentObj->event_location;
            $row[] = $currentObj->event_start_date;
            $row[] = $currentObj->event_start_time;
            $row[] = $currentObj->event_description;
            $row[] = $btn;
            $row[] = '<a class="btn btn-sm btn-info" href="'.base_url().'admin/event/edit/'.$currentObj->id.'" title="Edit" ><i class="fa fa-pencil"></i></a>&nbsp;<a class="btn btn-sm btn-danger deletebtn" href="#" data-userid="'.$currentObj->id.'"><i class="fa fa-trash"></i></a>';
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => (isset($_POST['draw']))?$_POST['draw']:'',
                        "recordsTotal" => $this->event_model->count_all(),
                        "recordsFiltered" => $this->event_model->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }


    // Status Change
 
    public function statusChange($id = NULL)
    {
        
        if($_POST['id'] == null)
        {
            redirect('admin/event');
        }

        $insertData['id'] = $_POST['id'];
        $insertData['status'] = $_POST['status'];
        $result = $this->event_model->save($insertData);
        exit;
    } 

    // Edit
 
    public function edit($id = NULL)
    {
        
        $data = array();
        

            if($id == null)
            {
                redirect('admin/event');
            }

      
        $data['edit_data'] = $this->event_model->find($id);
        $this->global['pageTitle'] = 'Dubai Capital Stone : Add New Admin';
        $this->loadViews("admin/event/edit", $this->global, $data , NULL);
        
    } 

    // Delete  *****************************************************************
      function delete()
    {
        
        
        $delId = $this->input->post('id');  
        
        $result = $this->event_model->delete($delId); 
            
        if ($result > 0) { echo(json_encode(array('status'=>TRUE))); }
        else { echo(json_encode(array('status'=>FALSE))); }
    }

    // Update Agency*************************************************************
    public function update()
    {
		
        
         $this->load->library('form_validation');
        $this->form_validation->set_rules('event_heading','Event Heading','trim|required');
        $this->form_validation->set_rules('event_location','Event Location','trim|required');
        $this->form_validation->set_rules('event_start_date','Event Start Date','trim|required');
        $this->form_validation->set_rules('event_end_date','Event End Date','trim|required');
        $this->form_validation->set_rules('event_start_time','Event Start Time','trim|required');
        $this->form_validation->set_rules('event_end_time','Event End Time','trim|required');
        $this->form_validation->set_rules('event_description','Event Description','trim|required');
        $this->form_validation->set_rules('status','status','trim|required');
        
        
        //form data 
        $form_data  = $this->input->post();
        if($this->form_validation->run() == FALSE)
        {
			
                $this->edit($form_data['id']);
        }
        else
        {           

            /*echo date("H:i:s",strtotime($form_data['event_start_time']));
             die();*/

                $slug_url = strtolower( $form_data['event_heading']);
                $slug_url = str_replace(',', '', $slug_url);
                $slug_url = str_replace(' ', '-',  $slug_url);
                $date = date('Y-m-d H:i:s');

                $strt_date = date('Y-m-d H:i:s');
                $end_date = date('Y-m-d H:i:s');

                $strt_time = date('H:i:s');
                $end_time = date('H:i:s');

                if(isset($_FILES['event_image']['name']) && $_FILES['event_image']['name'] != '') {



                $f_name         =$_FILES['event_image']['name'];
                $f_tmp          =$_FILES['event_image']['tmp_name'];
                $f_size         =$_FILES['event_image']['size'];
                $f_extension    =explode('.',$f_name);
                $f_extension    =strtolower(end($f_extension));
                $f_newfile      =uniqid().'.'.$f_extension;
                $store          ="uploads/event_img/".$f_newfile;
            
                if(!move_uploaded_file($f_tmp,$store))
                {
                    $this->session->set_flashdata('error', 'Image Upload Failed .');
                }
                else
                {
                   $insertData['event_image'] = $f_newfile;
                   
                }
             }

                $insertData['id']   = $form_data['id'];
                $insertData['event_heading']   = $form_data['event_heading'];
                $insertData['event_location']        = $form_data['event_location'];
                 $insertData['event_start_date']        = $strt_date;
                $insertData['event_end_date']        =   $end_date;
                $insertData['event_start_time']        = date("H:i:s",strtotime($form_data['event_start_time']));
                $insertData['event_end_time']        = date("H:i:s",strtotime($form_data['event_end_time']));
                $insertData['event_description']        = $form_data['event_description'];
                $insertData['slug_url']             = $slug_url;
                $insertData['status']       = "1";
                $insertData['date_at']      = $date;



                $result = $this->event_model->save($insertData);
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'Data successfully Updated');
                }
                else
                { 
                    $this->session->set_flashdata('error', 'Not Update');
                }
            }  
            redirect(base_url().'admin/event/edit/'.$form_data['id']);
          }  
        
    



}




?>




