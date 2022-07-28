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
                    <div class="col-lg-4">
                        <label for="">Seleccionar empresa</label>
                         <select class="form-control" v-model="empresa_id">
                            <option value="">Seleccionar...</option>
                            <option v-for="item in empresas" :key="item.id" :value="item.id">{{item.name}} {{item.surname}}</option>
                        </select>
                    </div>
                    <div class="col-2 text-right mb-2">
                       
                        <a href="#" class="btn btn-primary" id="addReportForm" @click.prevent="addReport">ADD Reporte</a>

                    </div>

                </div>
                <hr>
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
    props:['empresas'],
    components:{
        FormReport
    },
    data(){
        return{
            empresa_id:'',
         
            reportsLines:[],
            errors:[],
            idtmpGenerate:0

        }
    },
    created(){
        this.addReport()
    },
    methods:{
        addReport(){
            this.idtmpGenerate +=1 

            this.reportsLines.push({
                title:'',
                page_type:1,
                description:'',
                filesData:[]
            })
        },
        deleteReport(event){
            this.reportsLines.splice(event,1)
        },
        saveReport(){
            $.ajaxblock(event.currentTarget);
		   let me = this;
           me.errors = []
            const formData = new FormData()
          


            this.reportsLines.forEach((item,index) => {
                Object.keys(item).forEach(key => {
                    //console.log(key);
                    formData.append(`lines[${index}][${key}]`, item[key]) // note, no square-brackets

                });


                for (var i = 0; i < item.filesData.length; i++) {
                    let file = item.filesData[i];
                    // Here we create unique key 'files[i]' in our response dict
                    formData.append('lines[' + index + '][filesForm][]', file);
                }
            });
            formData.append('empresa_id',this.empresa_id)
		   axios({
			  method: 'POST',
                 headers: {
                    'Content-Type': 'multipart/form-data',
                    Accept: "application/json",

                },
			  url: route('report.store'),
			  data: formData,
            
			
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
