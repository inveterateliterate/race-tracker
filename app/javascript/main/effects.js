import { api } from './api'
// import { SubmissionError } from 'redux-form'

export function createHashtag(hashtag) {
  return api.post('/hashtags', { hashtag })
}

export function updateHashtag(id, params) {
  return api.patch(`/hashtags/${id}`, { params })
}

export function destroyHashtag({ id }) {
  return api.destroy(`/hashtags/${id}`)
}
