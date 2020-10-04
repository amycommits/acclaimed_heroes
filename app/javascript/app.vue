<template>
  <div id="app">
    <top-nav />
    <home />
  </div>
</template>

<script>
import TopNav from './components/static/TopNav.vue'
import Home from './pages/home.vue'
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: {
    Home,
    TopNav
  }
}
</script>
<style lang="sass">
  $primary: black;
</style>
