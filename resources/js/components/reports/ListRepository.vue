<template>
    <div>
        <div class="modal fade" id="detailListReport" tabindex="-1" role="dialog" aria-labelledby="detailListReportLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="detailListReportLabel"><b>Listado de repositorio</b></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="preview-imgs mt-2 mr-2"  v-for=" (itemImg,index) in resultsList" :key="index" >    
                        <img  :src="fileObjectURl(itemImg)">
                    </div>

                </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props:['resultsList'],
    methods:{
        fileObjectURl(itemImg){
            switch (itemImg.type_file) {
                case 'pdf':
                    return `${app_base_asset_public}/img/pdf_icon.png`
                    break;
                case 'docx':
                    return `${app_base_asset_public}/img/word_icon.png`
                    break;
                default: 
                    return `${app_base_asset}/repository/${itemImg.user_id}/${itemImg.src_file}`

                    break;
            }
          
        },
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