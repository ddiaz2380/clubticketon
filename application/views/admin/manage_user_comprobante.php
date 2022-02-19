<?php $this->load->view('header'); ?>
<!--  BO :heading -->
<div class="row wrapper border-bottom white-bg page-heading">
   <div class="col-lg-10">
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
   <div class="col-lg-2">
   </div>
</div>
<div class="row">
   <div class="col-lg-12">
      <div class="ibox ">
         <br>
         <div class="ibox-title">
            <?php if($this->session->flashdata('message')): ?>
            <div class="alert alert-success">
               <button type="button" class="close" data-close="alert"></button>
               <?php echo $this->session->flashdata('message'); ?>
            </div>
            <?php endif; ?>
            <a href="<?php echo base_url(); ?>admin/user_comprobante_table/add" class="btn btn-info">ADD NEW</a>
            <div class="form-group pull-right">
               <a href="<?php echo $csvlink; ?>" class="btn btn-info">CSV</a>
               <a href="<?php echo $pdflink; ?>" class="btn btn-info">PDF</a>
            </div>
            <form method="GET" action="<?php echo base_url().'admin/user_comprobante_table/index'; ?>" class="form-inline ibox-content">
               <div class="form-group">
                  <select name="searchBy" class="form-control">
                  <option value="user_table.username" <?php echo $searchBy=="user_table.username"?'selected="selected"':""; ?>>User_id</option><option value="com_fecha_subida" <?php echo $searchBy=="com_fecha_subida"?'selected="selected"':""; ?>>Com_fecha_subida</option><option value="com_fecha_compra" <?php echo $searchBy=="com_fecha_compra"?'selected="selected"':""; ?>>Com_fecha_compra</option><option value="com_numero" <?php echo $searchBy=="com_numero"?'selected="selected"':""; ?>>Com_numero</option><option value="com_cuit" <?php echo $searchBy=="com_cuit"?'selected="selected"':""; ?>>Com_cuit</option><option value="municipio_table.municipio_nombre" <?php echo $searchBy=="municipio_table.municipio_nombre"?'selected="selected"':""; ?>>Municipio_id</option><option value="image_link" <?php echo $searchBy=="image_link"?'selected="selected"':""; ?>>Image_link</option><option value="user_comprobante_estado_table.user_com_estado" <?php echo $searchBy=="user_comprobante_estado_table.user_com_estado"?'selected="selected"':""; ?>>Com_estado_id</option><option value="com_estado_date" <?php echo $searchBy=="com_estado_date"?'selected="selected"':""; ?>>Com_estado_date</option><option value="com_estado_obs" <?php echo $searchBy=="com_estado_obs"?'selected="selected"':""; ?>>Com_estado_obs</option><option value="com_estado_opeid" <?php echo $searchBy=="com_estado_opeid"?'selected="selected"':""; ?>>Com_estado_opeid</option><option value="product_cart_id" <?php echo $searchBy=="product_cart_id"?'selected="selected"':""; ?>>Product_cart_id</option><option value="cart_id" <?php echo $searchBy=="cart_id"?'selected="selected"':""; ?>>Cart_id</option>
                  </select>
               </div>
               <div class="form-group">
                  <input type="text" name="searchValue" id="searchValue" class="form-control" value="<?php echo $searchValue; ?>">
               </div>
               <input type="submit" name="search" value="Search" class="btn btn-info">
               <div class="form-group pull-right">
                  <select name="per_page" class="form-control" onchange="this.form.submit()">
                     <option value="5" <?php echo $per_page=="5"?'selected="selected"':""; ?>>5</option>
                     <option value="10" <?php echo $per_page=="10"?'selected="selected"':""; ?>>10</option>
                     <option value="20" <?php echo $per_page=="20"?'selected="selected"':""; ?>>20</option>
                     <option value="50" <?php echo $per_page=="50"?'selected="selected"':""; ?>>50</option>
                     <option value="100" <?php echo $per_page=="100"?'selected="selected"':""; ?>>100</option>
                  </select>
               </div>
            </form>
         </div>
         <div class="ibox-content">
         <div class="table table-responsive">
            <table class="table table-striped table-bordered table-hover Tax" >
               <thead>
                  <tr>
                     <th><input onclick="toggle(this,'cbgroup1')" id="foo[]" name="foo[]" type="checkbox" value="" /></th>
                     <th> Sr No. </th>
                     <?php $sortSym=isset($_GET["order"]) && $_GET["order"]=="asc" ? "up" : "down"; ?>

				<?php

				 $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="user_table.username"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>



				<th> <a href="<?php echo $fields_links["user_table.username"]; ?>" class="link_css"> User_id <?php echo $symbol ?></a></th>

   						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="com_fecha_subida"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["com_fecha_subida"]; ?>" class="link_css"> Com_fecha_subida <?php echo $symbol ?></a></th>

						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="com_fecha_compra"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["com_fecha_compra"]; ?>" class="link_css"> Com_fecha_compra <?php echo $symbol ?></a></th>

						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="com_numero"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["com_numero"]; ?>" class="link_css"> Com_numero <?php echo $symbol ?></a></th>

						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="com_cuit"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["com_cuit"]; ?>" class="link_css"> Com_cuit <?php echo $symbol ?></a></th>

						

				<?php

				 $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="municipio_table.municipio_nombre"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>



				<th> <a href="<?php echo $fields_links["municipio_table.municipio_nombre"]; ?>" class="link_css"> Municipio_id <?php echo $symbol ?></a></th>

   						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="image_link"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["image_link"]; ?>" class="link_css"> Image_link <?php echo $symbol ?></a></th>

						

				<?php

				 $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="user_comprobante_estado_table.user_com_estado"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>



				<th> <a href="<?php echo $fields_links["user_comprobante_estado_table.user_com_estado"]; ?>" class="link_css"> Com_estado_id <?php echo $symbol ?></a></th>

   						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="com_estado_date"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["com_estado_date"]; ?>" class="link_css"> Com_estado_date <?php echo $symbol ?></a></th>

						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="com_estado_obs"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["com_estado_obs"]; ?>" class="link_css"> Com_estado_obs <?php echo $symbol ?></a></th>

						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="com_estado_opeid"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["com_estado_opeid"]; ?>" class="link_css"> Com_estado_opeid <?php echo $symbol ?></a></th>

						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="product_cart_id"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["product_cart_id"]; ?>" class="link_css"> Product_cart_id <?php echo $symbol ?></a></th>

						

				<?php $symbol = isset($_GET["sortBy"]) && $_GET["sortBy"]=="cart_id"?"<i class='fa fa-sort-$sortSym' aria-hidden='true'></i>": "<i class='fa fa-sort' aria-hidden='true'></i>"; ?>

				<th> <a href="<?php echo $fields_links["cart_id"]; ?>" class="link_css"> Cart_id <?php echo $symbol ?></a></th>

						
                     <th> Action </th>
                  </tr>
               </thead>
               <tbody>
                  <?php if(isset($results) and !empty($results))
                     {
                     
                       $count=1;
                     
                       ?>
                  <?php 
                     foreach ($results as $key => $value) {
                     
                      ?>
                  <tr  id="hide<?php echo $value->user_comprobante_id; ?>" >
                  <th><input name='input' id='del' onclick="callme('show')"  type='checkbox' class='del' value='<?php echo $value->user_comprobante_id; ?>'/></th>

                              

            <th><?php if(!empty($value->user_comprobante_id)){ echo $count; $count++; }?></th><th><?php if(!empty($value->user_id)){ echo $value->user_id; }?></th>

                <th><?php if(!empty($value->com_fecha_subida)){ echo $value->com_fecha_subida; }?></th>

                <th><?php if(!empty($value->com_fecha_compra)){ echo $value->com_fecha_compra; }?></th>

                <th><?php if(!empty($value->com_numero)){ echo $value->com_numero; }?></th>

                <th><?php if(!empty($value->com_cuit)){ echo $value->com_cuit; }?></th>

                <th><?php if(!empty($value->municipio_id)){ echo $value->municipio_id; }?></th>

                <th><?php if(!empty($value->image_link)){ ?> 

                        <img src="<?php echo $this->config->item('photo_url');?><?php echo $value->image_link; ?>" alt="pic" width="50" height="50" />

                         <?php }?></th><th><?php if(!empty($value->com_estado_id)){ echo $value->com_estado_id; }?></th>

                <th><?php if(!empty($value->com_estado_date)){ echo $value->com_estado_date; }?></th>

                <th><?php if(!empty($value->com_estado_obs)){ echo $value->com_estado_obs; }?></th>

                <th><?php if(!empty($value->com_estado_opeid)){ echo $value->com_estado_opeid; }?></th>

                <th><?php if(!empty($value->product_cart_id)){ echo $value->product_cart_id; }?></th>

                <th><?php if(!empty($value->cart_id)){ echo $value->cart_id; }?></th>

                <th class="action-width">

		   <a href="<?php echo base_url()?>admin/user_comprobante_table/view/<?php echo $value->user_comprobante_id; ?>" title="View">

            <span class="btn btn-info " ><i class="fa fa-eye"></i></span>

           </a>

           <a href="<?php echo base_url()?>admin/user_comprobante_table/edit/<?php echo $value->user_comprobante_id; ?>" title="Edit">

            <span class="btn btn-info " ><i class="fa fa-edit"></i></span>

           </a>

           <a  title="Delete" data-toggle="modal" data-target="#commonDelete" onclick="set_common_delete('<?php echo $value->user_comprobante_id; ?>','user_comprobante_table');">

           <span class="btn btn-info " ><i class="fa fa-trash-o "></i></span>

           </a>

            </th>
                  </tr>
                  <?php 
                     }
                     
                     
                     } else{
                     echo '<tr><td colspan="100"><h3 align="center" class="text-danger">No Record found!</center</td></tr>';
                     } ?>  
               </tbody>
            </table>
            </div>
            <?php echo $links; ?>
         </div>
      </div>
      <img onclick="callme('','item','')" src="<?php echo $this->config->item('accet_url')?>/img/mac-trashcan_full-new.png" id="recycle" style="width:90px;  display:none; position:fixed; bottom: 50px; right: 50px;"/>
   </div>
</div>
<script type="text/javascript">
   function delRow()
   {
   var confrm = confirm("Are you sure you want to delete?");
   if(confrm)
   {
   ids = values();
   $.ajax({
     type:"POST",
     url:'<?php echo base_url()."admin/user_comprobante_table/deleteAll"; ?>',
     data:{
       allIds : ids,
       '<?php echo $this->security->get_csrf_token_name(); ?>':'<?php echo $this->security->get_csrf_hash(); ?>'
     },
     success:function(){
       location.reload();
       },
     });
   }
   }
</script>
<?php $this->load->view('footer'); ?>