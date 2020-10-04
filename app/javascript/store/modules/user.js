export const namespaced = true

export const state = {
  signedIn: false,
  role: null
}

export const getters = {
  signedIn: (state, getters) => state.signedIn,
  role: (state, getters) => state.role
}

export const actions = {
  signIn({ commit }, bool) {
    commit('SIGN_IN', bool)
  },
  setRole({ commit }, role) {
    commit('SET_ROLE', role)
  }
}

export const mutations = {
  SIGN_IN(state, bool) {
    state.signedIn = bool
  },
  SET_ROLE(state, role) {
    state.role = role
  }
}
