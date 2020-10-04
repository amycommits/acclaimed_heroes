<template>
  <div class="row user-role-container">
    <h1 class="col-12">I...</h1>
    <div class="row col-12">
        <div @click="setRole('hero')" class="col-4 role-type">
          <h2 class="text-center">Am I HERO</h2>
        </div>
        <div @click="setRole('company')" class="col-4 role-type">
          <h2 class="text-center" >Have a mission</h2>
        </div>
        <div @click="setRole('organization')" class="col-4 role-type">
          <h2 class="text-center">Am an Organization</h2>
        </div>
    </div>
  </div>
</template>
<script>
  export default {
    name: 'user',
    methods: {
      setRole(role) {
        this.$store.dispatch('user/setRole', role)
        this.$store.dispatch('user/signIn', true)
        this.redirectUser(role)
      },
      redirectUser(role) {
        switch(role) {
          case 'organization':
            this.$store.dispatch('application_settings/setCurrentPage', 'org')
            break
          default:
            this.$store.dispatch('application_settings/setCurrentPage', 'search')
        }
      }
    }
  }
</script>
<style>
  .role-type {
    height: 80vh;
    border: 2px solid black;
  }

</style>