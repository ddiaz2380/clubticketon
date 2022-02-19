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
  <div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox ">
      <div class="ibox-title" >
        <h5>Add <small></small></h5>
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
          <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>">
            <div class="box-body">
              <?php if($this->session->flashdata('message')): ?>
              <div class="alert alert-success">
                <button type="button" class="close" data-close="alert"></button>
                <?php echo $this->session->flashdata('message'); ?>
              </div>
              <?php endif; ?> 
              



	<!-- User_id Start -->

	<div class="form-group">

        <label class="control-label col-md-3"> User_id </label>

          <div class="col-md-4">

              <select class="form-control select2" name="user_id" id="user_id">

              <option value="">Select User_id</option>

      <?php 

      if(isset($user_table) && !empty($user_table)):

      foreach($user_table as $key => $value): ?>

          <option value="<?php echo $value->user_id; ?>">

            <?php echo $value->username; ?>

          </option>

      <?php endforeach; ?>

      <?php endif; ?>

      </select>

        </div>

    </div>

      <!-- User_id End -->







	<!-- Com_fecha_subida Start -->

	<div class="form-group">

	  <label for="com_fecha_subida" class="col-sm-3 control-label"> Com_fecha_subida </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control datetimepicker" id="com_fecha_subida"  name="com_fecha_subida"/>

	  </div>

	  <div class="col-sm-5" >

	    <?php echo form_error("com_fecha_subida","<span class='label label-danger'>","</span>")?>

	  </div>

	</div>

	<!-- Com_fecha_subida End -->



	



	<!-- Com_fecha_compra Start -->

	<div class="form-group">

	  <label for="com_fecha_compra" class="col-sm-3 control-label"> Com_fecha_compra </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control datetimepicker" id="com_fecha_compra"  name="com_fecha_compra"/>

	  </div>

	  <div class="col-sm-5" >

	    <?php echo form_error("com_fecha_compra","<span class='label label-danger'>","</span>")?>

	  </div>

	</div>

	<!-- Com_fecha_compra End -->



	





	<!-- Com_numero Start -->

	<div class="form-group">

	  <label for="com_numero" class="col-sm-3 control-label"> Com_numero </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control" id="com_numero" name="com_numero" 

	    

	    value="<?php echo set_value("com_numero"); ?>"

	    >

	  </div>

	  <div class="col-sm-5" >

	 

	    <?php echo form_error("com_numero","<span class='label label-danger'>","</span>")?>

	  </div>

	</div> 

	<!-- Com_numero End -->





	





	<!-- Com_cuit Start -->

	<div class="form-group">

	  <label for="com_cuit" class="col-sm-3 control-label"> Com_cuit </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control" id="com_cuit" name="com_cuit" 

	    

	    value="<?php echo set_value("com_cuit"); ?>"

	    >

	  </div>

	  <div class="col-sm-5" >

	 

	    <?php echo form_error("com_cuit","<span class='label label-danger'>","</span>")?>

	  </div>

	</div> 

	<!-- Com_cuit End -->





	



	<!-- Municipio_id Start -->

	<div class="form-group">

        <label class="control-label col-md-3"> Municipio_id </label>

          <div class="col-md-4">

              <select class="form-control select2" name="municipio_id" id="municipio_id">

              <option value="">Select Municipio_id</option>

      <?php 

      if(isset($municipio_table) && !empty($municipio_table)):

      foreach($municipio_table as $key => $value): ?>

          <option value="<?php echo $value->municipio_id; ?>">

            <?php echo $value->municipio_nombre; ?>

          </option>

      <?php endforeach; ?>

      <?php endif; ?>

      </select>

        </div>

    </div>

      <!-- Municipio_id End -->







    <!-- Image_link Start -->

    <div class="form-group">

      <label for="address" class="col-sm-3 control-label"> Image_link </label>

      <div class="col-sm-6">

      <input type="file" name="image_link" />

      <input type="hidden" name="old_image_link" value="<?php if (isset($image_link) && $image_link!=""){echo $image_link; } ?>" />

        <?php if(isset($image_link_err) && !empty($image_link_err)) 

        { foreach($image_link_err as $key => $error)

        { echo "<div class=\"error-msg\"></div>"; } }?>

      </div>

        <div class="col-sm-3" >

      </div>

    </div>

    <!-- Image_link End -->



    



	<!-- Com_estado_id Start -->

	<div class="form-group">

        <label class="control-label col-md-3"> Com_estado_id </label>

          <div class="col-md-4">

              <select class="form-control select2" name="com_estado_id" id="com_estado_id">

              <option value="">Select Com_estado_id</option>

      <?php 

      if(isset($user_comprobante_estado_table) && !empty($user_comprobante_estado_table)):

      foreach($user_comprobante_estado_table as $key => $value): ?>

          <option value="<?php echo $value->user_com_es_id; ?>">

            <?php echo $value->user_com_estado; ?>

          </option>

      <?php endforeach; ?>

      <?php endif; ?>

      </select>

        </div>

    </div>

      <!-- Com_estado_id End -->







	<!-- Com_estado_date Start -->

	<div class="form-group">

	  <label for="com_estado_date" class="col-sm-3 control-label"> Com_estado_date </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control datetimepicker" id="com_estado_date"  name="com_estado_date"/>

	  </div>

	  <div class="col-sm-5" >

	    <?php echo form_error("com_estado_date","<span class='label label-danger'>","</span>")?>

	  </div>

	</div>

	<!-- Com_estado_date End -->



	



				<!-- Com_estado_obs Start -->

			<div class="form-group">

			  <label for="com_estado_obs" class="col-sm-3 control-label"> Com_estado_obs </label>

			  <div class="col-sm-4">

			    <textarea class="form-control" id="com_estado_obs" name="com_estado_obs"><?php echo set_value("com_estado_obs"); ?></textarea>

			  </div>

			  <div class="col-sm-5" >

			 

			    <?php echo form_error("com_estado_obs","<span class='label label-danger'>","</span>")?>

			  </div>

			</div> 

			<!-- Com_estado_obs End -->



			





	<!-- Com_estado_opeid Start -->

	<div class="form-group">

	  <label for="com_estado_opeid" class="col-sm-3 control-label"> Com_estado_opeid </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control" id="com_estado_opeid" name="com_estado_opeid" 

	    

	    value="<?php echo set_value("com_estado_opeid"); ?>"

	    >

	  </div>

	  <div class="col-sm-5" >

	 

	    <?php echo form_error("com_estado_opeid","<span class='label label-danger'>","</span>")?>

	  </div>

	</div> 

	<!-- Com_estado_opeid End -->





	





	<!-- Product_cart_id Start -->

	<div class="form-group">

	  <label for="product_cart_id" class="col-sm-3 control-label"> Product_cart_id </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control" id="product_cart_id" name="product_cart_id" 

	    

	    value="<?php echo set_value("product_cart_id"); ?>"

	    >

	  </div>

	  <div class="col-sm-5" >

	 

	    <?php echo form_error("product_cart_id","<span class='label label-danger'>","</span>")?>

	  </div>

	</div> 

	<!-- Product_cart_id End -->





	





	<!-- Cart_id Start -->

	<div class="form-group">

	  <label for="cart_id" class="col-sm-3 control-label"> Cart_id </label>

	  <div class="col-sm-4">

	    <input type="text" class="form-control" id="cart_id" name="cart_id" 

	    

	    value="<?php echo set_value("cart_id"); ?>"

	    >

	  </div>

	  <div class="col-sm-5" >

	 

	    <?php echo form_error("cart_id","<span class='label label-danger'>","</span>")?>

	  </div>

	</div> 

	<!-- Cart_id End -->





	
              <div class="form-group">
                <div class="col-sm-3" >                       
                </div>
                <div class="col-sm-6">
                  <button type="reset" class="btn btn-default ">Reset</button>
                  <button type="submit" class="btn btn-info ">Submit</button>
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