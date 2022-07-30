<template>
    <div>
        <div class="container-img">
            <div class="cont1-img" >
                <img  v-for="item in results"  :key="item.id" :src="`${assetReport}/repository/${user_id}/${item.src_file}`" @click.prevent="selectDetails" alt="">
            </div>

      


        </div>
    </div>
</template>
<script>
export default {
    props:['user_id'],
    data(){
        return{
            results:[],
            assetReport:app_base_asset,

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
        },
        selectDetails(){
            console.log('log')
        }
    }
}
</script>
<style lang="scss" scoped>
    .cont1-img{
        width: 213px;
        height: 160px;   
        display: inline-block;
       
    }
    img{
        width: auto;
        height: auto;
        max-width: 100%;
        max-height: 100%;
        image-orientation: from-image;
        border: 3px solid;
        color: #00000024;
        cursor: pointer;

    }
    img:hover{
        -webkit-box-shadow: -1px -1px 38px -9px rgba(0,0,0,0.63);
        -moz-box-shadow: -1px -1px 38px -9px rgba(0,0,0,0.63);
        box-shadow: -1px -1px 38px -9px rgba(0,0,0,0.63);
         color:yellowgreen;

    }
</style>

