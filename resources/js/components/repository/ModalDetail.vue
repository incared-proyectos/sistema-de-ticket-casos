<template>

    <modal-dynamic :showModal="showModal"  witdh="modal-lg">
        <template v-slot:header>
            <b>Detalles de archivo {{detail.original_name}}</b>
        </template>
        <div class="alert alert-success rsp-success" v-if="rps_success !== ''">{{rps_success}}</div>
        <form action="" id="detailForm"  @submit.prevent="submitSave">
            <div class="row">
                <div class="col-12">
                    <label for=""><b>URL Archivo </b> </label>

                    <input type="text" class="form-control" :value="`${assetUrl}/repository/${detail.user_id}/${detail.src_file}`"  readonly>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-12">
                    <label for=""><b>Nombre del archivo </b> </label>

                    <input type="text" class="form-control" v-model="detail.original_name">
                </div>
            </div>
            <hr>
            <input type="file" class="form-control" ref="inputfile" multiple  @change.prevent="showPreview"  >

            <img  :src="srcImg" ref="imgDetail" alt="">
            <div v-if="detail.type_file_case !== 'img'" v-html="detailActions(detail)" class="text-center mt-2">
  
            </div>
            <hr>
            <div class="row">
                <div class="col-12 text-center">
                    <button class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </form>
    </modal-dynamic>
           
      
</template>
<script>
import ModalDynamic from '@/Components/ModalDynamic.vue';

export default {
    props:['detail','showModal'],
    components:{
        ModalDynamic
    },
    data(){
        return{
            assetUrl:app_base_asset,
            fileData:'',
            srcImg:(this.detail.user_id !== undefined) ? `${app_base_asset}/repository/${this.detail.user_id}/${this.detail.src_file}` : '',
            rps_success:''
        }
    },
  
    methods:{
        detailActions(detail){
            switch (detail.type_file) {
                case 'pdf':

                        return `
                            <a href="https://docs.google.com/viewer?url=${app_base_asset}/repository/${detail.user_id}/${detail.src_file}" class="btn btn-danger"><i class="fas fa-eye"></i> Ver</a>
                            <a href="${app_base_asset}/repository/${detail.user_id}/${detail.src_file}" target="_blank" class="btn btn-danger"><i class="fas fa-download"></i> Descargar</a>
                        `
                    break;
            
                default:
                    return `<a href="${app_base_asset}/repository/${detail.user_id}/${detail.src_file}" target="_blank" class="btn btn-primary"><i class="fas fa-download"></i> Descargar</a>`  
                    break;
            }
        },
        showPreview(event){
            if(event.target.files.length > 0){
                this.fileData = event.target.files[0]
                this.srcImg = URL.createObjectURL(event.target.files[0]) 
            }
            //this.$refs.inputfile.value = ''
        },
        submitSave(event){
            $.ajaxblock(event.currentTarget);
            this.rps_success = ''
            let formData = new FormData();
            let me = this
            Object.keys(this.detail).forEach(key => {
                //console.log(key);
                formData.append(key, this.detail[key]) // note, no square-brackets

            });             
            
            formData.append('file', this.fileData);
              axios.post( route('repository.update',this.detail.id),
                formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    },
                }
            ).then(function(){
                $.ajaxunblock()
                me.rps_success = 'Repositorio actualizado con exito'
                
                me.detail.original_name = me.fileData.name
                me.$emit('uploadReload',true)
          

            })
            .catch(function(error){
                $.ajaxunblock()
            });


        }
    }
    
}
</script>
<style scoped>
img{
    width: 100%;
}
</style>