import Vue from 'vue'
import VueRouter from 'vue-router'

import Users from '../components/Users.vue'
import WorkingTimes from '../components/WorkingTimes.vue'
import WorkingTime from '../components/WorkingTime.vue'
import Clocks from '../components/ClockManager.vue'
import ChartManager from '../components/ChartManager.vue'
import Authentification from '../components/Authentification.vue'
import User from '../components/User.vue'



import Raphael from 'raphael/raphael'
global.Raphael = Raphael
// import { DonutChart } from 'vue-morris'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Authentification',
    component: Authentification
  },
  {
    // path: '/Users/:IdUser',
    path: '/Users',
    name: 'Users',
    component: Users,
    // props : {username : 'b28c74d3-408f-47a2-914f-2b4508943ec4	'}
  },
  {
    path: '/Clocks/:username',
    name: 'Clocks',
    component: Clocks
  },
  {
    path: '/WorkingTimes/:IdUser',
    name: 'WorkingTimes',
    component: WorkingTimes
  },
  {
    path: '/WorkingTime/:IdUser',
    name: 'WorkingTime',
    component: WorkingTime
  },
  {
    path: '/ChartManager/:IdUser',
    name: 'ChartManager',
    component: ChartManager
  },
  {
    path: '/Authentification',
    name: 'Authentification',
    component: Authentification
  },
  {
    path: '/User',
    name: "User",
    component: User,
    props : true
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router