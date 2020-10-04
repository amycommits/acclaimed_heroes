import Vue from 'vue'
import Vuex from 'vuex'
import * as application_settings from './modules/application_settings'
import * as org from './modules/org'
import * as search from './modules/search'
import * as user from './modules/user'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    application_settings,
    org,
    search,
    user
  }
})

window.store = store
export default store