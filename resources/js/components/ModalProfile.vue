<template>
	<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Edicion de perfil</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div v-if="success !== ''" class="alert alert-success">{{success}}</div>
	      	<div v-if="errors.length > 0" class="alert alert-danger">
	      		<p v-for="item in errors" class="mb-0">*{{item.val}}</p>
	      	</div>
	      	<form action="" @submit="change_profile">
		      	<div class="row justify-content-center">
		      		<div class="col-5 text-center content_img">
		      			<img :src="(url_img !== null) ? url_img : img_src "  id="img_profile" alt="" width="150px" class="profile-img">
		      			<div class="middle">
					    	<div class="text">
					    		<input type="file" @change="onSelectFile" ref="attachment" style="display:none;" name="file">
					    		<a href="#" class="btn btn-primary" @click="opendeFolder"><i class="fas fa-camera"></i> Cambiar</a></div>
					  	</div>
		      		</div>
		      	</div>
		      	<hr>
		      	<div class="row mt-2">
		      		<div class="col-4">
		      			<label for="">Nombre:</label>
		      			<input type="text" name="name" class="form-control" :value="user_object.name">
		      		</div>
		      		<div class="col-4">
		      			<label for="">Email:</label>
		      			<input type="text" name="email" class="form-control" :value="user_object.email">
		      		</div>
		      		<div class="col-4">
		      			<label for="">Password:</label>
		      			<input type="password" name="password" class="form-control" >
		      		</div>
		      	</div>
		      	<hr>
		      	<div class="row">
		      		<div class="col-4">
		      			<label for="">Telefono:</label>
		      			<input type="text" name="telefono" class="form-control" :value="user_object.telefono">
		      		</div>
		      		<div class="col-4">
		      			<label for="">Sede:</label>
		      			<input type="text" name="sede" class="form-control" :value="user_object.sede">
		      		</div>
		      		<div class="col-4">
		      			<label for="">Direccion:</label>
		      			<input type="text" name="direccion" class="form-control" :value="user_object.direccion">
		      		</div>
		      	</div>
		      	<hr>
		      	<div class="row mt-3">
					<div class="col-12 text-center"> 
						<button class="btn btn-primary">Guardar</button>
					</div>		      		
		      	</div>
		     </form>
	      </div>
	    </div>
	  </div>
	</div>
</template>

<script>
export default {
	props: ['user','user_img','img_default'],
    data: function() {
      return {
      	url_img:null,
      	user_object:null,
        data: [],
        errors:[],
        img_src:'',
        success:'',
      };
    },
    created() {
      this.user_object = JSON.parse(this.user);

      if (this.user_object.img_src !== null  ) {
      	this.img_src =  `${this.user_img}/${this.user_object.id}/${this.user_object.img_src}` ;
      }else{
      	this.img_src = this.img_default
      }
      
      this.isLoading = true;
    },
    mounted(){
    	//this.getDatos();
    },

    methods: {
    	prueba(){
    		alert('hola');
		},
		opendeFolder(){
  			this.$refs.attachment.click()
		},
		onSelectFile (event) {
		    const file = event.currentTarget.files[0];

      		this.url_img = URL.createObjectURL(file);

		},
		set_values(data){
	        let me = this;
	        let formData = new FormData(data);
	        const data_iput = {}; 
	        for (let [key, val] of formData.entries()) {
	         	Object.assign(data_iput, {[key]: val})
	        }
	        this.user_object = data_iput; 
     	},
		change_profile(event){
		   this.errors = [];
		   let formData = new FormData(event.currentTarget);
		   this.set_values(event.currentTarget);
		   $.ajaxblock(event.currentTarget);
		   let me = this;
		   event.preventDefault();
		   axios({
			  method: 'POST',
			  url: `${app_base_url}/perfil`,
			  data: formData,
			  headers: {
              	'Content-Type': 'multipart/form-data'
        	  }
			})
		    .then(function (response) {
		    	me.success = response.data.success
		    	if (me.url_img !== null) {
		    		$('#img_aside').attr('src',me.url_img);
		    	}

		    	$.ajaxunblock();
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
		      	$.ajaxunblock();
			});
		},
    },
    components: {

    }
  }

</script>