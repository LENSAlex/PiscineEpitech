<template>
  <div class="container">
      <p>Working Time</p>
      <p>Here you can see , update , create and delete your workingtimes</p>

      <div class="row">
        <!-- Affichage des heures prevues que l on peut update ou delete -->
        <div class="col-md-7 mt-5">
          <table class="table table-striped" v-show=FlagListe>
            <thead>
              <tr>
                <th scope="col">Day</th>
                <th scope="col">Start</th>
                <th scope="col">End</th>
                <th scope="col">Heure/Day</th>
                <th scope="col">Update</th>
                <th scope="col">Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">Lundi</th>
                <td>9h</td>
                <td>17h</td>
                <td>7h</td>
                <td><button type="button" class="btn btn-warning" v-on:click="updateUserWorking(10 , 8 , 7)">Update</button></td>
                <td><button type="button" class="btn btn-danger" v-on:click="deleteWorkingTime(7)">Delete</button></td>
              </tr>
            </tbody>
          </table>

        <!-- Formulaire d update en dessous liste  v-show="false"-->
          <div class="shadow-lg p-3 mb-5 bg-white rounded" style="border-radius: 20px !important" v-show=FlagFormulaireUpdate>
          <form @submit.prevent="UpdateUserWorkingTimes()" method="post" style="margin: 10px">
            <div class="row mt-4">
              <div class="col-md-4">
                <label for="id" class="StyleFormTexte">ID</label>
              </div>
              <div class="col-md-8">
                <input id="id" class="form-control" v-model="id" type="text" disabled v-bind:placeholder=UserFormUpdate.id />
              </div>
            </div>

            <div class="row mt-4">
              <div class="col-md-4">
                <label for="start" class="StyleFormTexte">Start</label>
              </div>
              <div class="col-md-8">
                <input id="start" class="form-control" v-model="start" type="date" v-bind:placeholder=UserFormUpdate.Start />
              </div>
            </div>

            <div class="row mt-4">
              <div class="col-md-4">
                <label for="end" class="StyleFormTexte">End</label>
              </div>
              <div class="col-md-8">
                <input id="end" class="form-control" v-model="end" type="date" name="email" v-bind:placeholder=UserFormUpdate.End />
              </div>
            </div>

            <input type="submit" value="Change your date" class="btn btn-warning" style="margin-top: 20px" />
          </form>
        </div>
        
          
        </div>
        <div class="col-md-5 mt-5">
          <div class="shadow-lg p-3 mb-5 bg-white rounded" style="border-radius: 20px !important">
          <form @submit.prevent="CreateUserWorkingTimes()" method="post" style="margin: 10px">

            <div class="row mt-4">
              <div class="col-md-4">
                <label for="start" class="StyleFormTexte">Start</label>
              </div>
              <div class="col-md-8">
                <input id="start" class="form-control" v-model="start" type="date" v-bind:placeholder=UserFormUpdate.Start />
              </div>
            </div>

            <div class="row mt-4">
              <div class="col-md-4">
                <label for="end" class="StyleFormTexte">End</label>
              </div>
              <div class="col-md-8">
                <input id="end" class="form-control" v-model="end" type="date" name="email" v-bind:placeholder=UserFormUpdate.End />
              </div>
            </div>

            <input type="submit" value="Create new date" class="btn btn-warning" style="margin-top: 20px" />
          </form>
        </div>
          
        </div>
      </div>
  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'WorkingTime',
  data(){
      return{
        workingtime:'',
        FlagFormulaireUpdate :false,
        FlagListe :true,
        UserFormUpdate :{
          IdUser : 0,
          IdWorkingTime : 0,
          Start : 0 ,
          End : 0
        }
      }

  },
  methods:{
    updateUserWorking(id , start , end)
    {
      this.FlagFormulaireUpdate = true;
      this.FlagListe =false;

      this.UserFormUpdate.id = id;
      this.UserFormUpdate.start = start;
      this.UserFormUpdate.end = end;

    },
     UpdateUserWorkingTimes() {
       this.updateWorkingTime(this.id , this.UserFormUpdate.IdWorkingTime , this.start , this.end)
    },
    CreateUserWorkingTimes()
    {
        this.createWorkingTime(this.start , this.end , localStorage.getItem("userTime"))
    },
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

  },
}
</script>