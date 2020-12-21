<template>
	<div>
		<div class="table-responsive">

			<table id="table_id" class="table table-bordered table-striped dataTable">
			    <thead>
			        <tr>
			            <th v-for="items in head">{{ items }} </th>
			        </tr>
			    </thead>
			    <tbody>
			   
			    </tbody>
			</table>
		</div>
	</div>
</template>
<script>
export default {
	props: ['columns','head','id_filter','tipe'],
    data: function() {
      return {
        data: [],
      };
    },
    created() {
      this.isLoading = true;
    },
    mounted(){
    	this.getDatos();
    },

    methods: {
      reload(){
        $('#table_id').DataTable().ajax.reload();
      },
      getDatos(){
   		let me = this;
        $(function () {
		    //$('#table_id').DataTable();
		    if (base_url_http !== '') {
			    $('#table_id').DataTable({
				    processing: true,
				    serverSide: true,
				    ajax: {
				        url: `${base_url_http}`,
				        dataSrc: "data",
				        type: "GET",
				        "data":function (d) {
				        	d.id_filter = me.id_filter
				        	d.tipe = me.tipe
		                },
				        error: function(jqXHR, ajaxOptions, thrownError) {
				        	alert(thrownError)
				        	alert(jqXHR)
				        	console.log(`${jqXHR}  &&&&  ${ajaxOptions} &&&& ${thrownError}`)
				      	},
				    },
				    columns: me.columns,
				    'createdRow': function( row, data, dataIndex ) {
						if (data.fecha_caducidad === 'Caducado') {
				    		$(row).attr('class','alert-danger-status')
				    	}
			            $(row).attr( 'id','codenv'+data.id );
			        }
				});
			}
		});
      },
    },
    components: {

    }
  }
</script>



