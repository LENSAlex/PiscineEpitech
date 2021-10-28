<template>
    <div>
        <h1>Clocks Manage</h1>
        <donut-chart 
            id="donut" 
            :data="donutData" 
            colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]' 
            resize="true">
        </donut-chart>
    </div>
</template>
 

<script>

// import { DonutChart } from 'vue-morris'
export default {
    data () {
    return {
      donutData: [
            { label: 'Red', value: 300 },
            { label: 'Blue', value: 50 },
            { label: 'Yellow', value: 100 }
      ]
    }
  }
}
</script>
