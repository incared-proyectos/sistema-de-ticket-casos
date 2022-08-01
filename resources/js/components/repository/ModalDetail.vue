<template>
    <div class="modal fade" id="detailArchive" tabindex="-1" role="dialog" aria-labelledby="detailArchiveLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailArchiveLabel"><b>Detalles de archivo {{detail.original_name}}</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <label for=""><b>URL Archivo </b> </label>

                        <input type="text" class="form-control" :value="`${assetUrl}/repository/${detail.user_id}/${detail.src_file}`">
                    </div>
                </div>
                <hr>
                <img :src="`${assetUrl}/repository/${detail.user_id}/${detail.src_file}`" alt="">
            </div>
            </div>
        </div>
    </div>
</template>
<script>

export default {
    props:['detail'],
    data(){
        return{
            assetUrl:app_base_asset,

        }
    }
    
}
</script>
<style scoped>
img{
    width: 100%;
}
</style>