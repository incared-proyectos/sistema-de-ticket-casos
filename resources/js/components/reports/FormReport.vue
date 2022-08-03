<template>
    <div class="col-12" >
        <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-6">
                    <i class="fas fa-atom"></i> Reportes
                </div>
                <div class="col-6 text-right">
                    <a class="btn btn-danger btn-sm" href="#" @click.prevent="deleteReport(keyReport)" ><i class="fas fa-trash"></i></a>
                </div>
            </div>
        </div>
        <div class="card-body">
            <list-repository :resultsList="resultsRepositorys" :key="componentKey" :showModal="showModal"/>

            <div class="row">
                <div class="col-5">
                    <label><b>Titulo:</b></label>
                    <input type="text" class="form-control" placeholder="Titulo de nuestra hoja" v-model="item.title" />
                </div>
                <div class="col-5">
                    <label><b>Pagina:</b></label>
                    <select class="form-control" required v-model="item.page_type">
                        <option value="">Seleccionar...</option>
                        <option value="1">Misma Pagina</option>
                        <option value="2">Salto de Pagina</option>
                    </select>
                </div>
                <div class="col-2">
                    <label for="">Elegir </label>
                    <a class="btn btn-warning btn-block" href="#" @click="selectRepository">Repositorio</a>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-12">
                    <label><b>Descripcion de nuestra hoja:</b></label>
                    <ckeditor  v-model="item.description" :config="editorConfig"></ckeditor>

                </div>
            </div>
            <hr>
            <div class="row">
     
                <div class="col-10">
                    <input type="file" class="form-control" ref="inputfile" multiple  @change.prevent="showPreview" >
                    <hr>

                    <!-- DIRECT CHAT -->
                    <div class="card collapsed-card" v-if="updateFile && item.files.length > 0">
                        <div class="card-header">
                            <h3 class="card-title mb-0"><b>Imagenes Guardadas: </b></h3>

                            <div class="card-tools">
                            <span title="3 New Messages" class="badge badge-primary">{{item.files.length}}</span>
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-plus"></i>
                            </button>
                        
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: none;">
                            <div >
                                <div class="row pb-5">
                                    <div class="col-lg-3 mb-2"  v-for=" (itemImgStore,index) in item.files" :key="index" >
                                        <div id="preview-imgs" class="preview-imgs" >    
                                            <img  class="img-preview img-thumbnail"  :src="`${assetReport}/report/${item.id}/${itemImgStore}`">
                                            <a class="btn btn-danger btn-block" href="#" @click.prevent="deleteImg(index)">ELIMINAR</a>  

                                        </div>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                 
                    </div>
                    <!--/.direct-chat -->
                    
     
                    <div v-if="item.filesData.length > 0">
                        <label for=""><b>Imagenes: </b></label>
                        <div class="row pb-5">
                            <div class="col-lg-3 mb-2"  v-for=" (itemImg,index) in item.filesData" :key="index" >
                                <b>{{itemImg.name}}</b>
                                <div id="preview-imgs" class="preview-imgs" >    
                                    <img  class="img-preview img-thumbnail"  :src="fileObjectURl(itemImg)">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <button class="btn btn-primary btn-block" @click.prevent="resetFiles">Limpiar</button>
                </div>

            </div>
        </div>
        </div>
    </div>
</template>
<script>
    import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
    import ListRepository from '@/components/reports/ListRepository';

    export default {
        props:['item','keyReport','updateFile'],
        components:{
            ListRepository
        },
        data: function() {
            return {
                mensajes: [],
                componentKey:0,
                showModal:false,
                resultsRepositorys:[],
                assetReport:app_base_asset,
                editor: ClassicEditor,
                previewConten:'',
                fileInput:'',

                editorConfig: {
                    link: {
                        addTargetToExternalLinks: true
                    }
                            // The configuration of the editor.
                }

            };
        },
        methods:{
            showPreview(event){

                if(event.target.files.length > 0){
                    var filesAmount = event.target.files.length;
                    for (let index = 0; index < filesAmount; index++) {

                   
                        let fileData = event.target.files[index]
                        
                        this.item.filesData.push(event.target.files[index])

                    }
                }
            },
            selectRepository(){
                this.resultsRepositorys = []

                let me = this;
                axios({
                method: 'GET',
                url: route('repository.list'),
                })
                .then(function (response) {
                    me.resultsRepositorys = response.data
                    me.showModal = true
                    me.componentKey += 1
                    $('#detailListReport').modal('show')
                })
                .catch(function (error) {
                    
                });
            },
            deleteImg(eventIndex){
                let me = this
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
                        let deleteFile = me.item.files[eventIndex]
                        me.item.files.splice(eventIndex,1)
                        axios({
                            method:'POST',
                            url: route('report.updateImg',me.item.id),
                            data:{
                                files:me.item.files,
                                deleteFile
                            }
                        })
                        .then(function (response) {
                            console.log(deleteFile)
                            swal.fire({
                                icon: 'success',
                                title: 'Registro Eliminado con exito',
                                showConfirmButton: true,
                            });
                           // me.reportslines.splice(indexReport,1)


                        })
                    }
                })
              

            },
            fileObjectURl(itemImg){
                return URL.createObjectURL(itemImg) 
            },
            resetFiles(){
                this.item.filesInputImgPreview = []
                this.item.files = []
                this.$refs.inputfile.value = ''
            },
            deleteReport(keyReport){
                this.$emit('keyDelete',keyReport)
            },
            
        }
    }
</script>
<style scoped>
    .preview-imgs{
        width: 250px;
        height: 200px;
    }
    .img-preview{
        width: auto;
        height: auto;
        max-width: 100%;
        max-height: 100%;
        image-orientation: from-image;
    }
</style>