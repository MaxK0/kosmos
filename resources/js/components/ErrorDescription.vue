<script setup>
  defineProps({
    error: Array,
  })
</script>

<template>
  <div class="invalid-description" v-if="error">
    {{ error.join(', ') }}
  </div>
</template>
