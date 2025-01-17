<script setup>
import {ref} from "vue";
import ErrorDescription from "@/components/ErrorDescription.vue";
import apiFetch from "@/heplers/apiFetch.js";
import {useRouter} from "vue-router";

const router = useRouter()
const form = ref({
  data: {
    "flight_number": "",
    "destination": "",
    "launch_date": "",
    "seats_available": "",
  },
  errors: {},
})

const sendForm = async () => {
  form.value.errors = {}

  const result = await apiFetch('post', '/space-flights', form.value.data)

  if (result.error) {
    form.value.errors = result.error.errors
  }

  if (result.data) {
    await router.replace('/flights')
  }
}
</script>

<template>
  <div class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl">
    <form @submit.prevent="sendForm()" class="px-4 mb-10 sm:px-0 bg-white shadow-xl rounded">
      <div class="flex justify-between w-full items-center p-6">
        <div class="mt-6 border-t border-gray-100 w-full">
          <dl class="divide-y divide-gray-100">
            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
              <label class="text-sm font-medium leading-6 text-gray-900">Номер рейса</label>
              <div class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                <input v-model="form.data.flight_number" :class="{'has-error': form.errors.flight_number}" class="p-4 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-sky-600 sm:text-sm sm:leading-6">
                <ErrorDescription :error="form.errors.flight_number" />
              </div>
            </div>
            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
              <label class="text-sm font-medium leading-6 text-gray-900">Место прибытия</label>
              <div class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                <input v-model="form.data.destination" :class="{'has-error': form.errors.destination}" class="p-4 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-sky-600 sm:text-sm sm:leading-6">
                <ErrorDescription :error="form.errors.destination" />
              </div>
            </div>
            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
              <label class="text-sm font-medium leading-6 text-gray-900">Дата запуска</label>
              <div class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                <input v-model="form.data.launch_date" :class="{'has-error': form.errors.launch_date}" class="p-4 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-sky-600 sm:text-sm sm:leading-6">
                <ErrorDescription :error="form.errors.launch_date" />
              </div>
            </div>
            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
              <label class="text-sm font-medium leading-6 text-gray-900">Количество мест</label>
              <div class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
                <input v-model="form.data.seats_available" :class="{'has-error': form.errors.seats_available}" class="p-4 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-sky-600 sm:text-sm sm:leading-6">
                <ErrorDescription :error="form.errors.seats_available" />
              </div>
            </div>
          </dl>
        </div>

      </div>
      <div class="my-10">
        <button type="submit" class="flex w-full justify-center rounded-md bg-sky-600 px-3 py-4 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-sky-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-600">Сохранить</button>
      </div>
    </form>
    <RouterLink to="/flights" class="bg-sky-500 text-white py-2 px-2 rounded shadow-md text-xs hover:bg-sky-600">К списку рейсов</RouterLink>
  </div>
</template>
