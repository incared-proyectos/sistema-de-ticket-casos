/*
*
*TICKETS INCARED.COM
*BY: PEDRO AVILA
*
*/
// EVENTOS CLICK PARA LA SELECCION DE PERMISOS EN USUARIOS DE ESTA FORMA OBTENEMOS EL PERMISO Y PODEMOS TAMBIEN ELIMINARLO POR SU ID
window.addEventListener("load", function(event) {
	let url_actual = window.location.href;
	if (url_actual.indexOf('usuarios') !== -1 || url_actual.indexOf('tickets') !== -1 )  {
		//Para  la plantilla de  add 
		$(document).on("change","#change_select",function(event){
			let id_select = $(this).find('option:selected').attr('data-id');
			let name_select = $(this).val();
			if ($(`#item${id_select}`).length <= 0 && name_select !== '' ) {
				$('#options_select').append(` 
					<span class="item_select" id="item${id_select}"><input type="hidden" name="categorias[]" value="${id_select}"><i class="fab fa-adn"></i> ${name_select} <a href="#" class="delete_select text-white" data-id="${id_select}""><i class="far fa-trash-alt"></i></a></span>
				`);
			}
		});

		$(document).on("change","#change_select_permissions",function(event){
			let id_select = $(this).find('option:selected').attr('data-id');
			let name_select = $(this).val();
			if ($(`#item_permiso${id_select}`).length <= 0 && name_select !== '' ) {
				$('#options_select_permission').append(` 
					<span class="item_select" id="item_permiso${id_select}"><input type="hidden" name="permisos[]" value="${name_select}"><i class="fab fa-adn"></i> ${name_select} <a href="#" class="delete_select_permisos text-white" data-id="${id_select}""><i class="far fa-trash-alt"></i></a></span>
				`);
			}
		});
		$(document).on("change","#change_select_permissions_update",function(event){
			let id_select = $(this).find('option:selected').attr('data-id');
			let name_select = $(this).val();
			if ($(`#item_update_permiso${id_select}`).length <= 0 && name_select !== '' ) {
				$('#options_select_permission_update').append(` 
					<span class="item_select" id="item_permiso${id_select}"><input type="hidden" name="permisos[]" value="${name_select}"><i class="fab fa-adn"></i> ${name_select} <a href="#" class="delete_select_permisos text-white" data-id="${id_select}""><i class="far fa-trash-alt"></i></a></span>
				`);
			}
		});
		//Para  la plantilla de  updated
		$(document).on("change","#change_select_updated",function(event){
			let id_select = $(this).find('option:selected').attr('data-id');
			let name_select = $(this).val();
			//$('#check_categories').val(1);
			if ($(`#item_update${id_select}`).length <= 0 && name_select !== '') {
				$('#options_select_updated').append(` 
					<span class="item_select" id="item_update${id_select}"><input type="hidden" name="categorias[]" value="${id_select}"><i class="fab fa-adn"></i> ${name_select} <a href="#" class="delete_select text-white" data-id="${id_select}""><i class="far fa-trash-alt"></i></a></span>
				`);
			}
		});


		$(document).on("click", ".delete_select_permisos",function(event){
			let id_select = $(this).attr('data-id');
			event.preventDefault();
			if ($(`#item_permiso${id_select}`).length > 0) {
				$(`#item_permiso${id_select}`).remove();
			}else if ($(`#item_update_permiso${id_select}`).length > 0) {
				//$('#check_categories').val(1);
				$(`#item_update_permiso${id_select}`).remove();
			}else{
				//$(`#check_categories`).remove();

			}
		});
		//Para eliminar los items seleccionados de permisos 
		$(document).on("click",".delete_select",function(event){
			let id_select = $(this).attr('data-id');
			event.preventDefault();
			if ($(`#item${id_select}`).length > 0) {
				$(`#item${id_select}`).remove();
			}else if ($(`#item_update${id_select}`).length > 0) {
				$('#check_categories').val(1);
				$(`#item_update${id_select}`).remove();
			}else{
				$(`#check_categories`).remove();

			}
		});
	}
	$(document).on("click",".sidebarchange",function(event){
		axios({
		  method: 'get',
		  url: `${app_base_url}/perfil/sidebar`,
		})
	    .then(function (response) {
  		

	    })
	   .catch(function (error) {
		    if (error.response.status == 422){
	        	$.each(error.response.data.error, function(index, val) {
	        		me.errors.push({
	        			val
	        		})
	        	});
	      	}else if (error.response.status == 500) {
	        	alert(error.response.data.message)
	      	}
		});
	});

});