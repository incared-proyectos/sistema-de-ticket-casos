<template>
    <div>
        <!-- Main content -->
        <div class="content mt-2">
        <div class="container-fluid">
            <div v-if="errors.length > 0" class="alert alert-danger">
	      		<p v-for="item in errors" class="mb-0">*{{item.val}}</p>
	      	</div>
            <form  @submit.prevent="saveReport">
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
            </form>
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
            reportsLines:[],
            errors:[]

        }
    },
    created(){
        this.addReport()
    },
    methods:{
        addReport(){
            this.reportsLines.push({
                title:'',
                page_type:1,
                description:'',
            })
        },
        deleteReport(event){
            this.reportsLines.splice(event,1)
        },
        saveReport(){
            $.ajaxblock(event.currentTarget);
		   let me = this;
           me.errors = []
		   axios({
			  method: 'POST',
			  url: route('report.store'),
			  data: {lines:me.reportsLines},
			
			})
		    .then(function (response) {
		  
                location.href = route('report.index')
		    	$.ajaxunblock();
		    })
		   .catch(function (error) {
			    if (error.response.status == 422){
                    console.log(error.response.data.errors)
		        	$.each(error.response.data.errors, function(index, item) {
                        $.each(item, function(key, val) {
                            me.errors.push({
                                val
                            })
                        })
		        	});
		      	}else if (error.response.status == 500) {
		        	alert(error.response.data.message)
		      	}
		      	$.ajaxunblock();
			});

        }
    }
}
</script>
