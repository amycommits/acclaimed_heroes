import Vue from 'vue'
import Vuex from 'vuex'
import * as application_settings from './modules/application_settings'
import * as user from './modules/user'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {

  },

  getters: {

  },

  mutations: {


  },

  actions: {

  },
  modules: {
    application_settings,
    user
  }
})

window.store = store
export default store