<script setup>
import {inject} from "vue";
import {useRouter} from "vue-router";
import apiFetch from "@/heplers/apiFetch.js";

const isAuth = inject('token')
const router = useRouter()
const updateToken = inject('updateToken')

const logout = async () => {
  await apiFetch('get', '/logout')

  updateToken(null)
  await router.replace('/auth')
}
</script>

<template>
  <header class="bg-white border-b shadow-xl">
    <nav class="mx-auto flex max-w-7xl items-center justify-between p-2 lg:px-8" aria-label="Global">
      <div class="flex lg:flex-1">
        <RouterLink to="/" class="-m-1.5 p-1.5">
          <span class="sr-only">Your Company</span>
          <img class="h-16 w-auto" src="@/assets/img/logo.jpg" alt="">
        </RouterLink>
      </div>
      <div class="flex lg:hidden">
        <button type="button" class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700">
          <span class="sr-only">Open main menu</span>
          <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
          </svg>
        </button>
      </div>
      <div class="hidden lg:flex lg:gap-x-12">
        <template v-if="!isAuth">
          <RouterLink to="/auth" class="text-sm font-semibold leading-6 text-gray-900">Авторизация</RouterLink>
          <RouterLink to="/registration" class="text-sm font-semibold leading-6 text-gray-900">Регистрация</RouterLink>
        </template>
        <template v-if="isAuth">
          <RouterLink to="/order" class="text-sm font-semibold leading-6 text-gray-900">Заказ на Луне</RouterLink>
          <RouterLink to="/" class="text-sm font-semibold leading-6 text-gray-900">Гагарин</RouterLink>
          <RouterLink to="/missions" class="text-sm font-semibold leading-6 text-gray-900">Миссии</RouterLink>
          <RouterLink to="/flights" class="text-sm font-semibold leading-6 text-gray-900">Рейсы</RouterLink>
          <RouterLink to="/search" class="text-sm font-semibold leading-6 text-gray-900">Поиск</RouterLink>
        </template>
      </div>
      <div class="hidden lg:flex lg:flex-1 lg:justify-end" v-if="isAuth">
        <a href="#" @click.prevent="logout()" class="text-sm font-semibold leading-6 text-gray-900">Выход <span aria-hidden="true">&rarr;</span></a>
      </div>
    </nav>
  </header>
</template>
