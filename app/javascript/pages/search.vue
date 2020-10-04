<template>
  <div class="row">
    <side-bar class="col-2"/>
    <div class="col-10 row">
      <div v-for="user in userList" :key="user.id">
        <user-card
          :firstName="user.first_name"
          :lastName="user.last_name"
          :image="user.profile_picture"
          :skills="user.skills"
          :rawInfo="user"
        />
      </div>
    </div>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'
  import SideBar from '../components/search/Filter'
  import UserCard from '../components/search/UserCard'
  export default {
    name: 'search',
    computed: {
      ...mapGetters('search',['userList'])
    },
    components: {
      SideBar,
      UserCard
    },
    mounted() {
      this.$store.dispatch('search/setUserList')
    }
  }
</script>