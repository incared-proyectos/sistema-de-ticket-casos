/*
*
*TICKETS INCARED.COM
*BY: PEDRO AVILA
*
*/
// EVENTOS CLICK PARA LA SELECCION DE PERMISOS EN USUARIOS DE ESTA FORMA OBTENEMOS EL PERMISO Y PODEMOS TAMBIEN ELIMINARLO POR SU ID
window.addEventListener("load", function(event) {
	let url_actual = window.location.href;
	if (url_actual.indexOf('usuarios') !== -1)  {
		//Para  la plantilla de  add 
		$(document).on("change","#change_select",function(event){
			let id_select = $(this).find('option:selected').attr('data-id');
			let name_select = $(this).val();
			if ($(`#item${id_select}`).length <= 0) {
				$('#options_permisos').append(` 
					<span class="item_permisos" id="item${id_select}"><input type="hidden" name="permisos[]" value="${name_select}"><i class="fab fa-adn"></i> ${name_select} <a href="#" class="delete_select text-white" data-id="${id_select}""><i class="far fa-trash-alt"></i></a></span>
				`);
			}
		});
		//Para  la plantilla de  updated
		$(document).on("change","#change_select_updated",function(event){
			let id_select = $(this).find('option:selected').attr('data-id');
			let name_select = $(this).val();
			if ($(`#item_update${id_select}`).length <= 0 && name_select !== '') {
				$('#options_permisos_updated').append(` 
					<span class="item_permisos" id="item_update${id_select}"><input type="hidden" name="permisos[]" value="${name_select}"><i class="fab fa-adn"></i> ${name_select} <a href="#" class="delete_select text-white" data-id="${id_select}""><i class="far fa-trash-alt"></i></a></span>
				`);
			}
		});
		//Para eliminar los items seleccionados de permisos 
		$(document).on("click",".delete_select",function(event){
			let id_select = $(this).attr('data-id');
			event.preventDefault();
			if ($(`#item${id_select}`).length > 0) {
				$(`#item${id_select}`).remove();
			}else if ($(`#item_update${id_select}`).length > 0) {
				$(`#item_update${id_select}`).remove();
			}
		});
	}
});