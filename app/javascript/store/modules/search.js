import Api from '../../api/basic.service'
export const namespaced = true

export const state = {
  userList: []
}

export const getters = {
  userList: (state, getters) => state.userList,
  emailList: (state, getters) => state.userList.map(user => { return user.email })
}

export const actions = {
  setUserList({ commit }) {
    Api.getUsers().then(response => {
      commit('SET_USER_LIST', response.data)
    })
  }
}

export const mutations = {
  SET_USER_LIST(state, list) {
    state.userList = list
  }
}
