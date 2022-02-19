<?php $this->load->view('header'); ?>
<!--  BO :heading -->
<div class="row wrapper border-bottom white-bg page-heading">
   <div class="col-sm-4">
      <h2>User_comprobante_table</h2>
      <ol class="breadcrumb">
         <li>
            <a href="<?php echo base_url().'admin/'?>">Dashboard</a>
         </li>
         <li class="active">
            <strong>User_comprobante_table</strong>
         </li>
      </ol>
   </div>
   <div class="col-sm-8">
      <div class="title-action">
      </div>
   </div>
</div>
<!--  EO :heading -->
<div class="row">
   <div class="col-lg-12 row wrapper ">
      <div class="ibox ">
         <div class="ibox-title" >
            <h5>View <small></small></h5>
            <div class="ibox-tools">                           
            </div>
         </div>
         <!-- ............................................................. -->
         <!-- BO : content  -->
         <div class="col-sm-12 white-bg ">
            <div class="box box-info">
               <div class="box-header with-border">
                  <h3 class="box-title">  </h3>
               </div>
               <!-- /.box-header -->
               <!-- form start -->
               <form action="" id="" class="form-horizontal " method="post" enctype="multipart/form-data">
                  <div class="box-body">
                     <?php if($this->session->flashdata('message')): ?>
                     <div class="alert alert-success">
                        <button type="button" class="close" data-close="alert"></button>
                        <?php echo $this->session->flashdata('message'); ?>
                     </div>
                     <?php endif; ?> 
                     

<table class='table table-bordered' style='width:70%;' align='center'>



    <!-- User_id Start -->

	<tr>

	 <td>

	  <label class="control-label col-md-3"> User_id </label>

	 </td>

	 <td> 

	   <?php 

	      if(isset($user_table) && !empty($user_table)):



	      foreach($user_table as $key => $value): 

	       if($value->user_id==$user_comprobante_table->user_id)

	             echo $value->username;



	       endforeach; 

	       endif; ?>

	 </td>

	</tr>

    <!-- User_id End -->



	



    <!-- Com_fecha_subida Start -->

	<tr>

	 <td>

	  <label for="com_fecha_subida" class="col-sm-3 control-label"> Com_fecha_subida </label>

	 </td>

	 <td> 

	   <?php echo set_value("com_fecha_subida", html_entity_decode($user_comprobante_table->com_fecha_subida)); ?>

	 </td>

	</tr>

    <!-- Com_fecha_subida End -->



	



    <!-- Com_fecha_compra Start -->

	<tr>

	 <td>

	  <label for="com_fecha_compra" class="col-sm-3 control-label"> Com_fecha_compra </label>

	 </td>

	 <td> 

	   <?php echo set_value("com_fecha_compra", html_entity_decode($user_comprobante_table->com_fecha_compra)); ?>

	 </td>

	</tr>

    <!-- Com_fecha_compra End -->



	

	<tr>

	 <td>

	   <label for="com_numero" class="col-sm-3 control-label"> Com_numero </label>

	 </td>

	 <td> 

	   <?php echo set_value("com_numero",html_entity_decode($user_comprobante_table->com_numero)); ?>

	 </td>

	</tr>

	

	<tr>

	 <td>

	   <label for="com_cuit" class="col-sm-3 control-label"> Com_cuit </label>

	 </td>

	 <td> 

	   <?php echo set_value("com_cuit",html_entity_decode($user_comprobante_table->com_cuit)); ?>

	 </td>

	</tr>

	



    <!-- Municipio_id Start -->

	<tr>

	 <td>

	  <label class="control-label col-md-3"> Municipio_id </label>

	 </td>

	 <td> 

	   <?php 

	      if(isset($municipio_table) && !empty($municipio_table)):



	      foreach($municipio_table as $key => $value): 

	       if($value->municipio_id==$user_comprobante_table->municipio_id)

	             echo $value->municipio_nombre;



	       endforeach; 

	       endif; ?>

	 </td>

	</tr>

    <!-- Municipio_id End -->



	



    <!-- Image_link Start -->

	<tr>

	 <td>

	  <label for="address" class="col-sm-3 control-label"> Image_link </label>

	 </td>

	 <td>

	 <?php if (isset($user_comprobante_table->image_link) && $user_comprobante_table->image_link!=""){?>

	            <br>

	    <img src="<?php echo $this->config->item("photo_url");?><?php echo $user_comprobante_table->image_link; ?>" alt="pic" width="50" height="50" />

	    <?php } ?>

	 </td>

	</tr>

    <!-- Image_link End -->



	



    <!-- Com_estado_id Start -->

	<tr>

	 <td>

	  <label class="control-label col-md-3"> Com_estado_id </label>

	 </td>

	 <td> 

	   <?php 

	      if(isset($user_comprobante_estado_table) && !empty($user_comprobante_estado_table)):



	      foreach($user_comprobante_estado_table as $key => $value): 

	       if($value->user_com_es_id==$user_comprobante_table->com_estado_id)

	             echo $value->user_com_estado;



	       endforeach; 

	       endif; ?>

	 </td>

	</tr>

    <!-- Com_estado_id End -->



	



    <!-- Com_estado_date Start -->

	<tr>

	 <td>

	  <label for="com_estado_date" class="col-sm-3 control-label"> Com_estado_date </label>

	 </td>

	 <td> 

	   <?php echo set_value("com_estado_date", html_entity_decode($user_comprobante_table->com_estado_date)); ?>

	 </td>

	</tr>

    <!-- Com_estado_date End -->



	



    <!-- Com_estado_obs Start -->

	<tr>

	 <td>

	  <label for="com_estado_obs" class="col-sm-3 control-label"> Com_estado_obs </label>

	 </td>

	 <td> 

	   <?php echo set_value("com_estado_obs",  html_entity_decode($user_comprobante_table->com_estado_obs)); ?>

	 </td>

	</tr>

    <!-- Com_estado_obs End -->



	

	<tr>

	 <td>

	   <label for="com_estado_opeid" class="col-sm-3 control-label"> Com_estado_opeid </label>

	 </td>

	 <td> 

	   <?php echo set_value("com_estado_opeid",html_entity_decode($user_comprobante_table->com_estado_opeid)); ?>

	 </td>

	</tr>

	

	<tr>

	 <td>

	   <label for="product_cart_id" class="col-sm-3 control-label"> Product_cart_id </label>

	 </td>

	 <td> 

	   <?php echo set_value("product_cart_id",html_entity_decode($user_comprobante_table->product_cart_id)); ?>

	 </td>

	</tr>

	

	<tr>

	 <td>

	   <label for="cart_id" class="col-sm-3 control-label"> Cart_id </label>

	 </td>

	 <td> 

	   <?php echo set_value("cart_id",html_entity_decode($user_comprobante_table->cart_id)); ?>

	 </td>

	</tr>

	<tr><td colspan="2"><a type="reset" class="btn btn-info pull-right" onclick="history.back()">Back</a></td></tr></table>
                     <div class="form-group">
                        <div class="col-sm-3" >                       
                        </div>
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-3" >                       
                        </div>
                     </div>
                  </div>
                  <!-- /.box-body -->
                  <div class="box-footer">
                  </div>
                  <!-- /.box-footer -->
               </form>
            </div>
            <!-- /.box -->
            <br><br><br><br>
         </div>
         <!-- EO : content  -->
         <!-- ...................................................................... -->
      </div>
   </div>
</div>
<?php $this->load->view('footer'); ?>