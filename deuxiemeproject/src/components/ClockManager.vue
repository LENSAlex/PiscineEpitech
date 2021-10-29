<template>
    <div>
        <h1>Clocks Manager</h1>
    </div>
</template>
 

<script>

import axios from 'axios'

export default {
  name: 'ClocksManager',
  data(){
      return{
        workingtime:''
      }

  },
  methods:{
    ClockIn(IdUser) {
      axios.post("http://localhost:4000/api/workingtimes/"+IdUser,{
          "clocks":{
              "time" : new Date().toLocaleString() ,
              "status":true,
            }
      }).then(response => (console.log(response)))
      .catch(error => {
        console.log(error.response)
      });
    },
    Clock(IdUser) {
      axios.post("http://localhost:4000/api/workingtimes/"+IdUser,{
          "clocks":{
              "time" : new Date().toLocaleString() ,
              "status":false,
            }
      }).then(response => (console.log(response)))
      .catch(error => {
        console.log(error.response)
      });
    },
    updateWorkingTime(userid,workingtimeid,start,end){
          axios.put("http://localhost:4000/api/workingtimes/"+ workingtimeid ,{
          "workingtime":{
              "start" : start ,
              "end" : end, 
              "userid" : userid
            }

      }).then(response => (
            this.users=response.data.data
        ))
    }

  } 


}
</script>
