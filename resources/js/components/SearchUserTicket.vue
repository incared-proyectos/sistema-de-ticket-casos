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
	</div>
</template>

<script>
export default {
	props: ['user','user_img','img_default'],
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
	    	this.search_list = null; 
    	},
    	documentClick(e){
	      	if ($('.items_searchs').is(":visible")) {
	      		this.search_list = null
	      	}
      	},
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