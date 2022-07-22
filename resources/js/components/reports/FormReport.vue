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
                    <input type="text" class="form-control" placeholder="Titulo de nuestra hoja" />
                </div>
                <div class="col-6">
                    <label><b>Pagina:</b></label>
                    <select class="form-control" required>
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
                    <textarea class="form-control"></textarea>
                </div>
            </div>
        </div>
        </div>
    </div>
</template>
<script>
    export default {
        props:['item','keyReport'],
        methods:{
            deleteReport(keyReport){
                this.$emit('keyDelete',keyReport)
            }
        }
    }
</script>