<template>
  <div class="col-12 card-wrapper">
    <div class="col-12 user-name">{{name}}</div>
    <img :src="image" class="col-12 user-image" />
    <div v-for="skill in skills" :key="skill" class="user-skills">
      {{skill}}
    </div>
  </div>
</template>
<script>
export default {
  name: 'UserCard',
  props: {
    firstName:String,
    lastName:String,
    image: String,
    skills:Array,
    rawInfo:Object
  },
  computed: {
    name() {
      return `${this.firstName} ${this.lastName}`
    }
  }
}
</script>
<style scoped>
  .user-image {
    width: 150px;
    height: 150px;
    padding: 1%;
  }
  .card-wrapper {
    border: 4px solid black;
    width: 30vw;
  }
</style>