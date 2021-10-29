<template>
  <div class="container">

    <div class="row">
        <div class="col-md-6">
            <h2 style="text-align: center" class="mt-5 mb-3">Your personal informations</h2> 
                <div class="shadow-lg p-3 mb-5 bg-white rounded" style="border-radius:20px !important">
                    <form @submit.prevent="UpdateUser(users.id)" method="post" style="margin : 10px">

                        <div class="row mt-4">
                            <div class="col-md-4">
                                <label for="name" class="StyleFormTexte">ID </label>
                            </div>
                            <div class="col-md-8">
                                <input id="name" class="form-control" v-model="name" type="text" name="name" v-bind:placeholder=users.id disabled>
                            </div>
                        </div> 

                        <div class="row mt-4">
                            <div class="col-md-4">
                                <label for="name" class="StyleFormTexte">Username </label>
                            </div>
                            <div class="col-md-8">
                                <input id="name" class="form-control" v-model="name" type="text" name="name" v-bind:placeholder=users.username >
                            </div>
                        </div> 

                        <div class="row mt-4">
                            <div class="col-md-4">
                                <label for="email" class="StyleFormTexte">Email </label>
                            </div>
                            <div class="col-md-8">
                                <input id="email" class="form-control" v-model="email" type="email" name="email" v-bind:placeholder=users.email>
                            </div>
                        </div>                  

                        <input type="submit" value="Submit" class="btn btn-warning" style="margin-top:20px">
                    </form>
                </div>
        </div>
    </div>
    

  </div>
</template>

<script>



import axios from 'axios';
export default {
  name: 'Users',
  props:["idUser"],
  mounted:function(){
    axios.get(`http://localhost:4000/api/users/b28c74d3-408f-47a2-914f-2b4508943ec4`).then(response => (this.users = response.data.data))
  },
  methods : {
    SubmitUser()
    {
      this.createUser(this.name , this.email)
    },

    updateUserDisplay(id)
    {
      this.idUserPut = id;
      this.FormulaireStats = true;
    },

    UpdateUser(id)
    {
      this.updateUser(id , this.name , this.email)
    },

    DeleteUser(id)
    {
      this.deleteUser(id)
    },

    createUser (username , email) {
      axios.post(`http://localhost:4000/api/users`,{
          "user":{
              "username" : username ,
              "email": email
          }
      }).then(response => (console.log(response)))
      .catch(error => {
        console.log(error.response)
      });
    },

    deleteUser (userId) {
      axios.delete(`http://localhost:4000/api/users/${userId}`).then(this.users = this.getUser())
      .catch(error => {
        console.log(error.response)
      });
    },

    getUserUnique (id) {
      axios.get('http://localhost:4000/api/users/'+id).then(response => (this.users = response.data))
      console.log(this.users)
    },

    getUser () {
      axios.get(`http://localhost:4000/api/users`).then(response => (this.users = response.data.data))
      console.log(this.users)
    },

    updateUser (userId , username , email) {
      axios.put(`http://localhost:4000/api/users/${userId}` ,{
        "user":{
          "username" : username ,
          "email": email
        }
      }).then(this.users = this.getUser())
    }
  },
  data () {
    return {
      users: '',
      idUserPut : 52,
      FormulaireStats : false
    }
  }
}
</script>

<style>

    .StyleFormTexte
    {
        font-weight: bold;
        font-size: larger;
    }
</style>
