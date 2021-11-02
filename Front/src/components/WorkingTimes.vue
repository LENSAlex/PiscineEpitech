<template>
  <div>
      <h1>Working Times</h1>
      <p>Display your working times</p>
      <p>Your 3 last week</p>
      <p style="font-weight:bold">Week : 36 , 35 , 34 </p>
      <BarChart id="bar" :data="barData" xkey="week" ykeys='["first","second","tree","four","five"]' bar-colors='[ "#FF6384", "#36A2EB", "#FFCE56" , "#9613B3" ,"#ACBE11" ]' grid="true" grid-text-weight="bold" resize="true"></BarChart>

  </div>
</template>

<script>
import Raphael from 'raphael/raphael'
global.Raphael = Raphael

import { BarChart } from 'vue-morris'

import axios from 'axios'


export default {
  name: 'WorkingTimes',
  components: {
    BarChart,
  },
  mounted: function () {
    axios
      axios.get("http://localhost:4000/api/workingtimes").then(response => {
            console.log(response)
            this.users=response.data.data  
            
            //Parcour tab et rangement dans tab
            this.users.forEach(WorkingTimes => {
              this.TabHeure.push(this.CalculHeureWorkDay(WorkingTimes.start ,WorkingTimes.end))
            });

            //Creation du data
            this.StringBarData = "{week" + ":" + "Du ... au ...."+","; //Grace aux input
            this.TabHeure.forEach(Heure =>
            {
                //Voir pour mettre le jour liee les deux foreach
                this.StringBarData += "LaDAte" + ":" + Heure +","
            })
            this.StringBarData += "}"
            alert(this.StringBarData)
        })
  },
  data () {
      return {
      users : "",
      TabHeure : [],
      StringBarData : "",
      barData: [
        // {"week":"36 Week","first":7,"second":5,"tree":4,"four":7,"five":5},
        // {"week":"35 Week","first":7,"second":5,"tree":4,"four":7,"five":5},
        // {"week":"34 Week","first":7,"second":5,"tree":4,"four":7,"five":5}
        // {this.StringBarData}
        this.StringBarDatav 
      ],
      }
  },
  methods:{
    getWorkingTimes(userid){
        axios.get("http://localhost:4000/api/workingtimes/"+userid).then(response => {
            this.users=response.data.data      
        })
    },
    CalculHeureWorkDay(start , end)
    {
      //TODO : Pas gerer les minutes que les heures
      const DateStart = new Date(start).getHours();
      const DateEnd = new Date(end).getHours();
      //Pause midi
      const DiffTemp = (DateEnd - DateStart ) + 1;

      return DiffTemp;
    }
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