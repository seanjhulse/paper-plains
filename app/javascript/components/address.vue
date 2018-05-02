<template>
	<div id='app'>
		<button id='add-address-button'>{{ message }}</button>
	</div>
</template>

<script>
export default {
	methods: {
	},
	data: function() {
		return {
			message: "Add a new address?",
		}
	}
}
</script>
