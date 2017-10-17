import { api } from './api'
// import { SubmissionError } from 'redux-form'

export function createHashtag({ text }) {
  return api.post('/hashtags', { hashtag: { text } })
}

export function updateHashtag({ id, text }) {
  return api.patch(`/hashtags/${id}`, { hashtag: { id, text } })
}

export function destroyHashtag({ id }) {
  return api.destroy(`/hashtags/${id}`)
}
