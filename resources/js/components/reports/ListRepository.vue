<template>
    <div>
        <modal-dynamic :showModal="showModal"  witdh="modal-lg">
            <template v-slot:header>
                <b>Listado de repositorios</b>
            </template>
            <div class="row justify-content-center">
                <div class="col-6">
                    <label for="">Buscar Repositorio: </label>
                    <input type="text" class="form-control" @keyup="searchRepository" >
                </div>

            </div>
            <hr>
            <div class="preview-imgs mt-2 mr-2"  v-for=" (itemImg,index) in results.data" :key="index" >    
                <img  :src="fileObjectURl(itemImg)"
                v-clipboard:copy="fileObjectURl(itemImg)"
                v-clipboard:success="onCopy"
                v-clipboard:error="onError">
            </div>
            <hr>
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
        </modal-dynamic>
    </div>
</template>
<script>
import ModalDynamic from '@/Components/ModalDynamic.vue';

export default {
    props:['resultsList','showModal'],
    components:{
        ModalDynamic
    },
    data(){
        return{
            results:this.resultsList
        }
    },
    created(){
        
    },
    methods:{
        fileObjectURl(itemImg){
            switch (itemImg.type_file) {
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
                    return `${app_base_asset}/repository/${itemImg.user_id}/${itemImg.src_file}`

                    break;
            }
          
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
        },
        onCopy: function (e) {
            swal.fire({
                icon: 'success',
                title: 'Exito',
                text: 'Acabas de copiar el siguiente link en el portapapeles: ' + e.text,
            })
        },
        onError: function (e) {
            alert('No se pudo copiar el texto al portapapeles')
        }
    }
}
</script>
<style scoped>
    .preview-imgs{
        width: 215px;
        display: inline-block;
        //border: 2px solid #748b7e30;
    }
    img{
        aspect-ratio: 4/3;
        width:100%;
        object-fit: cover;
        cursor: pointer;
    
    }
    img:hover{
        -webkit-box-shadow: -1px -1px 38px -9px rgba(0,0,0,0.63);
        -moz-box-shadow: -1px -1px 38px -9px rgba(0,0,0,0.63);
        box-shadow: -1px -1px 38px -9px rgba(0,0,0,0.63);
        color:yellowgreen;
    }
</style>