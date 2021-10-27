<template>
<div>
  <p>test</p>
  <button v-on:click="getUser()">Discover User</button> 
  <ul>
    <li v-for="user in users" :key="user.id">
      <p>Email : {{ user.email }}</p>
      <p>Username : {{ user.username }}</p>
    </li>
  </ul>

  <button v-on:click="createUser()">Create a user</button> 



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
    <input type="submit" value="Submit">
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
  methods : {

    SubmitUser()
    {
      this.createUser(this.name , this.email)
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

    deleteUser ({userId}) {
      axios.delete(`http://localhost:4000/api/users/${userId}`).then(response => (this.users = response))
      .catch(error => {
        console.log(error.response)
      });
    },

    getUser () {
      axios.get(`http://localhost:4000/api/users`).then(response => (this.users = response.data.data))
      console.log(this.users)
    },

    updateUser ({userId}) {
      axios.put(`http://localhost:4000/api/users/${userId}`).then(response => (this.users = response))
    }
  },
  data () {
    return {
      users: ''
    }
  }
}
</script>
