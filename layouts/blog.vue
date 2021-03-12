<template>
	<div class="layout">
		<general-nav-bar style="grid-column: 1" />
		<Nuxt style="grid-column: 2 / 4" />
	</div>
</template>

<script lang="ts">
import Vue from 'vue'

import GeneralNavBar from "@/components/general-navbar.vue";

export default Vue.extend({
	components: {
		GeneralNavBar,
	}
})
</script>

<style scoped>
.layout {
	display: grid;

	grid-template-columns: 20% 60% 20%;
}
</style>
