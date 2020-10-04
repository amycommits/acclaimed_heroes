<template>
  <div class="org-section-container row">
    <div class="org-section row col-12 individual-badge">
      <input v-model="email" class="col-6" placeholder="enter user email" />
      <b-button :disabled="!email" class="col-2" variant="outline-primary" @click="issueSingleBadge">Submit</b-button>
    </div>
    <div class="org-section row col-12 group-badge">
      <div class="col-6 row">
          <div class="col-12 text-right" v-for="email in emailList" :key="email">
            {{email}}
          </div>
      </div>
      <div class="col-6">
          <b-button class="col-4">
            Approve All
          </b-button>
        <a href="#" class="col-4">Tired of approving these manually? Setup automatic approvals </a>
      </div>
    </div>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'
  export default {
    name: 'org',
    computed: {
      ...mapGetters('search', ['emailList'])
    },
    data() {
      return {
        email: null
      }
    },
    methods: {
      issueSingleBadge() {
            const token = document.querySelector('[name=csrf-token]').content
        this.$store.dispatch('org/issueBadge', {email: this.email, token})
      }
    },
    mounted() {
      this.$store.dispatch('search/setUserList')
    }
  }
</script>
<style>
  .org-section {
    margin-top: 2%;
  }
</style>