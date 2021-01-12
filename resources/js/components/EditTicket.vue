<template>
	<div>
		<form action="" data-action="" method="PUT" id="updated_form">

          <div class="row">
            <div class="col-6 ">
              <label for="">Titulo</label>
              <input type="text" name="titulo" id="titulo_input" class="form-control" placeholder="titulo del ticket"  readonly="">
            </div>
            <div class="col-6 text-center">
              <search-user></search-user>
              <br>
              <span class="item_select" id="user_selected" ></span>
            </div>
          </div>
          <hr>
          <div class="row mt-2">
            <div class="col-6">
                <label for="exampleFormControlSelect1">Categorias </label>
                <select class="form-control change_select" id="change_select_updated"  data-live-search="true" data-two="on">
                  <option value="">Seleccionar Categoria.</option>

                    <option v-for="item in categorias" :value="item.nombre" data-id="item.id">{item.nombre}</option>
                </select>
            </div>
            <div class="col-6 " >
              <label for="">Caducidad</label>
              <input type="text" class="form-control datetimepicker-input datetimepicker" id="datetimepicker_edit" data-toggle="datetimepicker" data-target="#datetimepicker5" name="fecha_caducidad" value="" />
            </div>
          </div>
          <div class="row">
            <div class="col-12 " >
              <div class="row  justify-content-center options_selects_category" id="options_select_updated">
                <input type="hidden" id="check_categories" name="check_categories_log" value="0">
              </div>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-12 ">
              <label for="">Descripcion</label>
              <br>
              <textarea name="descripcion" id="descripcion_edit"  class="form-control"></textarea>
            </div>

          </div>
          <hr>
          <div class="row mt-2">
            <div class="col-12 text-center">
              <button class="btn btn-primary">Guardar</button>
            </div>
          </div>
        </form>
	</div>
</template>

<script>

import SearchUser from './SearchUserTicket.vue';

export default {
	props: ['categorias'],
    data: function() {
      return {   
      	search_list:null,
      	search_value:'',
      };
    },
    created() {
     
    },
    mounted(){
    	

    },

    methods: {
    
    },
    created () {
       document.addEventListener('click', this.documentClick)
    },
    destroyed () {
	   document.removeEventListener('click', this.documentClick)
	},

    components: {
    	SearchUser
    }
  }

</script>