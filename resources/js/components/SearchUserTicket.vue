<template>
	<div >
        <label for="">Usuario o email</label>
	      <input type="text" name="user"  class="form-control user_input" placeholder="Ingrese a quien se le asignara" v-model="search_value" @keyup="search"  >
	      <div class="row row-search" v-if="search_list !== null">
	      	<div class="col-12">
	      		<div class="content-search">
	      			<ul class="list-search">
	      				<li v-for="item in search_list "  class="items_searchs" :data-email="item.email"  :key="item.id" @click="user_list">{{item.name}}</li>
	      			</ul>
	      		</div>
	      	</div>
	      </div>
	      <span id="user_selected" class="item_select" v-for="(item,key) in items_json_search" :key="key">{{item.name}} <a href="#" style="color:white;" @click.prevent="delete_item(key)"><i class="fas fa-trash"></i></a></span>
	      <input type="hidden" name="users_asigne_json" :value="JSON.stringify(items_json_search)"> 
	</div>
</template>

<script>
import {mapState,mapMutations} from "vuex";

export default {
	props: ['user','user_img','img_default','tipe_json' ,'tipe'],
    data: function() {
      return {   
      	search_list:null,
      	search_value:'',
      	users_selected:[],
      };
    },
    created() {


    },
    mounted(){
    },
    computed:{
    	...mapState(['items_json_search']),
    },
    methods: {
    	dicks(){
    	},
    	search(event){
    		let val_search = $(event.currentTarget).val();
    		let me = this;
		   	event.preventDefault();
			axios({
				method: 'post',
				url: `${app_base_url}/usuarios/search`,			
				data:{
					search:val_search
				}
			})
			.then(function (response) {
				if (response.data !== '') {
					me.search_list = response.data
				}else{
					me.search_list = null;
				}
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

		user_list(event){
	    	let email = $(event.currentTarget).attr('data-email');
	    	this.search_value = email;
	    	let user_selected  = this.search_list.filter(user => user.email == email);
	    	let selecteds =  (this.$store.state.items_json_search !== null) ? this.$store.state.items_json_search : [] ;

	    	if (this.tipe == 'edit') {
    			let store_users = (this.$store.state.items_json_ticket !== null) ? this.$store.state.items_json_ticket : [];
    			let user_selected_store  = store_users.filter(user => user.email == email);
    			if (user_selected_store.length == 0) {
    				this.add_user_event(user_selected,email)
    			}else{
    				swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: `El usuario ${user_selected[0].name} ya esta agregado al ticket!`,
					})
					return;
    			}

    		}
	    	if (this.users_selected.length > 0) {
	    		let users_in_array = this.users_selected.filter(user_selected => user_selected.email == email);
	    		if (users_in_array.length == 0) {
	    			this.add_user_event(user_selected,email)
	    		}
	    	}else{
	    		this.add_user_event(user_selected,email)
	    	} 

	    	this.search_list = null; 
	    	this.search_value = '';
    		this.$store.dispatch('loadItems', this.users_selected);
    		this.$parent.$emit('users_json',this.users_selected);
    	},
    	add_user_event(user,email){

			this.users_selected.push({
    			id:user[0].id,
    			name:user[0].name,
    			email
    		});
		},
    	documentClick(e){
	      	if ($('.items_searchs').is(":visible")) {
	      		this.search_list = null
	      	}
      	},
      	delete_item(key){
      		
      		//this.users_selected.splice(key, 1);
      		this.$store.dispatch('deleteItems',key,this.users_selected)
      	}
    },
    created () {
       document.addEventListener('click', this.documentClick)
    },
    destroyed () {
	   document.removeEventListener('click', this.documentClick)
	},

    components: {

    }
  }

</script>