<template>
    <div class="container">
        <h1>Clocks Manager</h1>
        <p>Please click on red bouton for start your day work or red  bouton for the end of the day work</p>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <button type="button" class="btn btn-success BoutonClock" :disabled="StateWork == true"  v-on:click="ClockIn(IdUser)">Start of the day</button>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <button type="button" class="btn btn-danger BoutonClock" :disabled="StateWork == false" v-on:click="Clock(IdUser)">End of the day</button>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</template>
 

<script>

import axios from 'axios'

export default {
  name: 'ClocksManager',
  mounted: function () {
    this.StateWork = localStorage.getItem("StateWork");
    this.IdUser = localStorage.getItem("userTime");
    if(this.StateWork !== "true")
    {
      this.StateWork = false;
    }
  },
  data(){
      return{
        StateWork : false,
        response : "",
        IdUser : 0,
      }

  },
  methods:{
    ClockIn(IdUser) {
      axios.post("http://localhost:4000/api/workingtimes/"+IdUser,{
          "clocks":{
              "time" : new Date().toLocaleString() ,
              "status":true,
            }
      }).then(response => {
          this.response = response
          localStorage.setItem("StateWork", true);
      })
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
      }).then(response => {
        this.response = response
        localStorage.setItem("StateWork", false);
      })
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
<style>
  .BoutonClock
  {
    width: 200px;
    height: 150px;
    border-radius: 75px;
  }
</style>