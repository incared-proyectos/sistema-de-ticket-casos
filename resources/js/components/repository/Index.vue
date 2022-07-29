<template>
    <div>
        <div class="container-img">
            <img src="" alt="">
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            results:[]
        }
    },
    created(){
        this.init()
    },
    methods:{
        init(){
		   $.ajaxblock();
		   let me = this;
		   axios({
			  method: 'GET',
			  url: route('repository.list'),
			})
		    .then(function (response) {
                me.results = response.data
		    	$.ajaxunblock();
		    })
		   .catch(function (error) {
			  
		      	$.ajaxunblock();
			});
        }   
    }
}
</script>