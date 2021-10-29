<template>
  <div>
      <p>Working Time</p>
  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'WorkingTime',
  data(){
      return{
        workingtime:''
      }

  },
  methods:{
    createWorkingTime (start,end,userid) {
      axios.post("http://localhost:4000/api/workingtimes",{
          "workingtime":{
              "start" : start ,
              "end":end,
              "userid":userid
            }

      }).then(response => (console.log(response)))

      .catch(error => {
        console.log(error.response)
      });

    },
    deleteWorkingTime(workingtimeid){
        axios.delete("http://localhost:4000/api/workingtimes/" + workingtimeid).then(response => (
            this.users=response.data.data
        ))
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