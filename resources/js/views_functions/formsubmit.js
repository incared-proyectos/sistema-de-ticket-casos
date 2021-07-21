/*
*
*TICKETS INCARED.COM
*BY: PEDRO AVILA
*
*/
//FUNCIONES PARA EL SUBMIT DEL FORMULARIO SERVIRA PARA TODOS LOS FORMULARIOS, VALIDADO CON STATUS 422 PARA OBTENER ERRORES EL VALIDATOR DE LARAVEL 
//CUENTA TAMBIEN CON ERRORES 500 PARA OBTENER ERRORES DE CODIGO 

!function(a){a.ajaxblock=function(content,position='absolute'){a(content).prepend("<div id='ajax-overlay'><div id='ajax-overlay-body' class='center'><i class='fa fa-spinner fa-pulse fa-3x fa-fw'></i><span class='sr-only'>Loading...</span></div></div>"),a("#ajax-overlay").css({position:"absolute",color:"#FFFFFF",top:"0",left:"0",width:"100%",height:"100%",position:position,background:"rgba(39, 38, 46, 0.67)","text-align":"center","z-index":"9999"}),a("#ajax-overlay-body").css({position:"absolute",top:"40%",left:"50%",width:"120px",height:"48px","margin-top":"-12px","margin-left":"-60px","-webkit-border-radius":"10px","-moz-border-radius":"10px","border-radius":"10px"}),a("#ajax-overlay").fadeIn(50)},a.ajaxunblock=function(){a("#ajax-overlay").fadeOut(100,function(){a("#ajax-overlay").remove()})}}(jQuery);
window.addEventListener("load", function(event) {
	let form  = document.getElementById('submit_form');
	if (form === null) {
		return;
	}
	form.addEventListener('submit', (event) => {
	  	let method = $(event.currentTarget).attr('method');
		let url = $(event.currentTarget).attr('action');
		$.ajaxblock(event.currentTarget);

		event.preventDefault();
		axios({
		  method:method,
		  url: url,
		  data: $(event.currentTarget).serialize(),
		})
		.then(function (response) {
		  $.ajaxunblock();
		  $('#errors_form').fadeOut(100);
		  if (typeof response.data.url_location !== 'undefined') {
			  location.href =response.data.url_location
		  }
		  if (typeof response.data.reload !== 'undefined') {
		    $('#table_id').DataTable().ajax.reload();
		    $('#success_form').html(response.data.success).fadeIn(100);
		  }
		  reset_forms();
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
	      	$.ajaxunblock();

		});
	});
	function reset_forms(){
		if ($('.item_select').length) {
			$('.item_select').remove();
		}
		$('#submit_form').trigger("reset"); 
	}
	$(document).on("submit","#updated_form",function(event){
		$.ajaxblock(event.currentTarget);
	  	let method = $(event.currentTarget).attr('method');
		let url = $(event.currentTarget).attr('action');
		event.preventDefault();
		axios({
		  method:method,
		  url: url,
		  data: $(event.currentTarget).serialize(),
		})
		.then(function (response) {
		  $.ajaxunblock();
		  $('#errors_form_update').fadeOut(100);
		  if (typeof response.data.reload !== 'undefined') {
		    $('#table_id').DataTable().ajax.reload();
		  }
		  swal.fire(
			'Actualizacion realizada con exito!',
			'Click para continuar!',
			'success'
		  )
		  $('#editModal').modal('hide');
		})
		.catch(function (error) {
			$('#errors_form_update').html('');
		    if (error.response.status == 422){
	        	$.each(error.response.data.error, function(index, val) {
	        		$('#errors_form_update').append(`<div>* ${val}</div>`).fadeIn(100);
	        	});
	      	}else if (error.response.status == 500) {
	        	alert(error.response.data.message)
	      	}
	      	$.ajaxunblock();
		});
	});
});

