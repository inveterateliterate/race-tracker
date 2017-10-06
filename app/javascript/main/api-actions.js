import { requestWithKey } from '@launchpadlab/lp-redux-api'

export const REQ_FETCH_HASHTAGS = 'REQ_FETCH_HASHTAGS'

export function fetchHashtags() {
  return requestWithKey(REQ_FETCH_HASHTAGS, { url: '/hashtags' })
}
