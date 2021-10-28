<template>
  <div class="container">
    <button v-on:click="getUser()">Discover User</button> 

    <h2 style="text-align: center">Liste des Users</h2> 
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Uername</th>
          <th scope="col">Email</th>
          <th scope="col">Delete</th>
          <th scope="col">Update</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.email">
            <th>{{ user.id }}</th>
            <th>{{ user.username }}</th>
            <th>{{ user.email }}</th>
            <th><button type="button" class="btn btn-danger" v-on:click="DeleteUser(user.id)">Delete</button></th>
            <th><button v-on:click="updateUserDisplay(user.id)" :data-id=user.id class="btn btn-warning">Update a user</button></th>
        </tr>
      </tbody>
    </table>

    <form id="DisplayPutUser" @submit.prevent="UpdateUser(idUserPut)" method="post" v-bind:data-id="idUserPut" class="FormulairePutUser border border-primary" v-show="FormulaireStats" style="margin : 10px">
      <p>
        <label for="name">Username</label>
        <input id="name" v-model="name" type="text" name="name">
      </p>
      <p>
        <label for="email">Email</label>
        <input id="email" v-model="email" type="email" name="email">
      </p>
      <p>
        <input type="submit" value="Submit">
      </p>
    </form>



    <form id="app" @submit.prevent="SubmitUser" action="https://vuejs.org/" method="post">
      <p>
        <label for="name">Username</label>
        <input id="name" v-model="name" type="text" name="name">
      </p>
      <p>
        <label for="email">Email</label>
        <input id="email" v-model="email" type="email" name="email">
      </p>
      <p>
        <input type="submit" value="Create user" class="btn btn-primary">
      </p>
    </form>
  </div>
</template>

<script>



import axios from 'axios';
export default {
  name: 'Users',
  props: {
  },
  mounted:function(){
    axios.get(`http://localhost:4000/api/users`).then(response => (this.users = response.data.data))
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
      axios.delete(`http://localhost:4000/api/users/${userId}`).then(response => (this.users = response))
      .catch(error => {
        console.log(error.response)
      });
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
      }).then(response => (this.users = response))
      this.FormulaireStats = false;
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
