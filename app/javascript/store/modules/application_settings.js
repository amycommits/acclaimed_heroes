export const namespaced = true

export const state = {
  currentPage: 'home'
}

export const getters = {
  currentPage: (state, getters) => state.currentPage
}

export const actions = {
  setCurrentPage({ commit }, page) {
    commit('SET_CURRENT_PAGE', page)
  }
}

export const mutations = {
  SET_CURRENT_PAGE(state, page) {
    state.currentPage = page
  }
}
