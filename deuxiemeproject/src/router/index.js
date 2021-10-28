import Vue from 'vue'
import VueRouter from 'vue-router'

import Users from '../components/Users.vue'
import WorkingTimes from '../components/WorkingTimes.vue'
import WorkingTime from '../components/WorkingTime.vue'
import Clocks from '../components/ClockManager.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/Users',
    name: 'Users',
    component: Users
  },
  {
    path: '/Clocks',
    name: 'Clocks',
    component: Clocks
  },
  {
    path: '/WorkingTimes',
    name: 'WorkingTimes',
    component: WorkingTimes
  },
  {
    path: '/WorkingTime',
    name: 'WorkingTime',
    component: WorkingTime
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
