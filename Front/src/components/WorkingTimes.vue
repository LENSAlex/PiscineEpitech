<template>
    <h1>Working Times</h1>
</template>

<script>

import axios from 'axios'

export default {
  name: 'WorkingTimes',
  data(){
      return{
        workingtimes:''
      }

  },
  methods:{
      getWorkingTimes(userid){
        axios.get("http://localhost:4000/api/workingtimes/"+userid).then(response => (
            this.users=response.data.data
        ))
    },

  } 


}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>