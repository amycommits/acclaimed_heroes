<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>
<style>
  #app {
    background-color: teal;
  }
</style>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
