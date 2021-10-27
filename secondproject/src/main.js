import createApp from 'vue'
import App from './App.vue'
import axios from 'axios';
import VueAxios from 'vue-axios';

createApp.config.productionTip = false
createApp.use(VueAxios, axios)

createApp(App).mount('#app')

// test : String = "alex";