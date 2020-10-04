<template>
  <b-navbar toggleable="lg" type="dark" variant="info">
    <b-navbar-brand href="#" @click="setPage('home')">AH</b-navbar-brand>
    <b-navbar-nav>
      <b-nav-item href="#" @click="setPage('search')">Find Your Hero</b-nav-item>
    </b-navbar-nav>
    <b-navbar-nav class="ml-auto">
      <b-nav-item href="#" @click="setPage('user')" right>{{userDisplay}}</b-nav-item>
    </b-navbar-nav>
  </b-navbar>
</template>
<script>
import { mapGetters } from 'vuex'

export default {
  name: 'TopNav',
  computed: {
    ...mapGetters('user', ['signedIn']),
    userDisplay() {
      return this.signedIn ? 'User' : 'Sign In'
    }
  },
  methods: {
    setPage(pageName) {
      this.$store.dispatch('application_settings/setCurrentPage', pageName)
    }
  }
}
</script>

<style lang="sass" scoped>
$primary: black;
  nav {
    background-color: $primary !important;
  }
</style>