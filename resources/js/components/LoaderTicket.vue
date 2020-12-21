<template>
	<div>
	  <div :class="[status ? 'active' : 'inactive', 'content-loader']" >
			<div class="content-spinner">
				<div class="lds-ring"><div></div><div></div><div></div><div></div></div><br>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	props:['status'],
	data: function() {
		return {
		}
	},
	created() {
		console.log('hola');
    },
    mounted(){
    },
    

}
</script>