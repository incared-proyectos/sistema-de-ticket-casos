window.addEventListener("load", function(event) {
	$(document).on("click",".row_edit",function(event){
		$.ajaxblock('body','fixed');
		let url = $(this).attr('data-url');
		event.preventDefault();
		axios({
		  method:'GET',
		  url: url,
		})
		.then(function (response) {
			$.ajaxunblock();
		 	$('#response_edit').html(response.data);
		 	$('#editModal').modal('show');
		 	if ($('.datetimepicker').length > 0) {
			 	$('.datetimepicker').datetimepicker({
			        format: 'YYYY-MM-DD HH:mm',
			        sideBySide: true,
			        Default: false,
			        locate: 'it'
			    });
		 	}
		})	
		.catch(function (error) {
			$('#errors_form').html('');
		    if (error.response.status == 422){
	        	$.each(error.response.data.error, function(index, val) {
	        		$('#errors_form').append(`<div>* ${val}</div>`).fadeIn(100);
	        	});
	      	}else if (error.response.status == 500) {
	        	alert(error.response.data.message)
	      	}
		});
	});
	$(document).on("click",".row_status",function(event){
		$.ajaxblock('body','fixed');
		let url = $(this).attr('data-url');
		let id_ticket = $(this).attr('data-ticket');
		let id_status = $(this).attr('data-id');
		event.preventDefault();
		axios({
		  method:'POST',
		  url: url,
		  data:{
		  	id_ticket,
		  	id_status,

		  }
		})
		.then(function (response) {
			$('#table_id').DataTable().ajax.reload();
			$.ajaxunblock();
		})	
		.catch(function (error) {
			$('#errors_form').html('');
		    if (error.response.status == 422){
	        	$.each(error.response.data.error, function(index, val) {
	        		$('#errors_form').append(`<div>* ${val}</div>`).fadeIn(100);
	        	});
	      	}else if (error.response.status == 500) {
	        	alert(error.response.data.message)
	      	}
		});
	});

	$(document).on("click",".row_delete",function(event){
		event.preventDefault();
		swal.fire({
		  title: 'Estas seguro?',
		  text: "Esta acción es irreversible",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Si, Eliminar!'
		}).then((result) => {
		  if (result.isConfirmed) {
	
				let id_row = $(this).attr('data-id');
				let url = $(this).attr('data-url');
			    axios({
				  method:'DELETE',
				  url: url,
				})
				.then(function (response) {
					swal.fire({
					  icon: 'success',
					  title: 'Registro Eliminado con exito',
					  showConfirmButton: true,
					});
					$(`#codenv${id_row}`).remove();
				    $('#table_id').DataTable().ajax.reload();
				})	
				.catch(function (error) {
					$('#errors_form').html('');
				    if (error.response.status == 422){
			        	$.each(error.response.data.error, function(index, val) {
			        		$('#errors_form').append(`<div>* ${val}</div>`).fadeIn(100);
			        	});
			      	}else if (error.response.status == 500) {
			        	alert(error.response.data.message)
			      	}
				});
			}
		})
	});
});