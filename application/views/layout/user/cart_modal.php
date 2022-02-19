    <div class="modal fade" id="cartmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Remover producto del carro</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <?= form_open('cart/removeFromCart'); ?>
          <input type="hidden" id="productCartId" name="productCartId" value=""/>
          <div class="modal-body">Elegir aceptar para remover el producto.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary">Aceptar</button>
          </div>
          <?= form_close(); ?>
        </div>
      </div>
    </div>