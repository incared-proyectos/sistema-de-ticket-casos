<template>
	<div>

	    <div class="card direct-chat direct-chat-primary">
	    	<loader-ticket  :status="loader_status" ></loader-ticket>

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
	            <img class="direct-chat-img" :src="item.from_user.img_src !== null  ? `${asset_img}/profile/${item.from_user.id}/${item.from_user.img_src}` : `${asset_img_default}/avatar5.png`" alt="message user image" >
	            <!-- /.direct-chat-img -->
	            <div class="direct-chat-text">
	              <p v-if="item.notice_message==1" class="alert alert-warning mb-0"> <i class="fas fa-info-circle"></i> {{item.mensaje}}</p>
	              <p v-else-if="item.notice_message==null" class="mb-0">{{item.mensaje}}</p>
	              <div v-if="item.img_src !== null || item.file_src !== null">
		              <hr class="mt-0 mb-0">
		              <div class="row justify-content-center p-2" >
		              	<div class="col-7">
		              		<img v-if="item.img_src !== null" :src="`${asset_img}/ticket/${id_ticket}/${item.img_src}`" alt="" class="img-thumbnail" width="100px">
		              		<a :href="`${asset_img}/ticket/${id_ticket}/${item.file_src}`" id="url_file" class="box-link-ticket"><i class="fas fa-paperclip"></i> {{item.file_src}}</a>

		              	</div>

		              </div>
	              </div>
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
	    	<form action="" @submit.prevent="submit_mensaje" id="formticket">
	          <div class="input-group">
	            <input type="text" name="mensaje" id="mensaje" placeholder="Escrbir mensaje ..." class="form-control">
	            <input type="hidden" name="ticket_id" :value="id_ticket">
	            <span class="input-group-append">
	              <button type="button" class="btn btn-primary" >Enviar</button>
	            </span>
	          </div>
	          <div class="row mt-2">
	          	<div class="col-12 text-center">  
	          		<a href="#" class="btn btn-warning" @click.prevent="opendeFolder('image')"><i class="far fa-image"></i></a>
	          		<input type="file" @change="onSelectImage" ref="image" style="display:none;" name="file_image">

	          		<a href="#" class="btn btn-primary" @click.prevent="opendeFolder('file')"><i class="fas fa-file-upload"></i></a>
	          		<input type="file" @change="onSelectFile" ref="attachment" style="display:none;" name="file_archive">


	          	</div>
	          </div>
	            <b>Upload Files</b>
	          	<hr class="mt-0 pt-0">
	          	<div class="row justify-content-center">
		          	<div class="col-3" v-if="url_img!==''">
		          		<img :src="url_img" alt="" class="img-thumbnail">
		          	</div>
		          	<div class="col-3" v-if="url_file!==''">
		          		<a :href="url_file" id="url_file" class="box-link-ticket"><i class="fas fa-paperclip"></i> {{file_name}}</a>
		          	</div>
	          	</div>
          	</form>
	    </div>
       </div>	      


      	<!-- /.card-footer-->

        <!--/.direct-chat-messages-->
	</div>
</template>

<script>
import LoaderTicket from './LoaderTicket.vue';
export default {
	props:['id_ticket','ticket','mensaje_count'],
    data: function() {
      return {
        mensajes: [],
        asset_img:'',
        url_img:'',
        url_file:'',
        file_name:'',
        asset_img_default:'',
        loader_status:''
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
    	opendeFolder(tipe){
    		if (tipe == 'file') {
    			this.$refs.attachment.click()
    		}else if (tipe == 'image') {
    			this.$refs.image.click()
    		}

    	},
    	onSelectFile (event) {
		    const file = event.currentTarget.files[0];
      		this.file_name = file.name;
      		this.url_file = URL.createObjectURL(file);


		},
		onSelectImage (event) {
		    const file = event.currentTarget.files[0];

      		this.url_img = URL.createObjectURL(file);

		},
    	submit_mensaje(event){
    	   this.loader_status = 'active';
    	   let form = document.getElementById('formticket');
		   let formData = new FormData(form);
		   let me = this;
		   let mensaje = $('#mensaje');
		   event.preventDefault();
		   axios({
			  method: 'POST',
			  url: `${app_base_url}/api/mensaje`,
			  data: formData,
			  headers: {
              	'Content-Type': 'multipart/form-data'
        	  }
			})
		    .then(function (response) {
      			me.mensajes.push(response.data);
	        	mensaje.val('');
	        	event.target.reset();
	        	me.url_file = '';
	        	me.url_img = '';
	        	me.file_name = '';
	        	me.loader_status = '';
	        	me.bottom();
    		

		    })
		   .catch(function (error) {
			    if (error.response.status == 422){
		        	$.each(error.response.data.error, function(index, val) {
		        		me.errors.push({
		        			val
		        		})
		        	});
		      	}else if (error.response.status == 500) {
		        	alert(error.response.data.message)
		      	}
		      	me.loader_status = 'inactive';
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
    	LoaderTicket,
    }
  }

</script>