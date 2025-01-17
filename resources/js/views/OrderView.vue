<script setup>
import ErrorDescription from "@/components/ErrorDescription.vue";
import apiFetch from "@/heplers/apiFetch.js";
import {ref} from "vue";

const form = ref({
  data: {
    fileimage: null,
    message: '1234567890',
  },
  errors: {},
})
const imageUrl = ref(null)
const dropStatus = ref(null)

const changeFile = event => {
  form.value.data.fileimage = event.target.files[0]
}

const drop = event => {
  form.value.data.fileimage = event.dataTransfer.files[0]
  dragleave(event)
}

const dragover = (e) => {
  e.preventDefault()
  dropStatus.value = 'over'

  console.log('dragover');
}
const dragleave = (e) => {
  e.preventDefault()
  dropStatus.value = null

  console.log('dragleave');
}

const sendForm = async () => {
  form.value.errors = {}
  const formData = new FormData()

  for (const key in form.value.data) {
    formData.append(key, form.value.data[key])
  }

  const resultForJson = await apiFetch('post', '/lunar-watermark', formData)

  const result = await apiFetch('post', '/lunar-watermark', formData, true)

  if (resultForJson?.error) {
    form.value.errors = resultForJson.error.errors
    return;
  }

  imageUrl.value = URL.createObjectURL(result);
}
</script>

<template>
  <form @submit.prevent="sendForm()" class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl">
    <div class="p-6 mb-10 sm:px-0 bg-white shadow-xl rounded wrapper">
      <h1>Заказ на луне</h1>

      <label class="drop-zone block mt-10"
             :class="{'over': dropStatus === 'over', 'enter': form.data.fileimage}"
             @dragover="dragover"
             @dragleave="dragleave"
             @drop.prevent="drop"
      >
        <input type="file" @change="changeFile($event)">
        <template v-if="!form.data.fileimage">
          Переместите файл в данную область
        </template>
        <template v-else>
          {{ form.data.fileimage.name }}
        </template>
      </label>
      <ErrorDescription :error="form.errors.fileimage" />

      <div class="mt-4">
        <div class="flex items-center justify-between">
          <label for="message" class="block text-sm font-medium leading-6 text-gray-900">Подпись</label>
        </div>
        <div class="mt-2">
          <input id="message" v-model="form.data.message" :class="{'has-error': form.errors.message}" type="text" class="p-4 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-sky-600 sm:text-sm sm:leading-6">
        </div>
        <ErrorDescription :error="form.errors.message" />
      </div>

      <div class="mt-8">
        <button type="submit" class="flex w-full justify-center rounded-md bg-sky-600 px-3 py-4 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-sky-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-600">Сделать подпись</button>
      </div>

      <div v-if="imageUrl" class="mt-10">
        <img :src="imageUrl" alt="" class="block w-full">
      </div>

      <div class="mt-10">
        <RouterLink to="/" class="rounded-md bg-sky-600 px-3 py-4 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-sky-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-600">На главную</RouterLink>
      </div>
    </div>
  </form>
</template>

<style scoped>
h1 {
  font-weight: bold;
  font-size: 24px;
}
.wrapper {
  padding: 20px;
}
.drop-zone {
  padding: 20px;
  border: 5px dashed #eee;
  text-align: center;
  border-radius: 10px;
}
.drop-zone input {
  display: none;
}
.enter {
  border-color: #36ae1e;
}
.over {
  border-color: bisque;
}
</style>