import axios from 'axios'

export default {
  getUsers() {
    return axios.get('/users')
  },
  issueBadge(info, token) {
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token
    return axios.post('/issue_badge', info)
  }
}