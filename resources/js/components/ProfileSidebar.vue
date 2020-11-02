<template>
	<div>
	   <div class="user-panel mt-3 pb-3 mb-3 d-flex">
		    <div class="image">
		      <img :src="img"  class="img-circle elevation-2 profile-img" alt="User Image">
		    </div>
		    <div class="info">
		      <a href="#" class="d-block">{{name}}</a>
		    </div>
		    <div class="info" style="position: absolute; right: 0px;">
		      <a href="#" class="d-block" data-toggle="modal" data-target="#editProfileModal"><i class="fas fa-edit"></i></a>
		    </div>
	 	</div>
				
  </div>
</template>

<script>
export default {
	props: ['name','img'],
    data: function() {
      return {
        data: [],
      };
    },
    created() {
      this.isLoading = true;
    },
    mounted(){
    	//this.getDatos();
    },

    methods: {


    },
    components: {

    }
  }

</script>