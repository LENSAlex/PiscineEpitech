<template>
  <div class="container">
    <div class="row">
      <div class="col-md-1"></div>
      <div class="col-md-4">
        <div class="card">
          <form onsubmit="event.preventDefault()" class="box">
            <h1>Login</h1>
            <p class="text-muted">Please enter your username and email</p>
            <input type="text" v-model="name" placeholder="Username" />
            <input
              type="text"
              v-model="email"
              name="email"
              placeholder="Email"
            />
            <button class="button" @click="navigateToRegisterPage()">Login</button>
            <p class="text-muted">
              If you do not currently have an account, please register
            </p>
            <p class="error-msg" v-if="error">{{ error }}</p>
            <button class="button" @click="navigateToRegisterPage">
              Register
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Auth",
  props: {
    username: String,
  },
  mounted: function () {
    axios
      .get(`http://localhost:4000/api/users`)
      .then((response) => (this.users = response.data.data));
  },
  methods: {
    navigateToRegisterPage: function () {
      this.getUser(this.email , this.name);
    },
    SubmitUser() {
      this.createUser(this.name, this.email);
    },

    createUser(username, email) {
      axios
        .post(`http://localhost:4000/api/users`, {
          user: {
            username: username,
            email: email,
          },
        })
        .then((response) => {
          this.$router.push({
            path: "/Welcome",
            props: { idUser: response.data.data.id },
          });
        })
        .catch((error) => {
          console.log(error.response);
        });
    },

    getUser(email , name) {
      axios
        .get(
          "http://localhost:4000/api/users?email="+email+"&username="+name
        )
        .then((response) => {
          localStorage.setItem("userTime", response.data.data[0].id);
          localStorage.setItem("FlagNav", true);
          this.$router.push({
            path: "/User",
          });
        })
        .catch(() => {
          this.error = "Invalid credentials";
        });
    },
  },
  data() {
    return {
      users: "",
      idUserPut: 52,
      FormulaireStats: false,
      error: "",
      email: "",
      name: "",
      FlagNav : true
    };
  },
};
</script>

<style>
body {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background: wheat;
}
.text-design {
}

.button {
  background-color: #4caf50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  border-radius: 50px;
  font-weight: bold;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px,
    rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}
.card {
  margin-bottom: 20px;
  border: none;
  background-color: wheat !important;
}

.error-msg {
  color: red;
}

.box {
  width: 500px;
  padding: 40px;
  margin-left: 250px;
  height: 500px !important;
  background: burlywood;
  text-align: center;
  transition: 0.25s;
  margin-top: 100px;
  border-radius: 50px;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px,
    rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}

.box input[type="text"],
.box input[type="password"] {
  border: 0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #3498db;
  padding: 10px 10px;
  width: 250px;
  outline: none;
  color: white;
  border-radius: 24px;
  transition: 0.25s;
}

.box h1 {
  color: white;
  text-transform: uppercase;
  font-weight: 500;
}

.box input[type="text"]:focus,
.box input[type="password"]:focus {
  width: 300px;
  border-color: #2ecc71;
}

.box input[type="submit"] {
  border: 0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 14px 40px;
  outline: none;
  color: white;
  border-radius: 24px;
  transition: 0.25s;
  cursor: pointer;
}

.box input[type="submit"]:hover {
  background: #2ecc71;
}

.forgot {
  text-decoration: underline;
}

ul.social-network {
  list-style: none;
  display: inline;
  margin-left: 0 !important;
  padding: 0;
}

ul.social-network li {
  display: inline;
  margin: 0 5px;
}

.social-network a.icoFacebook:hover {
  background-color: #3b5998;
}

.social-network a.icoTwitter:hover {
  background-color: #33ccff;
}

.social-network a.icoGoogle:hover {
  background-color: #bd3518;
}

.social-network a.icoFacebook:hover i,
.social-network a.icoTwitter:hover i,
.social-network a.icoGoogle:hover i {
  color: #fff;
}

a.socialIcon:hover,
.socialHoverClass {
  color: #44bcdd;
}

.social-circle li a {
  display: inline-block;
  position: relative;
  margin: 0 auto 0 auto;
  border-radius: 50%;
  text-align: center;
  width: 50px;
  height: 50px;
  font-size: 20px;
}

.social-circle li i {
  margin: 0;
  line-height: 50px;
  text-align: center;
}

.social-circle li a:hover i,
.triggeredHover {
  transform: rotate(360deg);
  transition: all 0.2s;
}

.social-circle i {
  color: #fff;
  transition: all 0.8s;
  transition: all 0.8s;
}
</style>
