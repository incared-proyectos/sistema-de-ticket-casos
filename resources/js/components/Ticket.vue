<template>
	<div>

	    <div class="card direct-chat direct-chat-primary">
          <div class=" card-details row">
            <div class="col-6 ">
              <h3 class="text-left card-title ">Apertura: <b>{{ticket.apertura}}</b></h3>
            </div>
          </div>
          <div class="card-header">
            <h3 class="card-title">Ticket - {{ticket.titulo}} - {{ticket.codigo}}</h3>

            <div class="card-tools">
              <span data-toggle="tooltip" title="3 New Messages" class="badge badge-primary"><b>Mensajes totales:</b> {{mensaje_count}}</span>

            </div>
            <br>
       
         </div>
        <!-- /.card-header -->
	    <div class="card-body">

			<!-- Conversations are loaded here -->
	        <div class="direct-chat-messages" >
	          <!-- Message. Default to the left -->
	          <div  v-for="item in mensajes" :key="item.id" :class="['direct-chat-msg',item.escribe_active ? 'right': '']">
	            <div class="direct-chat-infos clearfix">
	              <span :class="['direct-chat-name',item.escribe_active ? 'float-right' : 'float-left']">{{item.from_user.name}}</span>
	              <span :class="['direct-chat-timestamp',item.escribe_active ? 'float-left' : 'float-right']">{{item.created_at}}</span>
	            </div>
	            <!-- /.direct-chat-infos -->
	            <img class="direct-chat-img" :src="item.from_user.img_src !== null  ? `${asset_img}/${item.from_user.id}/${item.from_user.img_src}` : `${asset_img_default}/avatar5.png`" alt="message user image">
	            <!-- /.direct-chat-img -->
	            <div class="direct-chat-text">
	              {{item.mensaje}}
	            </div>
	            <!-- /.direct-chat-text -->
	             <hr>
	          </div>

	          <!-- /.direct-chat-msg -->
	        </div>
	        <!-- /.direct-chat-pane -->
	    </div>
	      <!-- /.card-body -->
	    <div class="card-footer">
          <div class="input-group">
            <input type="text" name="message" id="mensaje" placeholder="Escrbir mensaje ..." class="form-control" @keyup.enter="submit_mensaje">
            <span class="input-group-append">
              <button type="button" class="btn btn-primary" @click.prevent="submit_mensaje">Enviar</button>
            </span>
          </div>
	    </div>
       </div>

      	<!-- /.card-footer-->

        <!--/.direct-chat-messages-->
	</div>
</template>

<script>
export default {
	props:['id_ticket','ticket','mensaje_count'],
    data: function() {
      return {
        mensajes: [],
        asset_img:'',
        asset_img_default:''
      };
    },
    created() {
    	axios.get(`${app_base_url}/api/mensaje/${this.id_ticket}`)
        .then((response)=> {
          this.mensajes = response.data;
            this.bottom();

        });
        this.asset_img = app_base_asset;
        this.asset_img_default = app_avatar_default;

    },
    mounted(){
    },
    methods: {
    	submit_mensaje(){
    		let mensaje = $('#mensaje');
    		let data_axios = {
    			ticket_id:this.id_ticket,
    			mensaje:mensaje.val()
    		}
    		axios.post(`${app_base_url}/api/mensaje`,data_axios)
	        .then((response)=> {
	        	this.mensajes.push(response.data);
	        	mensaje.val('');
	        	this.bottom();
	        });
    	},
    	bottom(){
    		setTimeout(function(){
	    		var element = document.querySelector("body");
	   			element.scrollTop = element.scrollHeight - element.clientHeight;
   			}, 500);

    	}
	
    },
    components: {

    }
  }

</script>