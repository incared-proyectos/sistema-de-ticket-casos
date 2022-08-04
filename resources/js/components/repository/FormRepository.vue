<template>
    <div>
        <form action="">
            <div class="row">
                <div class="col-10">
                    <input type="file" class="form-control" ref="inputfile" multiple  @change.prevent="showPreview"  >
            
                </div>
                <div class="col-2">
                    <a href="#" class="btn btn-success btn-block " @click.prevent="fileUploadProcess" :disabled="messageSubmit ? true : false ">SUBIR</a>

                </div>
            </div>
            <div class="row mb-2 mt-2">
                <div class="col-12 ">
                    <div class="alert alert-info">
                        Seleccione las imagenes a subir     
                    </div>
                </div>
            </div>
            <div class="alert alert-info" v-if="messageSubmit">
                Subiendo imagenes un momento por favor....
            </div>
            <div v-if="errors.length > 0" class="alert alert-danger">
	      		<p v-for="(item,index) in errors" :key="index" class="mb-0">*{{item.item}}</p>
	      	</div>
            <div v-if="filesData.length > 0">
                <div class=" preview-imgs mt-2 mr-2"  v-for=" (itemImg,index) in filesData" :key="index" >
                    <label for="" class="w-100 mb-0 text-center" style="overflow:hidden;">{{itemImg.name}}</label>
                    <a href="#" class="btn btn-danger btn-block btn-sm " @click.prevent="deleteFile(index)">DELETE</a>
                    <img  :src="fileObjectURl(itemImg)">
                    <br/>
                    <div class="progress progress-sm " v-if="!processFile(itemImg.idFile).uploadError" >
                        <div class="progress-bar bg-success progress-bar-striped" role="progressbar"
                            :aria-valuenow="processFile(itemImg.idFile).uploadPercent" aria-valuemin="0" aria-valuemax="100" :style="`width: ${processFile(itemImg.idFile).uploadPercent}%`">
                            {{processFile(itemImg.idFile).uploadPercent}}% Completado (success)
                        </div>
                    </div>
                    <div class="progress progress-sm " v-if="processFile(itemImg.idFile).uploadError" >
                        <div class="progress-bar bg-danger progress-bar-striped" role="progressbar"
                            :aria-valuenow="processFile(itemImg.idFile).uploadPercent" aria-valuemin="0" aria-valuemax="100" :style="`width: 100%`">
                            Error
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</template>
<script>

export default {
    data(){
        return{
            idFile:0,
            filesData:[],
            processFiles:[],
            errors:[],
            assetPublic:app_base_asset,
            filesTotSuccess:0,
            messageSubmit: false

        }
    },
    methods:{
        fileObjectURl(itemImg){
            switch (itemImg.type) {
                case 'application/pdf':
                    return `${app_base_asset_public}/img/pdf_icon.png`
                    break;
                case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
                    return `${app_base_asset_public}/img/word_icon.png`
                    break;
                case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
                    return `${app_base_asset_public}/img/excel_icon.png`
                    break;

                case 'application/x-zip-compressed':
                    return `${app_base_asset_public}/img/zip_icon.png`
                    break;
                default: 
                    break;
            }
            return URL.createObjectURL(itemImg) 
        },
        processFile(idFile){
            let processFile = this.processFiles.find(item => item.idFile === idFile)
            return processFile
        },
        showPreview(event){
            if(event.target.files.length > 0){
                var filesAmount = event.target.files.length;
                for (let index = 0; index < filesAmount; index++) {
                    
                    let idFile = this.idFile +=1
                    let fileData = event.target.files[index]
                    event.target.files[index].idFile = idFile
                    
                    this.filesData.push(event.target.files[index])
                    this.processFiles.push({
                        idFile:idFile,
                        uploadPercent:0,
                        upload:false,
                        uploadError:false
                    })

                }
            }
            this.$refs.inputfile.value = ''
        },
        async fileUploadProcess(){


            this.messageSubmit = true
            for (var i = 0; i < this.filesData.length; i++) {
                // Here we create unique key 'files[i]' in our response dict
                await  this.submitFile(i)

            }
          
        },
        async submitFile(file){
            this.errors = []

            let formData = new FormData();
            let processFileChange = this.processFiles.find(item => item.idFile ===  this.filesData[file].idFile)
            if(processFileChange.upload ){
                return;
            }
             
            formData.append('file', this.filesData[file]);
            let me = this
            axios.post( route('repository.store'),
                formData,
                {
                headers: {
                    'Content-Type': 'multipart/form-data'
                },
                onUploadProgress: function( progressEvent ) {
                    processFileChange.uploadPercent = 50;

                }.bind(this)
                }
            ).then(function(){
                processFileChange.uploadPercent = 100
                processFileChange.upload = true
                processFileChange.uploadError = false
                me.filesTotSuccess += 1
                
                if(me.filesData.length == me.filesTotSuccess){
                    me.$emit('uploadSuccess',true)
                    me.messageSubmit = false

                }

                

            })
            .catch(function(error){
                processFileChange.uploadPercent = 0
                processFileChange.upload = false
                processFileChange.uploadError = true
                if (error.response.status == 422){
                   
		        	$.each(error.response.data.errors, function(index, item) {
                       
                            me.errors.push({
                                item
                            })
                        
		        	});
		      	}else if (error.response.status == 500) {
		        	alert(error.response.data.message)
		      	}
            });
        },
        deleteFile(event){
            this.filesData.splice(event,1)
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
    
    }
</style>