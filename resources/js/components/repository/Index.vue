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
                        <div class="cont1-img"  v-for="(item,index) in results"  :key="item.id">
                            <label for="" class="w-100 mb-0 text-center" style="overflow:hidden;">{{item.original_name}}</label>
                            <a href="#" class="btn btn-danger btn-block btn-sm " @click.prevent="deleteFile(index,item.id)">DELETE</a>
                            <img   :src="typeImg(item)" @click.prevent="getDetail(item.id)" alt="">
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
        typeImg(item){
            
            switch (item.type_file) {
                case 'pdf':
                    return `${app_base_asset_public}/img/pdf_icon.png`
                    break;
                case 'docx':
                    return `${app_base_asset_public}/img/word_icon.png`

                    break;
                default:
                    return `${app_base_asset}/repository/${item.user_id}/${item.src_file}`
                    break;
            }

        },
        uploadsRsp(event){
            
            let me = this
            if(event){
                setTimeout(function(){
                    me.init()
                }, 2000);

            }
        },
        deleteFile(eventIndex,repositoryId){
            swal.fire({
            title: 'Estas seguro?',
            text: "Esta acción es irreversible",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Eliminar!'
        }).then((result) => {
            if (result.isConfirmed) {

            let me = this;
                axios({
                method: 'DELETE',
                url: route('repository.destroy',repositoryId),
                })
                .then(function (response) {
                    me.results.splice(eventIndex,1)
                })
                .catch(function (error) {
                    
                });
            }
        })

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

