<script setup>
import {ref} from "vue";
import apiFetch from "@/heplers/apiFetch.js";
import {useRouter} from "vue-router";
import MissionForm from "@/components/MissionForm.vue";

const router = useRouter()
const form = ref({
  data: {
    name: '',
    launch_details: {
      launch_date: '',
      launch_site: {
        name: '',
        location: {
          latitude: '',
          longitude: ''
        }
      }
    },
    landing_details: {
      landing_date: '',
      landing_site: {
        name: '',
        coordinates: {
          latitude: '',
          longitude: ''
        }
      }
    },
    spacecraft: {
      command_module: '',
      lunar_module: '',
      crew: [
        {
          name: '',
          role: '',
        },
      ]
    }
  },
  errors: {},
})

const sendForm = async () => {
  form.value.errors = {}

  const result = await apiFetch('post', '/lunar-missions', {
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
  <form class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl" @submit.prevent="sendForm()">
    <MissionForm :form="form" />
    <RouterLink to="/missions" class="bg-sky-500 text-white py-2 px-2 rounded shadow-md text-xs hover:bg-sky-600">К списку миссий</RouterLink>
  </form>
</template>
