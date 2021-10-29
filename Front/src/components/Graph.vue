<template>
<div>
    <h1>Clocks Manage</h1>
    <DonutChart id="donut" :data="donutData" colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]' resize="true"></DonutChart>
   <BarChart id="bar" :data="barData" xkey="year" ykeys='["and","ios","win"]' bar-colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]' grid="true" grid-text-weight="bold" resize="true"></BarChart>
  <LineChart id="line" :data="lineData" xkey="year" ykeys='["a","b"]' line-colors='[ "#FF6384", "#36A2EB"]' grid="true" grid-text-weight="bold" resize="true"></LineChart> 
  <AreaChart id="area" :data="lineData" xkey="year" ykeys='["a","b"]' line-colors='[ "#FF6384", "#36A2EB"]' grid="true" grid-text-weight="bold" resize="true"></AreaChart> 

</div>

</template>

<script>
import Raphael from 'raphael/raphael'
global.Raphael = Raphael

import { DonutChart,BarChart,LineChart,AreaChart } from 'vue-morris'


export default {
  name: 'Graph',
    components: {
    DonutChart,
    BarChart,
    LineChart,
    AreaChart
  },
    data () {
        return {
        donutData: [
        { label: 'Red', value: 300 },
        { label: 'Blue', value: 50 },
        { label: 'Yellow', value: 100 }
        ],
        barData: [
          {"year":"2013","and":10,"ios":5,"win":5},
          {"year":"2014","and":10,"ios":15,"win":15}
        ],
        lineData: [
          {year:"2013",a:10,b:5},
          {year:"2014",a:40,b:15}
        ]
        }
    }
}

</script>