<script setup>
import apiFetch from "@/heplers/apiFetch.js";
import {onMounted, ref} from "vue";

const gagarin = ref()

onMounted(async () => {
  gagarin.value = await apiFetch('get', '/gagarin-flight')
  console.log(gagarin);
})
</script>

<template>
  <div class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl" v-if="gagarin">
    <div class="px-4 mb-10 sm:px-0 bg-white shadow-xl rounded">
      <div class="flex justify-between w-full items-center p-6">
        <div class="mt-6 w-full">
          <div class="shadow-lg p-2 rounded">
            <h2 class="font-bold text-2xl">Миссия</h2>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название</p>
              <p class="text-sm">{{ gagarin.data[0].mission.name }}</p>
            </div>
            <h3 class="mt-4 font-bold text-xl">Подробности запуска</h3>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Дата запуска</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_date }}</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название космодрова</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_site.name }}</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Широта</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_site.location.latitude }}</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Долгота</p>
              <p class="text-sm">{{ gagarin.data[0].mission.launch_details.launch_site.location.longitude }}</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Продолжителность полета</p>
              <p class="text-sm">{{ gagarin.data[0].mission.flight_duration.hours }} час {{ gagarin.data[0].mission.flight_duration.minutes }} минут</p>
            </div>
          </div>
          <div class="mt-4 shadow-lg p-2 rounded">
            <h2 class="mt-2 font-bold text-xl">Космический корабль</h2>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название</p>
              <p class="text-sm">{{ gagarin.data[0].mission.spacecraft.name }}</p>
            </div>

            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Производитель</p>
              <p class="text-sm">{{ gagarin.data[0].mission.spacecraft.manufacturer }}</p>
            </div>

            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Вместимость экипажа</p>
              <p class="text-sm">{{ gagarin.data[0].mission.spacecraft.crew_capacity }}</p>
            </div>
          </div>

          <!--  -->
          <div class="mt-4 shadow-lg p-2 rounded">
            <h2 class="mt-2 font-bold text-xl"></h2>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Дата</p>
              <p class="text-sm">1961-04-12</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Страна</p>
              <p class="text-sm">СССР</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Название населеного пункта</p>
              <p class="text-sm">Смеловка</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Ширина</p>
              <p class="text-sm">51.2700000</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Долгота</p>
              <p class="text-sm">45.9970000</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Раскрытие парашгюта</p>
              <p class="text-sm">Да</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Cкорость удара, м/с</p>
              <p class="text-sm">7</p>
            </div>
          </div>

          <!--  -->
          <div class="mt-4 shadow-lg p-2 rounded">
            <h2 class="mt-2 font-bold text-xl">Информация о космонафте</h2>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">ФИО</p>
              <p class="text-sm">Юрий Гагарин</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Дата рождения</p>
              <p class="text-sm">1934-03-09</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Звание</p>
              <p class="text-sm">Старший лейтенант</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Биография</p>
              <p class="text-sm">Родился в Клушино, Россия..</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Информация о карьере</p>
              <p class="text-sm">Отобран в отряд космонавтов в 1960 году...</p>
            </div>
            <div class="px-4 py-6 grid grid-cols-2 sm:px-0">
              <p class="font-bold text-gray-900">Информация после полета</p>
              <p class="text-sm">Стал международным героем..</p>
            </div>
          </div>

        </div>

      </div>
    </div>
    <a class="items-center flex justify-center bg-sky-500 text-white py-2 px-2 rounded shadow-md text-xs hover:bg-sky-600" href="">К списку миссий</a>
  </div>
</template>
