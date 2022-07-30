<template>
    <div>
        <form action="">
            <div class="row">
                <div class="col-10">
                    <input type="file" class="form-control" ref="inputfile" multiple  @change.prevent="showPreview" >
            
                </div>
                <div class="col-2">
                    <button class="btn btn-success btn-block ">SUBIR</button>

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
                    <div class="progress progress-sm ">
                        <div class="progress-bar bg-success progress-bar-striped" role="progressbar"
                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            <span class="sr-only">40% Complete (success)</span>
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
            filesData:[]
        }
    },
    methods:{
        fileObjectURl(itemImg){
            return URL.createObjectURL(itemImg) 
        },
        showPreview(event){
            if(event.target.files.length > 0){
                var filesAmount = event.target.files.length;
                for (let index = 0; index < filesAmount; index++) {

                
                    let fileData = event.target.files[index]
                    
                    this.filesData.push(event.target.files[index])

                }
            }
        },
        deleteFile(event){
            this.filesData.splice(event,1)
        }
    }
}
</script>
<style scoped>
    .preview-imgs{
        height: 160px;   
        display: inline-block;
        border: 2px solid #748b7e30;
    }
    img{
        width: auto;
        height: auto;
        max-width: 100%;
        max-height: 100%;
        image-orientation: from-image;
    
    }
</style>