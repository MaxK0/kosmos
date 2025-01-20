<script setup>
import apiFetch from "@/heplers/apiFetch.js";
import {onMounted, ref} from "vue";
import { RouterLink } from "vue-router";

const gagarin = ref()

onMounted(async () => {
  gagarin.value = await apiFetch('get', '/gagarin-flight')
})
</script>

<template>
  <div class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl" v-if="gagarin">
    <div class="px-4 mb-10 sm:px-0 bg-white shadow-xl rounded">
      <div class="flex justify-between w-full items-center p-6">
        <div class="mt-6 w-full">
          <div class="shadow-lg p-2 rounded">
            <h2 class="font-bold mb-4 text-3xl">Миссия</h2>
            <div class="px-4 py-2 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название</p>
              <p class="text-sm">{{ gagarin.data[0].mission.name }}</p>
            </div>
            <h3 class="mt-4 mb-2 font-bold text-xl">Подробности запуска</h3>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Дата запуска</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_date }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название космодрова</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_site.name }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Широта</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_site.location.latitude }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Долгота</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_site.location.longitude }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Продолжителность полета</p>
              <p class="text-sm">{{ gagarin.data[0].mission.flight_duration.hours }} час {{ gagarin.data[0].mission.flight_duration.minutes }} минут</p>
            </div>
          </div>
          <div class="mt-4 shadow-lg p-2 rounded">
            <h2 class="mt-2 mb-2 font-bold text-xl">Космический корабль</h2>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название</p>
              <p class="text-sm">{{ gagarin.data[0].mission.spacecraft.name }}</p>
            </div>

            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Производитель</p>
              <p class="text-sm">{{ gagarin.data[0].mission.spacecraft.manufacturer }}</p>
            </div>

            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Вместимость экипажа</p>
              <p class="text-sm">{{ gagarin.data[0].mission.spacecraft.crew_capacity }}</p>
            </div>
          </div>

          <!--  -->
          <div class="mt-4 shadow-lg p-2 rounded">
            <h2 class="mt-2 mb-2 font-bold text-xl">Приземление</h2>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Дата</p>
              <p class="text-sm">{{ gagarin.data[0].landing.date }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Страна</p>
              <p class="text-sm">{{ gagarin.data[0].landing.site.country }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название населеного пункта</p>
              <p class="text-sm">{{ gagarin.data[0].landing.site.name }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Ширина</p>
              <p class="text-sm">{{ gagarin.data[0].landing.site.coordinates.latitude }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Долгота</p>
              <p class="text-sm">{{ gagarin.data[0].landing.site.coordinates.longitude }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Раскрытие парашгюта</p>
              <p class="text-sm">{{ gagarin.data[0].landing.details.parachute_landing ? 'Да' : 'Нет' }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Cкорость удара, м/с</p>
              <p class="text-sm">{{ gagarin.data[0].landing.details.mpc }}</p>
            </div>
          </div>

          <!--  -->
          <div class="mt-4 shadow-lg p-2 rounded">
            <h2 class="mt-2 mb-2 font-bold text-xl">Информация о космонавте</h2>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Имя</p>
              <p class="text-sm">{{ gagarin.data[0].cosmonaut.name }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Дата рождения</p>
              <p class="text-sm">{{ gagarin.data[0].cosmonaut.birthdate }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Звание</p>
              <p class="text-sm">{{ gagarin.data[0].cosmonaut.rank }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Биография</p>
              <p class="text-sm">{{ gagarin.data[0].cosmonaut.bio.early_life }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Информация о карьере</p>
              <p class="text-sm">{{ gagarin.data[0].cosmonaut.bio.career }}</p>
            </div>
            <div class="px-4 py-4 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Информация после полета</p>
              <p class="text-sm">{{ gagarin.data[0].cosmonaut.bio.post_flight }}</p>
            </div>
          </div>

        </div>

      </div>
    </div>
    <RouterLink to="/missions" class="items-center flex justify-center bg-sky-500 text-white py-2 px-2 rounded shadow-md text-xs font-bold hover:bg-sky-600" href="">К списку миссий</RouterLink>
  </div>
</template>
