<template>
    <div class="modal fade" id="addArchives" tabindex="-1" role="dialog" aria-labelledby="addArchivesLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addArchivesLabel">Agregar Archivos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <repository-form
                @uploadSuccess="uploadRsp"></repository-form>
            </div>
            </div>
        </div>
    </div>
</template>
<script>
import RepositoryForm from '@/Components/repository/FormRepository.vue';

export default {
    components:{
        RepositoryForm
    },
    methods:{
        uploadRsp(event){
            this.$emit('uploadReload',true)
        }
    }
    
}
</script>