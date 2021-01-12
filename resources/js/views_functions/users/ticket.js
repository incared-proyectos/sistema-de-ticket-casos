window.addEventListener("load", function(event) {
	$(document).on("click",".row_edit_ticket",function(event){
		$.ajaxblock('body','fixed');
		let url = $(this).attr('data-url');
		event.preventDefault();
		axios({
		  method:'GET',
		  url: url,
		})
		.then(function (response) {
			$.ajaxunblock();
		 	$('#titulo_input').val(response.data.titulo);
		 	$('.user_input').val('');

		 	$('#datetimepicker_edit').val(response.data.fecha_caducidad);
		 	$('.options_selects_category').html('');
		 	$('.options_selects_category').append(`<input type="hidden" id="check_categories" name="check_categories_log" value="0">`)
		 	$.each(response.data.categorias, function(index, val) {
                $('.options_selects_category').append(`<span class="item_select" id="item_update${val.id}"><input type="hidden" name="categorias[]" value="${val.id}"><i class="fab fa-adn"></i> ${val.nombre} <a href="#" class="delete_select text-white" data-id="${val.id}"><i class="far fa-trash-alt"></i></a></span>`);
		 	});
		 	$('#descripcion_edit').val(response.data.descripcion);
		 	let form_action = $('#updated_form').attr('data-action');
		 	$('#updated_form').attr('action',`${form_action}/${response.data.id}`);
		 	$('#user_selected').html(response.data.users.name);
		 	$('#editModal').modal('show');

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
});