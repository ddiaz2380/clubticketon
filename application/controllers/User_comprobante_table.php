<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class User_comprobante_table extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('pagination');
		$this->load->helper('url');
		$this->load->library('ion_auth');
		$this->load->library('form_validation');
		$this->load->model('admin/user_comprobante_table_model','user_comprobante_table');
	}

	function index($id=1)
	{
		$cond="";
		$data['searchBy']='';
		$data['searchValue']='';
		$v_fields=$this->user_comprobante_table->v_fields;
		$per_page_arr = array('5', '10', '20', '50', '100');

		if (isset($_GET['searchValue']) && isset($_GET['searchBy'])) {
			$data['searchBy']=$_GET['searchBy'];
			$data['searchValue']=$_GET['searchValue'];
			if (!empty($_GET['searchValue']) && $_GET['searchValue']!="" && !empty($_GET['searchBy']) && $_GET['searchBy']!="" ) {
					$cond="true";
			}
		}

		$data['sortBy']='';
        $order_by = isset($_GET['sortBy']) && in_array($_GET['sortBy'], $v_fields)?$_GET['sortBy']:'';
        $order = isset($_GET['order']) && $_GET['order']=='asc'?'asc':'desc';
        $searchBy = isset($_GET['searchBy']) && in_array($_GET['searchBy'], $v_fields)?$_GET['searchBy']:null;
        $searchValue = isset($_GET['searchValue'])?$_GET['searchValue']:'';
        $searchValue = addslashes($searchValue);

		if(isset($_GET['sortBy']) && $_GET['sortBy']!=''){
			$data['sortBy']=$_GET['sortBy'];
			if(isset($_GET['order']) && $_GET['order']!=''){
				$_GET['order']=$_GET['order']=='asc'?'desc':'asc';
			} else{
				$_GET['order']='desc';
			}
		}

		$get_q = $_GET;
		foreach ($v_fields as $key => $value) {
			$get_q['sortBy'] = $value;
			$query_result = http_build_query($get_q);
			$data['fields_links'][$value] =current_url().'?'.$query_result;
		}
		$data['csvlink'] = base_url().'admin/user_comprobante_table/export/csv';
		$data['pdflink'] = base_url().'admin/user_comprobante_table/export/pdf';
		$data['per_page'] = isset($_GET['per_page']) && in_array($_GET['per_page'], $per_page_arr)?$_GET['per_page']:"5";

		// PAGINATION
		$config = array();
		$config['suffix']='?'.$_SERVER['QUERY_STRING'];
        $config["base_url"] = base_url() . "admin/user_comprobante_table/index";
        $total_row = $this->user_comprobante_table->getCount('user_comprobante_table', $searchBy, $searchValue);
        $config["first_url"] = base_url()."admin/user_comprobante_table/index".'?'.$_SERVER['QUERY_STRING'];
        $config["total_rows"] = $total_row;
        $config["per_page"] = $per_page = $data['per_page'];
        $config["uri_segment"] = $this->uri->total_segments();
        $config['use_page_numbers'] = TRUE;
        $config['num_links'] = 3; //$total_row
        $config['cur_tag_open'] = '&nbsp;<a class="current">';
        $config['cur_tag_close'] = '</a>';
        $config['full_tag_open'] = "<ul class='pagination'>";
		$config['full_tag_close'] ="</ul>";
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
		$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
		$config['next_tag_open'] = "<li>";
		$config['next_tagl_close'] = "</li>";
		$config['prev_tag_open'] = "<li>";
		$config['prev_tagl_close'] = "</li>";
		$config['first_link'] = 'First';
		$config['first_tag_open'] = "<li>";
		$config['first_tagl_close'] = "</li>";
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = "<li>";
		$config['last_tagl_close'] = "</li>";
        $this->pagination->initialize($config);

        if($this->uri->segment(2)){
        	$cur_page = $id;
        	$pagi = array("cur_page"=>($cur_page-1)*$per_page, "per_page"=>$per_page, 'order'=>$order, 'order_by'=>$order_by);
        }
        else{	
    		$pagi = array("cur_page"=>0, "per_page"=>$per_page);
    	}

        $data["results"] = $result = $this->user_comprobante_table->getList("user_comprobante_table",$pagi);
        $str_links = $this->pagination->create_links();

        $data["links"] = $str_links;
        // ./ PAGINATION /.

		if (!$this->ion_auth->logged_in()) {
			redirect('/auth/login/');
        }
		else {
			$data['user_comprobante_table']  = $this->user_comprobante_table->getList('user_comprobante_table');
		    $this->load->view('admin/user_comprobante_table/manage',$data);
		}
	}

	public function add()
	{   
		if (!$this->ion_auth->logged_in()) {
			redirect('/auth/login/');
		}

	    $data = NULL;

		$this->form_validation->set_rules('user_id', 'User_id Name', 'trim');
		$this->form_validation->set_rules('com_fecha_subida', 'Com_fecha_subida Name', 'trim');
		$this->form_validation->set_rules('com_fecha_compra', 'Com_fecha_compra Name', 'trim');
		$this->form_validation->set_rules('com_numero', 'Com_numero Name', 'trim');
		$this->form_validation->set_rules('com_cuit', 'Com_cuit Name', 'trim');
		$this->form_validation->set_rules('municipio_id', 'Municipio_id Name', 'trim');
$this->form_validation->set_rules("image_link", "Image_link", "trim|xss_clean");

         $this->user_comprobante_table->uploadData($photo_data, "image_link", "photo_path","","gif|jpg|png|jpeg");

	    if(isset($photo_data["photo_err"]) and !empty($photo_data["photo_err"]))

	    {

	     $data["errors"]=$photo_data["photo_err"];

	     $this->form_validation->set_rules("image_link","Image_link","trim");

	    }		$this->form_validation->set_rules('com_estado_id', 'Com_estado_id Name', 'trim');
		$this->form_validation->set_rules('com_estado_date', 'Com_estado_date Name', 'trim');
		$this->form_validation->set_rules('com_estado_obs', 'Com_estado_obs Name', 'trim');
		$this->form_validation->set_rules('com_estado_opeid', 'Com_estado_opeid Name', 'trim');
		$this->form_validation->set_rules('product_cart_id', 'Product_cart_id Name', 'trim');
		$this->form_validation->set_rules('cart_id', 'Cart_id Name', 'trim');
			

        $data['errors'] = array();
        if($this->form_validation->run() == FALSE) 
        {
			$data["user_table"]=$this->user_comprobante_table->getListTable("user_table");$data["municipio_table"]=$this->user_comprobante_table->getListTable("municipio_table");$data["user_comprobante_estado_table"]=$this->user_comprobante_table->getListTable("user_comprobante_estado_table");
		
			$this->load->view('admin/user_comprobante_table/add', $data);
        }
        else
        {
			$saveData['user_id'] = set_value('user_id');
			$saveData['com_fecha_subida'] = set_value('com_fecha_subida');
			$saveData['com_fecha_compra'] = set_value('com_fecha_compra');
			$saveData['com_numero'] = set_value('com_numero');
			$saveData['com_cuit'] = set_value('com_cuit');
			$saveData['municipio_id'] = set_value('municipio_id');
if(isset($photo_data["image_link"]) && !empty($photo_data["image_link"]))

		{

	      $saveData["image_link"] = $photo_data["image_link"];

        }			$saveData['com_estado_id'] = set_value('com_estado_id');
			$saveData['com_estado_date'] = set_value('com_estado_date');
			$saveData['com_estado_obs'] = set_value('com_estado_obs');
			$saveData['com_estado_opeid'] = set_value('com_estado_opeid');
			$saveData['product_cart_id'] = set_value('product_cart_id');
			$saveData['cart_id'] = set_value('cart_id');

			$insert_id = $this->user_comprobante_table->insert('user_comprobante_table',$saveData);
			
			$this->session->set_flashdata('message', 'User_comprobante_table Added Successfully!');
			redirect('admin/user_comprobante_table');
	   }
	}

	function view($id)
	{

	  if (!$this->ion_auth->logged_in()) {
	  redirect('/auth/login/');
	  }

	  if(isset($id) and !empty($id))
	  {
	   $data = NULL;

		$this->form_validation->set_rules('user_id', 'User_id Name', 'trim');
		$this->form_validation->set_rules('com_fecha_subida', 'Com_fecha_subida Name', 'trim');
		$this->form_validation->set_rules('com_fecha_compra', 'Com_fecha_compra Name', 'trim');
		$this->form_validation->set_rules('com_numero', 'Com_numero Name', 'trim');
		$this->form_validation->set_rules('com_cuit', 'Com_cuit Name', 'trim');
		$this->form_validation->set_rules('municipio_id', 'Municipio_id Name', 'trim');
$this->form_validation->set_rules("image_link", "Image_link", "trim|xss_clean");

         $this->user_comprobante_table->uploadData($photo_data, "image_link", "photo_path","","gif|jpg|png|jpeg");

	    if(isset($photo_data["photo_err"]) and !empty($photo_data["photo_err"]))

	    {

	     $data["errors"]=$photo_data["photo_err"];

	     $this->form_validation->set_rules("image_link","Image_link","trim");

	    }		$this->form_validation->set_rules('com_estado_id', 'Com_estado_id Name', 'trim');
		$this->form_validation->set_rules('com_estado_date', 'Com_estado_date Name', 'trim');
		$this->form_validation->set_rules('com_estado_obs', 'Com_estado_obs Name', 'trim');
		$this->form_validation->set_rules('com_estado_opeid', 'Com_estado_opeid Name', 'trim');
		$this->form_validation->set_rules('product_cart_id', 'Product_cart_id Name', 'trim');
		$this->form_validation->set_rules('cart_id', 'Cart_id Name', 'trim');


       $data['errors'] = array();
       if($this->form_validation->run() == FALSE) 
       {
      	$data["user_table"]=$this->user_comprobante_table->getListTable("user_table");$data["municipio_table"]=$this->user_comprobante_table->getListTable("municipio_table");$data["user_comprobante_estado_table"]=$this->user_comprobante_table->getListTable("user_comprobante_estado_table");
      	
      	
        $data['user_comprobante_table']=$this->user_comprobante_table->getRow('user_comprobante_table',$id);
        $this->load->view('admin/user_comprobante_table/view', $data);
       }
       else
       {
		redirect('admin/user_comprobante_table/view');
       }
    }
    else
    {
       $this->session->set_flashdata('message', ' Invalid Id !'); 
       redirect('admin/user_comprobante_table/view');
	}
  }

	function edit($id)
    {
	 	if (!$this->ion_auth->logged_in()) {
			redirect('/auth/login/');
		}

		if(isset($id) and !empty($id))
		{
			$data = NULL;

			    		$this->form_validation->set_rules('user_id', 'User_id Name', 'trim');
		$this->form_validation->set_rules('com_fecha_subida', 'Com_fecha_subida Name', 'trim');
		$this->form_validation->set_rules('com_fecha_compra', 'Com_fecha_compra Name', 'trim');
		$this->form_validation->set_rules('com_numero', 'Com_numero Name', 'trim');
		$this->form_validation->set_rules('com_cuit', 'Com_cuit Name', 'trim');
		$this->form_validation->set_rules('municipio_id', 'Municipio_id Name', 'trim');
$this->form_validation->set_rules("image_link", "Image_link", "trim|xss_clean");

         $this->user_comprobante_table->uploadData($photo_data, "image_link", "photo_path","","gif|jpg|png|jpeg");

	    if(isset($photo_data["photo_err"]) and !empty($photo_data["photo_err"]))

	    {

	     $data["errors"]=$photo_data["photo_err"];

	     $this->form_validation->set_rules("image_link","Image_link","trim");

	    }		$this->form_validation->set_rules('com_estado_id', 'Com_estado_id Name', 'trim');
		$this->form_validation->set_rules('com_estado_date', 'Com_estado_date Name', 'trim');
		$this->form_validation->set_rules('com_estado_obs', 'Com_estado_obs Name', 'trim');
		$this->form_validation->set_rules('com_estado_opeid', 'Com_estado_opeid Name', 'trim');
		$this->form_validation->set_rules('product_cart_id', 'Product_cart_id Name', 'trim');
		$this->form_validation->set_rules('cart_id', 'Cart_id Name', 'trim');


            $data['errors'] = array();
            if($this->form_validation->run() == FALSE) 
            {
            	
            	
              	$data['user_comprobante_table']=$this->user_comprobante_table->getRow('user_comprobante_table',$id);
              	$data["user_table"]=$this->user_comprobante_table->getListTable("user_table");$data["municipio_table"]=$this->user_comprobante_table->getListTable("municipio_table");$data["user_comprobante_estado_table"]=$this->user_comprobante_table->getListTable("user_comprobante_estado_table");
				$this->load->view('admin/user_comprobante_table/edit', $data);
            }
            else
            {
			   				$saveData['user_id'] = set_value('user_id');
			$saveData['com_fecha_subida'] = set_value('com_fecha_subida');
			$saveData['com_fecha_compra'] = set_value('com_fecha_compra');
			$saveData['com_numero'] = set_value('com_numero');
			$saveData['com_cuit'] = set_value('com_cuit');
			$saveData['municipio_id'] = set_value('municipio_id');
if(isset($photo_data["image_link"]) && !empty($photo_data["image_link"]))

		{

	      $saveData["image_link"] = $photo_data["image_link"];

        }			$saveData['com_estado_id'] = set_value('com_estado_id');
			$saveData['com_estado_date'] = set_value('com_estado_date');
			$saveData['com_estado_obs'] = set_value('com_estado_obs');
			$saveData['com_estado_opeid'] = set_value('com_estado_opeid');
			$saveData['product_cart_id'] = set_value('product_cart_id');
			$saveData['cart_id'] = set_value('cart_id');
					
				$this->user_comprobante_table->updateData('user_comprobante_table',$saveData,$id);
				
				$this->session->set_flashdata('message', 'User_comprobante_table Updated Successfully!');
				redirect('admin/user_comprobante_table');
            }
		}
		else
		{
			$this->session->set_flashdata('message', ' Invalid Id !');	
		    redirect('admin/user_comprobante_table');
		}
	 }

	 function delete($id='')
     {
		if (!$this->ion_auth->logged_in()) {
			redirect('/auth/login/');
		}

 		if(isset($id) and !empty($id))
		{
			$count=$this->user_comprobante_table->getCount('user_comprobante_table','user_comprobante_table.user_comprobante_id',$id);
			if(isset($count) and !empty($count))
			{
				$this->user_comprobante_table->delete('user_comprobante_table','user_comprobante_id',$id);
				$this->session->set_flashdata('message', ' User_comprobante_table Deleted Successfully !');
	            echo "success";
           		exit;
			}
			else
			{
				$this->session->set_flashdata('message', ' Invalid Id !');	
			}
		}
		else
		{
			$this->session->set_flashdata('message', ' Invalid Id !');
		}
	}

	function deleteAll($id='')
    {

		if (!$this->ion_auth->logged_in()) {
			redirect('/auth/login/');
		}

		$all_ids = $_POST["allIds"];

 		if(isset($all_ids) and !empty($all_ids))
		{
			
			//$count=$this->user_comprobante_table->getCount('user_comprobante_table','user_comprobante_table.id',$id);
			for($a=0; $a<count($all_ids); $a++)
	  		{
	  			if($all_ids[$a]!="")
	  			{
					$this->user_comprobante_table->delete('user_comprobante_table','user_comprobante_id',$all_ids[$a]);
					$this->session->set_flashdata('message', ' User_comprobante_table(s) Deleted Successfully !');
				}
	  		}	

            echo "success";
       		exit;
		}
		else
		{
			$this->session->set_flashdata('message', ' Invalid Id !');
		}
	}

	function export($filetype='csv'){

		if (!$this->ion_auth->logged_in()) {
			redirect('/auth/login/');
		}
		
		$searchBy='';
		$searchValue='';
		$v_fields=array('user_id', 'com_fecha_subida', 'com_fecha_compra', 'com_numero', 'com_cuit', 'municipio_id', 'image_link', 'com_estado_id', 'com_estado_date', 'com_estado_obs', 'com_estado_opeid', 'product_cart_id', 'cart_id');

		$data['sortBy']='';

        $order_by = isset($_GET['sortBy']) && in_array($_GET['sortBy'], $v_fields)?$_GET['sortBy']:'';
        $order = isset($_GET['order']) && $_GET['order']=='asc'?'asc':'desc';

        $searchBy = isset($_GET['searchBy']) && in_array($_GET['searchBy'], $v_fields)?$_GET['searchBy']:null;
        $searchValue = isset($_GET['searchValue'])?$_GET['searchValue']:'';
        $searchValue = addslashes($searchValue);
        $pagi = array('order'=>$order, 'order_by'=>$order_by);

		$result = $this->user_comprobante_table->getList("user_comprobante_table");

		if($filetype=='csv'){
			header('Content-Type: application/csv');
			header('Content-Disposition: attachment; filename=user_comprobante_table.csv');
			header('Pragma: no-cache');
			$csv='Sr. No,'.implode(',', $v_fields)."\n";
			foreach ($result as $key => $value) {
				$line=($key+1).',';
				foreach ($v_fields as $field) {
					$line.='"'.addslashes($value->$field).'"'.',';
				}
				$csv.=ltrim($line,',')."\n";
			}
			echo $csv; exit;
		} elseif ($filetype=='pdf'){
			error_reporting(0);
			ob_start();
			$this->load->library('m_pdf');
			$table='
			<html>
			<head><title></title>
			<style>
			table{
				border:1px solid;
			}
			tr:nth-child(even)
			{
			    background-color: rgba(158, 158, 158, 0.82);
			}
			</style>
			</head>
			<body>
			<h1 align="center">User_comprobante_table</h1>
			<table><tr>';
			$table.='<th>Sr. No</th>';
			foreach ($v_fields as $value) {
				$table.='<th>'.$value.'</th>';
			}
			$table.='</tr>';
			foreach ($result as $key => $value) {
				$table.='<tr><td>'.($key+1).'</td>';
				foreach ($v_fields as $field) {
					$table.='<td>'.$value->$field.'</td>';
				}
				$table.='</tr>';
			}
			$table.='</table></body></html>';
			ob_clean();
			$pdf = $this->m_pdf->load();
			$pdf->WriteHTML($table);
			$pdf->Output('user_comprobante_table.pdf', "D");
			exit;
		} else{
			echo 'Invalid option'; exit;
		}
	}


	function status($field,$id)
	{
		if (!$this->ion_auth->logged_in()) {
			redirect('/auth/login/');
		}

		if (in_array($field, array()))
		{
			if(isset($id) && !empty($id))
			{
				if (!is_null($user_comprobante_table=$this->user_comprobante_table->getRow('user_comprobante_table',$id)))	
				{					
					$status = $user_comprobante_table->$field;				
					if($status == 1){
						$status = 0;
					}else{
						$status = 1;
					}
						$statusData[$field] = $status;
						$this->user_comprobante_table->updateData('user_comprobante_table',$statusData,$id);
						$this->session->set_flashdata('message', ucfirst($field).' Updated Successfully');
						if(isset($_GET['redirect']) && $_GET['redirect']!=''){
							redirect($_GET['redirect']);
						} else{
							redirect('admin/user_comprobante_table');
						}
				}else{
						$this->session->set_flashdata('error', 'Invalid Record Id!');
						redirect('admin/user_comprobante_table');
				}
			}
			else
			{
				$this->session->set_flashdata('error', 'Invalid Record Id!');
				redirect('admin/user_comprobante_table');
			}
		}
	}


}

