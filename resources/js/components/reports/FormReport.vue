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
            <div class="row">
                <div class="col-6">
                    <label><b>Titulo:</b></label>
                    <input type="text" class="form-control" placeholder="Titulo de nuestra hoja" v-model="item.title" />
                </div>
                <div class="col-6">
                    <label><b>Pagina:</b></label>
                    <select class="form-control" required v-model="item.page_type">
                        <option value="">Seleccionar...</option>
                        <option value="1">Misma Pagina</option>
                        <option value="2">Salto de Pagina</option>
                    </select>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-12">
                    <label><b>Descripcion de nuestra hoja:</b></label>
                    <ckeditor :editor="editor" v-model="item.description" :config="editorConfig"></ckeditor>

                </div>
            </div>
        </div>
        </div>
    </div>
</template>
<script>
    import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

    export default {
        props:['item','keyReport'],
        data: function() {
            return {
                mensajes: [],

                editor: ClassicEditor,
    
                editorConfig: {
                            // The configuration of the editor.
                }

            };
        },
        methods:{
            deleteReport(keyReport){
                this.$emit('keyDelete',keyReport)
            }
        }
    }
</script>