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
	props: ['columns','head','id_filter','tipe','estatus'],
    data: function() {
      return {
        data: [],
        status_active:'',
        instance_datatable:null,
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

		    	    // Setup - add a text input to each footer cell
			    $('#table_id thead tr').clone(true).appendTo( '#table_id thead' );
			    $('#table_id thead tr:eq(1) th').each( function (i) {
			        var title = $(this).text();
			        $(this).html( '<input type="text" placeholder="Buscar '+title+'" />' );
			 
			        $( 'input', this ).on( 'keyup change', function () {
			            if ( me.instance_datatable.column(i).search() !== this.value ) {
			                me.instance_datatable
			                    .column(i)
			                    .search( this.value )
			                    .draw();
			            }
			        } );
			    } );
			 
			    
			    me.instance_datatable = $('#table_id').DataTable({
			    	orderCellsTop: true,
       				fixedHeader: true, 
				    processing: true,
				    serverSide: true,
				    ajax: {
				        url: `${base_url_http}`,
				        dataSrc: "data",
				        type: "GET",
				        "data":function (d) {
				        	d.id_filter = me.id_filter
				        	d.tipe = me.tipe
				        	d.status = me.status_active
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
				    	if (data.status === 'Realizado' || data.status === 'Completado') {
				    		$(row).attr('class','alert-success-status')
				    	}
			            $(row).attr( 'id','codenv'+data.id );
			        },
			        "order": [[ 0, "desc" ]]

				});


			

			}
		});
      },
      filter_datatable(){
      	this.instance_datatable.ajax.reload();
      },
      reset_datatable(){
      	this.status_active = '';
      	this.instance_datatable.ajax.reload();
      },
      getLinkParse(){
		var cells = [];
        var rows = $("#table_id").dataTable().fnGetNodes();
        for(var i=0;i<rows.length;i++)
        {
            // Get HTML of 3rd column (for example)
   
            cells.push(rowd); 
        }
        console.log(cells);
      }
    },
    components: {

    }
  }
</script>



