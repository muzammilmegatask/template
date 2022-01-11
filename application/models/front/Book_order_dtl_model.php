<?php if(!defined('BASEPATH')) exit('No direct script access allowed');







class Book_order_dtl_model extends Base_model

{

    public $table = "mt_room_book_detail";
    public $order_id ;

    var $column_order = array(null, 'org_room.name','br.name','br.location','rt.name','usr.fname','obd.room_number','obd.room_number','obd.bed_number','obd.check_in','obd.check_out','obd.date_at','obd.amount','obd.status'); //set column field database for datatable orderable

    var $column_search = array( 'org_room.name','br.name','br.location','rt.name','usr.fname','obd.room_number','obd.room_number','obd.bed_number','obd.check_in','obd.check_out','obd.date_at','obd.amount','obd.status'); //set column field database for datatable searchable 

    var $order = array('obd.id' => 'DESC'); // default order



        



        function __construct() {



            parent::__construct();



        }







     function delete($id) {



        $this->db->where('id', $id);



        $this->db->delete($this->table);        



        return $this->db->affected_rows();



    }







    public function find($id) {



            $query = $this->db->select('*')



                    ->from($this->table)



                    ->where('id', $id)



                    ->get();



            if ($query->num_rows() > 0) {



                $result = $query->result();



                return $result[0];



            } else {



                return array();



            }



        }



        // Get Video List

        function get_datatables($order_id)

        {   
            $this->order_id = $order_id; 




            $this->db->select('obd.*,br.name as room_name,br.location as room_location,rt.name as room_type,usr.fname as user_name,org_room.name as org_name');

            $this->_get_datatables_query();

            if(isset($_POST['length']) && $_POST['length'] != -1)

            $this->db->limit($_POST['length'], $_POST['start']);
 
            $query = $this->db->get();

            return $query->result();

        }

        // Get Database 

         public function _get_datatables_query()

        {   



             
     /*       $this->db->from($this->table. ' as obd');  
            $this->db->join('mt_booking_room as br', 'br.id = obd.room_id','left');
            $this->db->join('mt_room_type as rt', 'rt.id = obd.room_type','left');
            $this->db->join('users as usr', 'usr.id = obd.user_id','left');
            $this->db->join('mt_organization_room as org_room', 'org_room.id = obd.organization_id','left');*/
             

            $i = 0;     

            foreach ($this->column_search as $item) // loop column 

            {

                if(isset($_POST['search']['value']) && $_POST['search']['value']) // if datatable send POST for search

                {

                    if($i===0) // first loop

                    {

                        $this->db->like($item, $_POST['search']['value']);

                    }

                    else

                    {

                        $this->db->or_like($item, $_POST['search']['value']);

                    }

                }

                $i++;

            }

             
            if(isset($_POST['order'])) // here order processing

            {

                $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);

            } 

            else if(isset($this->order))

            {

                $order = $this->order;

                $this->db->order_by(key($order), $order[key($order)]);

            }

            if($this->order_id)
             {
                $this->db->where('obd.book_order_id',$this->order_id);   
             }
             

        }



        // Count  Filtered

        function count_filtered()

        {

            $this->_get_datatables_query();

            $query = $this->db->get();

            return $query->num_rows();

        }

        // Count all

        public function count_all()

        {

            $this->db->from($this->table);
            $this->db->where(array('book_order_id'=>$this->order_id));
            return $this->db->count_all_results();

        }

    public function check_in_checkout($data = array())
    { 
        $check_in = $data['check_in'];
            $check_out = $data['check_out'];
            $type = $data['type'];

            //$sql="select * from mt_room_book_detail where  (check_in BETWEEN '".$check_in."' AND '".$check_out."') OR ( check_out BETWEEN '".$check_in."' AND '".$check_out."' ) ";    
            $sql="select * from mt_room_book_detail where  (`check_in` >= '".$check_in."' AND `check_out` <= '".$check_out."') ";    
            $query = $this->db->query($sql);


    return $query->result();

                

    }


}











  