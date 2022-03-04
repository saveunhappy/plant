<template>
  <div class="card mb-4 shadow-sm">
    <router-link v-bind:to="'/detail?id=' + plant.id">
      <img class="img-fluid" v-bind:src="plant.image">
    </router-link>
    <div class="card-body">
      <h4 class="">{{plant.name}}</h4>
      <p class="card-text">{{plant.summary}}</p>
      <p class="course-head-price">
        <span class="price-now text-danger"><i class="fa fa-yen"></i>&nbsp;{{plant.price}}&nbsp;&nbsp;</span>
      </p>
      <div class="d-flex justify-content-between align-items-center">

        <div class="btn-group">
          <router-link v-bind:to="'/detail?id=' + plant.id" class="btn btn-sm btn-outline-secondary">绿植详情</router-link>
        </div>

        <div class="text-muted">
          <span class="badge badge-info">{{PLANT_STATUS | optionKV(plant.status)}}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "the-plant",
  props:{
    plant:{},
  },
  data: function (){
    return {
      PLANT_STATUS:PLANT_STATUS,
    }
  },
}
</script>

<style scoped>

</style>