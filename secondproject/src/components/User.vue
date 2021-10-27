<template>
  <p>test encore</p>
  <p>{{message}}</p>


  <ul>
    <li v-for="(info, x) in infos" :key="x">
        <h3>{{info}}</h3>
    </li>
  </ul>
</template>

<script>

import axios from 'axios';

export default {
  name: 'User',
  props:['message'],
//   data (){
//     return {
//       artists: [
//        {name: 'Davido', genre: 'afrobeats', country: 'Nigeria'},
//        {name: 'Burna Boy', genre: 'afrobeats', country: 'Nigeria'},
//        {name: 'AKA', genre: 'hiphop', country: 'South-Africa'},
//        {name: 'Sarkodie', genre: 'hiphop', country: 'Ghana'},
//        {name: 'Stormzy', genre: 'hiphop', country: 'United Kingdom'},
//        {name: 'Lil Nas', genre: 'Country', country: 'United States'},
//        {name: 'Nasty C', genre: 'hiphop', country: 'South-Africa'},
//        {name: 'Shatta-walle', genre: 'Reagae', country: 'Ghana'},
//        {name: 'Khalid', genre: 'pop', country: 'United States'},
//        {name: 'ed-Sheeran', genre: 'pop', country: 'United Kingdom'}
//       ]
//     }
//   }


data () {
    return {
      infos: null
    }
  },
  mounted () {
    axios
      .get('http://localhost:4000/api/users/6d4016f3-f7c0-4f24-9584-bcb461244d5f')
      .then(response => (this.infos = response))
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
