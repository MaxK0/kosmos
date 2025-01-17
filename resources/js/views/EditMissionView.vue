<script setup>
import {onMounted, ref} from "vue";
import apiFetch from "@/heplers/apiFetch.js";
import {useRoute, useRouter} from "vue-router";
import MissionForm from "@/components/MissionForm.vue";

const router = useRouter()
const route = useRoute()
const form = ref({
  data: null,
  errors: {},
})
const id = route.params.id

onMounted(async () => {
  const result = await apiFetch('get', `/lunar-missions/${id}`)

  form.value.data = result.mission
})

const sendForm = async () => {
  form.value.errors = {}

  const result = await apiFetch('post', `/lunar-missions/${id}`, {
    _method: 'patch',
    mission: form.value.data
  })

  if (result.error) {
    form.value.errors = result.error.errors
  }

  if (result.data) {
    await router.replace('/missions')
  }
}
</script>

<template>
  <form class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl" @submit.prevent="sendForm()" v-if="form.data">
    <MissionForm :form="form" />
    <RouterLink to="/missions" class="bg-sky-500 text-white py-2 px-2 rounded shadow-md text-xs hover:bg-sky-600">К списку миссий</RouterLink>
  </form>
</template>
