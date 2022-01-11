<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Users extends BaseController
{
   
    public function __construct()
    {
        parent::__construct();
           
        $this->load->model('admin/user_model');
        $this->isLoggedIn(); 
        

     }

    
    public function index()
    {
        
        $data = array();
        
        $this->global['pageTitle']  = 'Dubai Capital Stone : Users List';


        $this->loadViews("admin/users/list", $this->global, $data , NULL);
        
    }

    // Add New 
    public function addnew()
    {
        
        // category
        
        $data = array();

         $where = array();
        $where['status'] = 1;
        $where['field'] = 'id,name';
        $where['table'] = 'z_admin';
        $organization_name = $this->user_model->findDynamic($where);
        $data['organization_list'] = $organization_name;

        $this->global['pageTitle'] = 'Dubai Capital Stone : Add New Admin';
        $this->loadViews("admin/users/addnew", $this->global, $data , NULL);
        
    } 

    public function insertnow()
    {
        
        
        
        
        $this->load->library('form_validation');            
        $this->form_validation->set_rules('name','Admin Name','trim|required');
        $this->form_validation->set_rules('admin_type','Admin Type','trim|required');
        $this->form_validation->set_rules('email','Admin Email','trim|required');
        $this->form_validation->set_rules('phone','Admin Phone','trim|required');
        $this->form_validation->set_rules('address','Admin Address','trim|required');
        $this->form_validation->set_rules('password','Admin Password','trim|required');
        $this->form_validation->set_rules('status','status','trim|required');
        
         
        $form_data  = $this->input->post();
        if($this->form_validation->run() == FALSE)
        {
            $this->addnew();
        }
        else
        {

            // check already exist
            $where = array();
            $where['email'] = $form_data['email'];
            $where['email'] = $form_data['email'];
            $returnData = $this->user_model->findDynamic($where);
            if(!empty($returnData)){
               $this->session->set_flashdata('error', $form_data['email'].' already exist. Use different email to register.');
            }else{
                $date = date('Y-m-d H:i:s');
                $insertData['name']         = $form_data['name'];
                $insertData['admin_type']   = $form_data['admin_type'];
                $insertData['email']        = $form_data['email'];
                $insertData['phone']        = $form_data['phone'];
                $insertData['address']        = $form_data['address'];
                $insertData['password']       = $form_data['password'];
                $insertData['status']       = "1";
                $insertData['date_at']      = $date;
                
                 
                $result = $this->user_model->save($insertData);
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'Admin successfully Added');
                }
                else
                { 
                    $this->session->set_flashdata('error', 'Admin Addition failed');
                }
            }// check already    
            redirect('admin/users');
          }  
        
    }
    
    

    // Member list
    public function ajax_list()
    {
		$list = $this->user_model->get_datatables();
	 
		$data = array();
        $no =(isset($_POST['start']))?$_POST['start']:'';
        foreach ($list as $currentObj) {

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
            
            $row[] = $currentObj->name;
            $row[] = $currentObj->email;
            $row[] = $currentObj->phone;
            $row[] = $currentObj->address;
            $row[] = $currentObj->password;
            $row[] = $dateAt;
            $row[] = $btn;
            $row[] = '<a hidden class="btn btn-sm btn-info" href="'.base_url().'admin/users/edit/'.$currentObj->id.'" title="Edit" ><i class="fa fa-pencil"></i></a>&nbsp;<a class="btn btn-sm btn-danger deletebtn" href="#" data-userid="'.$currentObj->id.'"><i class="fa fa-trash"></i></a>';
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => (isset($_POST['draw']))?$_POST['draw']:'',
                        "recordsTotal" => $this->user_model->count_all(),
                        "recordsFiltered" => $this->user_model->count_filtered(),
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
            redirect('admin/users');
        }

        $insertData['id'] = $_POST['id'];
        $insertData['status'] = $_POST['status'];
        $result = $this->user_model->save($insertData);
        exit;
    } 

    // Edit
 
    public function edit($id = NULL)
    {
        
        $data = array();
        

            if($id == null)
            {
                redirect('admin/booking');
            }


        $where = array();
        $where['status'] = 1;
        $where['field'] = 'id,name';
        $where['table'] = 'z_admin';
        $organization_name = $this->booking_type_model->findDynamic($where);
        $data['organization_list'] = $organization_name;

        $where = array();
        $where['status'] = 1;
        $where['field'] = 'id,name';
        $booking_type = $this->booking_type_model->findDynamic($where);

        $data['booking_type'] = $booking_type; 

        $where = array();
         $where['room_id'] = $id;
         $where['orderby'] ='id';

        $booking_room_serial = $this->booking_room_serial_model->findDynamic($where);

        $data['booking_room_serial'] = $booking_room_serial;
        $data['edit_data'] = $this->user_model->find($id);
        $this->global['pageTitle'] = ' ';
        $this->loadViews("admin/booking/edit", $this->global, $data , NULL);
        
    } 

    // Delete  *****************************************************************
      function delete()
    {
        
        
        $delId = $this->input->post('id');  
        
        $result = $this->user_model->delete($delId); 
            
        if ($result > 0) { echo(json_encode(array('status'=>TRUE))); }
        else { echo(json_encode(array('status'=>FALSE))); }
    }

    // Update Agency*************************************************************
    public function update()
    {
		
        
        $this->load->library('form_validation');            
                    
        $this->form_validation->set_rules('name','name','trim|required');
        $this->form_validation->set_rules('organization_id','organization_id','trim|required');
        $this->form_validation->set_rules('location','location','trim|required');
        $this->form_validation->set_rules('status','status','trim|required');
        
        
        //form data 
        $form_data  = $this->input->post();
        if($this->form_validation->run() == FALSE)
        {
			
                $this->edit($form_data['id']);
        }
        else
        {


            
            $where = array();
            $where['name']      = $form_data['name'];
            $where['organization_id']      = $form_data['organization_id'];
            $where['id !=']      = $form_data['id'];
             

           $returnData = $this->user_model->findBy($where);

          /* print_r($returnData);die;*/
            if(!empty($returnData)){
               $this->session->set_flashdata('error', $form_data['name'].' already Exist.');
            }else{

                  $slug_url = strtolower( $form_data['name']);
                  $slug_url = str_replace(',', '', $slug_url);
                 $slug_url = str_replace(' ', '-',  $slug_url);

                $insertData = array();
                $insertData['id']               = $form_data['id'];
                $insertData['name']             = $form_data['name'];
                 $insertData['slug_url']             = $slug_url;
                $insertData['organization_id']  = $form_data['organization_id'];
                $insertData['location']         = $form_data['location'];
                 $insertData['total_count_room'] = $form_data['total_count_room'];
                $insertData['status']           = $form_data['status'];

                $result = $this->user_model->save($insertData);
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'Data successfully Updated');
                }
                else
                { 
                    $this->session->set_flashdata('error', 'Not Update');
                }
            }// check already    
            redirect(base_url().'admin/booking/edit/'.$form_data['id']);
          }  
        
    }

     


}




?>