<template>
    <div>

        <div class="row mb-2">
          <div class="col-12 text-right">
                <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addArchives">
              Agregar Archivos
            </button>
          </div>
          
        </div>
        <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                   <i class="fas fa-atom"></i> Repositorio de archivos
                </div>
                <div class="card-body">

                    <div class="container-img">
                        <div class="cont1-img"  v-for="item in results"  :key="item.id">
                            <img   :src="`${assetReport}/repository/${user_id}/${item.src_file}`" @click.prevent="getDetail(item.id)" alt="">
                        </div>

                    </div>
                </div>
              </div>
            </div>
        </div>
        <!--Visualizar imagenes-->
        <modal-detail
        :detail="repositoryByDetail" ></modal-detail>


        <!--Agregar imagenes-->
        <modal-repositorys-add
        @uploadReload="uploadsRsp" ></modal-repositorys-add>
   
       
    </div>
</template>
<script>
import ModalRepositorysAdd from '@/Components/repository/ModalRepositoryAdd.vue';
import ModalDetail from '@/Components/repository/ModalDetail.vue';

export default {
    props:['user_id'],
    components:{
        ModalRepositorysAdd,ModalDetail
    },
    data(){
        return{
            results:[],
            repositoryByDetail:[],
            assetReport:app_base_asset,

        }
    },
    created(){
        this.init()
    },
    methods:{
        uploadsRsp(event){
            
            let me = this
            if(event){
                setTimeout(function(){
                    me.init()
                }, 2000);

            }
        },
        getDetail(repositoryId){
            this.repositoryByDetail = []

            $.ajaxblock();
		   let me = this;
		   axios({
			  method: 'GET',
			  url: route('repository.getById',repositoryId),
			})
		    .then(function (response) {
                me.repositoryByDetail = response.data
                console.log(response)
                $('#detailArchive').modal('show');
		    	$.ajaxunblock();
		    })
		   .catch(function (error) {
			  
		      	$.ajaxunblock();
			});

        },
        init(){
		   $.ajaxblock();
		   let me = this;
		   axios({
			  method: 'GET',
			  url: route('repository.list'),
			})
		    .then(function (response) {
                me.results = response.data
                console.log(me.results)
		    	$.ajaxunblock();
		    })
		   .catch(function (error) {
			  
		      	$.ajaxunblock();
			});
        },
    
    }
}
</script>
<style lang="scss" scoped>
    .cont1-img{
        width: 213px;
        height: 160px;   
        display: inline-block;
        margin: 5px;

    }
    img{
        aspect-ratio: 4/3;
        width:100%;
        object-fit: cover;
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

