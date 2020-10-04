<template>
  <div id="app">
    <top-nav />
    <home v-if="currentPage === 'home'"/>
    <org v-if="currentPage === 'org'" />
    <search v-if="currentPage === 'search'"/>
    <user v-if="currentPage === 'user'" />
    
  </div>
</template>

<script>
import Home from './pages/home.vue'
import Org from './pages/org.vue'
import Search from './pages/search.vue'
import TopNav from './components/static/TopNav.vue'
import User from './pages/signin.vue'
import { mapGetters } from 'vuex'
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: {
    Home,
    Org,
    Search,
    TopNav,
    User
  },
  computed: {
    ...mapGetters('application_settings', ['currentPage'])
  }
}
</script>
<style lang="sass">
  $primary: black;
</style>
