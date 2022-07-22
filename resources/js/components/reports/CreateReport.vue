<template>
    <div>
        <!-- Main content -->
        <div class="content mt-2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    <button class="btn btn-success">Guardar Reporte</button>
                </div>
                <div class="col-6 text-right mb-2">
                    <a href="#" class="btn btn-primary" id="addReportForm" @click.prevent="addReport">ADD Reporte</a>

                </div>

            </div>
            <div class="row" id="content-reports">
                <form-report v-for="(item,index) in reportsLines" 
                :key="index" 
                :item="item" 
                :keyReport="index" 
                @keyDelete="deleteReport"></form-report>
            </div>
        </div><!-- /.container-fluid -->
        </div>
    </div>
</template>
<script>
import FormReport from '@/Components/reports/FormReport.vue';
export default {
    components:{
        FormReport
    },
    data(){
        return{
            reportsLines:[]
        }
    },
    created(){
        this.addReport()
    },
    methods:{
        addReport(){
            this.reportsLines.push({
                title:'',
                type_page:1,
                descripcion:'',
            })
        },
        deleteReport(event){
            this.reportsLines.splice(event,1)
        }
    }
}
</script>
