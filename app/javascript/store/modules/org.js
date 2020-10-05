export const namespaced = true
import Api from '../../api/basic.service'
export const actions = {
  issueBadge({ commit }, info) {
    const formData = new FormData()
    formData.append('info', JSON.stringify({ email: info.email }))
    Api.issueBadge(formData, info.token)
  },
  issueBatchBadges({ commit }, info) {
    const formData = new FormData()
    formData.append('info', JSON.stringify({ emails: info.emails }))
    Api.issueBatchBadges(formData, info.token)
  }
}
