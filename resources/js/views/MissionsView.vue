<script setup>
import {inject, onMounted, ref} from "vue";
import apiFetch from "@/heplers/apiFetch.js";
import MissionItem from "@/components/MissionItem.vue";

const missions = ref([])

onMounted(async () => {
  const result = await apiFetch('get', '/lunar-missions')
  result.forEach(m => {
    const mission = m.mission

    mission.is_open = false

    missions.value.push(mission)
  })
})
const open = mission => {
  missions.value.forEach(mission => {
    mission.is_open = false
  })

  mission.is_open = true
}
const remove = async mission => {
  await apiFetch('delete', `/lunar-missions/${mission.id}`)

  missions.value.splice(missions.value.indexOf(mission), 1)
}
</script>

<template>
  <div class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl" v-if="missions">
    <RouterLink to="/add-mission" class="bg-sky-500 text-white py-2 px-2 rounded shadow-md hover:bg-sky-600 mb-4">
      Добавить миссию
    </RouterLink>

    <MissionItem v-for="mission in missions" @open="open" @remove="remove" :mission="mission" />

    <a class="bg-sky-500 text-white py-2 px-2 rounded shadow-md text-xs hover:bg-sky-600" href="">К списку миссий</a>
  </div>
</template>
