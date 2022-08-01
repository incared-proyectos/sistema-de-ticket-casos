<template>
    <div>
        <form action="">
            <div class="row">
                <div class="col-10">
                    <input type="file" class="form-control" ref="inputfile" multiple  @change.prevent="showPreview" >
            
                </div>
                <div class="col-2">
                    <a href="#" class="btn btn-success btn-block " @click.prevent="fileUploadProcess">SUBIR</a>

                </div>
            </div>
            <div class="row mb-2 mt-2">
                <div class="col-12 ">
                    <div class="alert alert-info">
                        Seleccione las imagenes a subir     
                    </div>
                </div>
            </div>
            <div v-if="filesData.length > 0">
                <div class=" preview-imgs mt-2 mr-2"  v-for=" (itemImg,index) in filesData" :key="index" >
                    <a href="#" class="btn btn-danger btn-block btn-sm " @click.prevent="deleteFile(index)">DELETE</a>
                    <img  :src="fileObjectURl(itemImg)">
                    <br/>
                    <div class="progress progress-sm " v-if="!processFile(itemImg.idFile).uploadError" >
                        <div class="progress-bar bg-success progress-bar-striped" role="progressbar"
                            :aria-valuenow="processFile(itemImg.idFile).uploadPercent" aria-valuemin="0" aria-valuemax="100" :style="`width: ${processFile(itemImg.idFile).uploadPercent}%`">
                            {{processFile(itemImg.idFile).uploadPercent}}% Completado (success)
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
            processFiles:[]
        }
    },
    methods:{
        fileObjectURl(itemImg){
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
        },
        async fileUploadProcess(){

            let fileTot = 0;
            for (var i = 0; i < this.filesData.length; i++) {
                // Here we create unique key 'files[i]' in our response dict
                let resultFile = await  this.submitFile(i)
                fileTot +=1

            }
            if(fileTot ==  this.filesData.length){
                console.log(fileTot)
                this.$emit('uploadSuccess',true)
            }
           
            //console.log(countSuccess)
        },
        async submitFile(file){
       
            let formData = new FormData();
            let processFileChange = this.processFiles.find(item => item.idFile ===  this.filesData[file].idFile)
            if(processFileChange.upload ){
                console.log('este archivo ya se subio ')
                return;
            }

            formData.append('file', this.filesData[file]);
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

            })
            .catch(function(){
                processFileChange.uploadPercent = 0
                processFileChange.upload = false
                processFileChange.uploadError = true
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
        height: 160px;   
        display: inline-block;
        border: 2px solid #748b7e30;
    }
    img{
        aspect-ratio: 4/3;
        width:100%;
        object-fit: cover;
    
    }
</style>