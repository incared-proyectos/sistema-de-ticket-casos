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
                    
                    <div class="row justify-content-center">
                        <div class="col-6">
                            <label for="">Buscar Repositorio: </label>
                            <input type="text" class="form-control" @keyup="searchRepository" >
                        </div>

                    </div>
                    <hr>
                    <div class="container-img">
                        <div class="cont1-img mb-4"  v-for="(item,index) in results.data"  :key="item.id">
                            <label for="" class="w-100 mb-0 text-center" style="overflow:hidden;">{{item.original_name}}</label>
                            <a href="#" class="btn btn-danger btn-block btn-sm " @click.prevent="deleteFile(index,item.id)">DELETE</a>
                            <img   :src="typeImg(item)" @click.prevent="getDetail(item.id)" alt="">
                        </div>
                        <div class="alert alert-info" v-if="resultsEmpty">
                            No se encontraron resultados
                        </div>
                        

                        <nav>
                            <ul class="pagination justify-content-center">
                                <li class="page-item" v-show="results['prev_page_url']">
                                    <a href="#" class="page-link" @click.prevent="getPage(0,true,results['prev_page_url'])">
                                        <span>
                                        <span aria-hidden="true">«</span>
                                        </span>
                                    </a>
                                </li>
                                <li class="page-item" :class="{ 'active': (results['current_page']=== n) }" v-for="n in results['last_page']">
                                    <a href="#" class="page-link" @click.prevent="getPage(n)">
                                        <span >
                                            {{ n }}
                                        </span>
                                    </a>
                                </li>
                                <li class="page-item" v-show="results['next_page_url']">
                                    <a href="#" class="page-link" @click.prevent="getPage(0,true,results['next_page_url'])">
                                        <span>
                                        <span aria-hidden="true">»</span>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
              </div>
            </div>
        </div>
        <!--Visualizar imagenes-->
        <modal-detail
        v-if="componentKey > 0"
        :detail="repositoryByDetail"
        :key="componentKey"
        :showModal="showModal"
        @uploadReload="uploadsRsp" ></modal-detail>


        <!--Agregar imagenes-->
        <modal-repositorys-add
        @uploadReload="uploadsRsp" ></modal-repositorys-add>
   
       
    </div>
</template>
<script>
import ModalRepositorysAdd from '@/Components/repository/ModalRepositoryAdd.vue';
import ModalDetail from '@/Components/repository/ModalDetail.vue';
import route from '../../../../vendor/tightenco/ziggy/src/js';

export default {
    props:['user_id'],
    components:{
        ModalRepositorysAdd,ModalDetail
    },
    data(){
        return{
            results:[],
            componentKey:0,
            showModal:false,
            repositoryByDetail:[],
            assetReport:app_base_asset,

        }
    },
    created(){
        this.init()
    },
    computed:{
        resultsEmpty(){
            if (typeof this.results.data !== 'undefined') {
                if(this.results.data.length == 0){
                    return true
                }
            }
            return false
        }
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
                case 'xlsx':
                    return `${app_base_asset_public}/img/excel_icon.png`

                    break;
                case 'zip':
                    return `${app_base_asset_public}/img/zip_icon.png`

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
                    me.results.data.splice(eventIndex,1)
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
                me.componentKey +=1
                me.showModal = true
                $('#detailArchive').modal('show');
		    	$.ajaxunblock();
		    })
		   .catch(function (error) {
			  
		      	$.ajaxunblock();
			});

        },
        init(page){
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
        getPage(page,pageLink = false,pageUrl = null){
            let routeLink = route('repository.list',{page:page})
            if(pageLink){
                routeLink = pageUrl
            }
            let me = this
             axios({
			  method: 'GET',
			  url: routeLink,
			})
		    .then(function (response) {
                me.results = response.data
                console.log(response)

		    }).catch(function (error) {
			  
			});
		 
        },
        searchRepository(event){
            let searchInput = event.currentTarget.value
            let me = this
            axios({
			  method: 'GET',
			  url: route('repository.list',{searchname:searchInput}),
			})
		    .then(function (response) {
                me.results = response.data

		    }).catch(function (error) {
			  
			});
        }
       
    
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

