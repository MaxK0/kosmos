<script setup>
import { onMounted, ref } from "vue";
import apiFetch from "@/heplers/apiFetch.js";

const flights = ref([]);
const modalOpen = ref(false);
const modalStatus = ref(false);

onMounted(async () => {
    await updateFlights();
});

const updateFlights = async () => {
    flights.value = (await apiFetch("get", "/space-flights")).data;
};

const entry = async (flight) => {
    const result = await apiFetch("post", "/book-flight", {
        id: flight.id,
    });

    if (result.code === 403) {
        modalStatus.value = false;
    }
    if (result.data) {
        modalStatus.value = true;
        await updateFlights();
    }

    modalOpen.value = true;
};
</script>

<template>
    <div class="container mt-10 sm:mx-auto sm:w-full sm:max-w-2xl">
        <div class="py-6 px-4 mb-10 bg-white shadow-xl rounded">
            <RouterLink
                to="/add-flight"
                class="bg-sky-500 text-white py-2 px-2 rounded shadow-md hover:bg-sky-600"
            >
                Добавить рейс
            </RouterLink>
            <div class="flex gap-2 justify-between flex-wrap mt-6">
                <div
                    v-for="flight in flights"
                    class="shadow-md rounded w-full p-4"
                    style="flex-basis: calc(50% - 10px)"
                >
                    <h2 class="font-bold mb-2 text-xl">{{ flight.flight_number }}</h2>
                    <div class="grid grid-cols-2">
                        <h3 class="text-gray-700">Назначение</h3>
                        <p>{{ flight.destination }}</p>
                    </div>
                    <div class="grid grid-cols-2">
                        <h3 class="text-gray-700">Дата запуска</h3>
                        <p>{{ flight.launch_date }}</p>
                    </div>
                    <div class="grid grid-cols-2">
                        <h3 class="text-gray-700">Свободных мест</h3>
                        <p>{{ flight.seats_available }}</p>
                    </div>
                    <button
                        @click="entry(flight)"
                        class="bg-sky-500 text-white py-2 px-2 rounded shadow-md hover:bg-sky-600 mt-2"
                    >
                        Записаться
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" v-if="modalOpen">
        <div class="modal-wrapper">
            <h2>Уведомление</h2>
            <div v-if="modalStatus">Вы успешно записались на рейс</div>
            <div v-else>Превышен лимит на запись рейса</div>
            <button
                class="bg-sky-500 text-white py-2 px-2 rounded shadow-md hover:bg-sky-600 mt-2"
                @click="modalOpen = false"
            >
                Закрыть
            </button>
        </div>
    </div>
</template>

<style scoped>
.modal {
    z-index: 1;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
}
.modal-wrapper {
    background-color: white;
    padding: 15px;
    border-radius: 14px;
    width: 450px;
    display: flex;
    flex-direction: column;
    gap: 20px;
}
.modal-wrapper h2 {
    font-weight: bold;
    border-bottom: 1px solid #eee;
    padding-bottom: 15px;
}
</style>
