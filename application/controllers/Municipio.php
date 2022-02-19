<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/** @package  */
class Municipio extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('municipio_model');
	}

    /*
    **
    **	This is a JSON Function just to check my Municipio model function
    **
    */

	public function getAllMunicipios() {
		$this->gate_model->ajax_gate();
		header('Content-Type: application/json');
		echo json_encode($this->municipio_model->getAllMunicipios());
	}

	public function update($municipio_id) {
		if ($this->input->post('municipio_name') != $this->input->post('original_municipio_name')) {
			$is_unique = '|is_unique[municipio_table.municipio_name]';
		} else {
			$is_unique = '';
		}
		$this->form_validation->set_rules(
			'municipio_name', 'Municipio Name',
			'required|min_length[5]|max_length[20]'.$is_unique,
			array(
				'required' => 'You have not provided %s.',
				'is_unique' => 'This %s already exists.',
				'min_length' => 'The {field} must be at least {param} characters long',
                'max_length' => 'The {field} must be at most {param} characters long'
            )
        );
		if ($this->form_validation->run() == FALSE) {
			$error = form_error('municipio_name');
            $message = "<div class='alert alert-danger alert-dismissable'>";
            $message .= "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
            $message .= "<strong>Fail!</strong> $error";
            $message .= "</div>";
            $this->session->set_flashdata('msg', $message); 
			redirect('admin/manage_municipio/'.$municipio_id);
        } else {
			$municipio_name = $data["municipio_name"] = $this->input->post('municipio_name');
			$data["estado_id"] = $this->input->post('estado_id');
			$data["municipio_id"] = $municipio_id;
			$this->municipio_model->update($data);
			$message = "<div class='alert alert-success alert-dismissable'>";
			$message .= "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
			$message .= "<strong>Success!</strong> $Municipio_name is updated!";
            $message .= "</div>";
			}
            $this->session->set_flashdata('msg', $message); 
			redirect('admin/manage_municipio/'.$municipio_id);
            
       	}
}

	/** @return void  */
	//public function create() {
    public function add() {
			$this->form_validation->set_rules(
				'municipio_name', 'Municipio Name',
				'required|min_length[5]|max_length[20]|is_unique[municipio_table.municipio_name]',
				array(
					'required' => 'You have not provided %s.',
					'is_unique' => 'This %s already exists.',
					'min_length' => 'The {field} must be at least {param} characters long',
					'max_length' => 'The {field} must be at most {param} characters long'				
				)
			);
			if ($this->form_validation->run() == FALSE) {
				$error = form_error('municipio_name');
				$message = "<div class='alert alert-danger alert-dismissable'>";
				$message .= "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
				$message .= "<strong>Fail!</strong> $error";
				$message .= "</div>";
				$this->session->set_flashdata('msg', $message); 
				redirect('admin/add_municipio');
			} else {
				$message = "<div class='alert alert-danger alert-dismissable'>";
				$message .= "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
				$message .= "<strong>Fail!</strong> Fail to add $municipio_name";
				$message .= "</div>";
				}
				$this->session->set_flashdata('msg', $message); 
				redirect('admin/view_municipio');
				
			}
  	
		}
	
	}
	
}	