<template>
	<div>
		<div class="modal fade" id="createTicket" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Ticket usuarios</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div v-if="success !== ''" class="alert alert-success">{{success}}</div>
		      	<form action="" @submit.prevent="save_users" >
		      		<input type="hidden" name="id_ticket" :value="ticket.id">
		        	<search-user tipe="edit" ></search-user>
		        	<div class="row mt-2">
		        		<div class="col-12 text-center">
		        			<button class="btn btn-primary">Guardar</button>
		        		</div>
		        	</div>
		        </form>
		      </div>
		      
		    </div>
		  </div>
		</div>
	    <div class="card direct-chat direct-chat-primary">
	    	<loader-ticket  :status="loader_status" ></loader-ticket>

          <div class=" card-details row">
            <div class="col-12 ">
              <h3 class="text-left card-title ">Apertura: <b>{{ticket.apertura}}</b></h3>
            </div>
            <div class="col-6 ">
              <h3 class="text-left card-title ">Usuarios asignados: </h3>	      
              	<span id="user_selected" class="item_select" v-for="(item,key) in items_json_ticket" :key="key">{{item.name}}
              		<a href="#" style="color:white;"  @click.prevent="delete_item_ticket()" v-if="role_user === 'administrador' || role_user ==='tecnico'" :data-id="item.id" :data-email="item.email" :data-key="key"><i class="fas fa-trash"></i></a>
              </span>
              <a href="#" class="btn btn-primary" v-if="role_user === 'administrador' || role_user ==='tecnico'" data-toggle="modal" data-target="#createTicket"><i class="fas fa-plus-square"></i></a>
            </div>
            <div class="col-6 text-right"  v-if="role_user === 'administrador' || role_user ==='tecnico'" >
            	<button type="button" :style="{background:ticket.status_color,border:0}"  class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
            		{{ticket.status}}
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item " href="#"  :data-url="url_status" v-for="item in status" v-if="item.nombre !== ticket.status" :data-ticket="ticket.id" :data-id="item.id" @click.prevent="change_status" :key="item.id">
						 {{item.nombre}}
					</a>
					
				</div>

            </div>
          </div>
        <div class="card-header">
            <h3 class="card-title">Ticket - {{ticket.titulo}} - {{ticket.codigo}} - Descripcion: {{ticket.descripcion}}</h3>

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
	              <p v-if="item.notice_message==1" class="alert alert-warning mb-0"> <i class="fas fa-info-circle"></i>   <span v-html="item.mensaje"></span></p>
	              <div v-else-if="item.notice_message==null" class="mb-0"  v-html="item.mensaje" ></div>
	              <div v-if="item.img_src !== null || item.file_src !== null">
		              <hr class="mt-0 mb-0">
		              <div class="row justify-content-center p-2" >
		              	<div class="col-7">
		              		<a href="#" @click="img_full" :data-src="`${asset_img}/ticket/${id_ticket}/${item.img_src}`"><img v-if="item.img_src !== null" :src="`${asset_img}/ticket/${id_ticket}/${item.img_src}`" alt="" class="img-thumbnail" width="100px"></a>
		              		<a :href="`${asset_img}/ticket/${id_ticket}/${item.file_src}`" v-if="item.file_src !== null" id="url_file" class="box-link-ticket"><i class="fas fa-paperclip"></i> {{item.file_src}}</a>

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
	          <div class="row">
	          	<div class="col-11">
	          		<ckeditor :editor="editor" v-model="editorData" :config="editorConfig"></ckeditor>
	          		<input type="hidden" name="mensaje" :value="editorData">
	           	</div>
	            <input type="hidden" name="ticket_id" :value="id_ticket">
	            <div class="col-1">
	              <button type="button" class="btn btn-primary"  @click="submit_mensaje" >Enviar</button>
	            </div>
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
		          		<a :href="url_file" id="url_file" class="box-link-ticket" ><i class="fas fa-paperclip"></i> {{file_name}}</a>
		          	</div>
	          	</div>
          	</form>
	    </div>
       </div>	      
		<!-- Modal -->
		<div class="modal fade" id="fullimgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<img :src="imgmodal" alt="" style="width:100%;">
		      </div>	

		    </div>
		  </div>
		</div>

      	<!-- /.card-footer-->

        <!--/.direct-chat-messages-->
	</div>
</template>

<script>
import LoaderTicket from './LoaderTicket.vue';
import SearchUser from './SearchUserTicket.vue';
import {mapState,mapMutations} from "vuex";

export default {
	props:['id_ticket','ticket','mensaje_count','status','role_user'],
    data: function() {
      return {
        mensajes: [],
        asset_img:'',
        url_img:'',
        url_file:'',
        url_status:'',
        file_name:'',
        asset_img_default:'',
        loader_status:'',
        editor: ClassicEditor,
        editorData: '',
        imgmodal:'',
        success:'',
        users_json:null,
        users_selected:[],
        editorConfig: {
                    // The configuration of the editor.
        }

      };
    },
    created() {
    	this.url_status = `${app_base_url}/status/ticket`;
    	axios.get(`${app_base_url}/api/mensaje/${this.id_ticket}`)
        .then((response)=> {
          this.mensajes = response.data;
            this.bottom();

        });
        this.asset_img = app_base_asset;
        this.asset_img_default = app_avatar_default;


    },
    computed:{
    	...mapState(['items_json_ticket']),
    },
    mounted(){
    	this.users_json = JSON.parse(this.ticket.users_asigne_json);
    	this.$store.dispatch('loadItemsTicket', JSON.parse(this.ticket.users_asigne_json))

    	this.$on('users_json', function(event){
    		let users_json_array = (this.users_json !== null) ? Object.values(this.users_json) : []; 
    		let me = this;
    		$.each(event, function(index, val) {
    			let users_in_array = users_json_array.filter(user => user.email == val.email);
	          	if (users_in_array.length == 0) {
	          		users_json_array.push(val);
	          		me.users_json = users_json_array;
    				me.$store.dispatch('loadItemsTicket', users_json_array)
	          	}
    		});
        });

    },
    methods: {
    	change_status(event){
    		$.ajaxblock('body','fixed');
    		let url = $(event.currentTarget).attr('data-url');
			let id_ticket = $(event.currentTarget).attr('data-ticket');
			let id_status = $(event.currentTarget).attr('data-id');
			event.preventDefault();
			axios({
			  method:'POST',
			  url: url,
			  data:{
			  	id_ticket,
			  	id_status,

			  }
			})
			.then(function (response) {
				location.reload();
				$.ajaxunblock();
			})	
			.catch(function (error) {
			    if (error.response.status == 422){
			    	alert(error.response.data.error)
		        	
		      	}else if (error.response.status == 500) {
		        	alert(error.response.data.message)
		      	}
			});
    	},
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
		save_users(event){
  		   this.loader_status = 'active';
		   let me = this;
		   let id_ticket = this.ticket.id;
		   event.preventDefault();

		   axios({
			  method: 'POST',
			  url: `${app_base_url}/ticket/save_users`,
			  data: {
			  	id_ticket,
			  	users_js: this.users_json
			  },
			})
		    .then(function (response) {
	        	me.success = response.data.success
    		 	me.loader_status = '';
    			me.$store.dispatch('loadItems', [])
		    })
		   .catch(function (error) {
		   		me.loader_status = 'inactive';

			    if (error.response.status == 422){
		        	$.each(error.response.data.error, function(index, val) {
		        		me.errors.push({
		        			val
		        		})
		        	});
		      	}else if (error.response.status == 500) {
		        	alert(error.response.data.message)
		      	}
			});
		},
    	submit_mensaje(event){
    	   this.loader_status = 'active';
    	   let form = document.getElementById('formticket');
		   let formData = new FormData(form);
		   let me = this;
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
	        	me.url_file = '';
	        	me.url_img = '';
	        	me.file_name = '';
	        	me.loader_status = '';
	        	me.editorData = '';
	        	document.getElementById("formticket").reset(); 
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
		img_full(event){
			this.imgmodal = $(event.currentTarget).attr('data-src');
			$('#fullimgModal').modal('show');
		},
		delete_item_ticket(){
			this.loader_status = 'active';
			let llave = $(event.currentTarget).attr('data-key');
      		this.users_json.splice(llave, 1);
    		this.$store.dispatch('loadItemsTicket', this.users_json)

			let me = this;
			let id = $(event.currentTarget).attr('data-id');
			let email = $(event.currentTarget).attr('data-email');
			let ticket_id = this.ticket.id;
			let json_users = this.users_json;
			let formData = {
				id,
				email,
				ticket_id,
				json_users
			}
			axios({
			  method: 'POST',
			  url: `${app_base_url}/ticket/user_asigne`,
			  data: formData,
			})
		    .then(function (response) {
      			me.loader_status = '';

		    })
		

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
    	SearchUser
    }
  }

</script>