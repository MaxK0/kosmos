import './bootstrap';
import './assets/css/style.css';
import './assets/css/font-awesome.min.css';
import './assets/js/tailwind_3.4.3.js';

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(router)

app.mount('#app')