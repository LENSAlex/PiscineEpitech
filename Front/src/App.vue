<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <router-link class="navbar-brand" to="/Users">Users</router-link>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <router-link class="nav-link" to="/Clocks/alex"
              >ClocksManager</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/WorkingTimes"
              >WorkingTimes</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/WorkingTime"
              >WorkingTime</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/ChartManager"
              >ChartManager</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/Login"
              >Authentification</router-link
            >
          </li>
           <li class="nav-item">
            <router-link class="nav-link" to="/Graph">graph</router-link>
          </li>
        </ul>
      </div>
    </nav>
    <router-view />

    <!-- <donut-chart 
        id="donut" 
        :data="donutData" 
        colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]' 
        resize="true">
    </donut-chart> -->
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
