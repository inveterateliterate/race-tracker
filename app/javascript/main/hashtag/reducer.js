import { REQ_FETCH_HASHTAGS } from '../api-actions'
import * as actions from './actions'
import {
  set,
  getOr
} from '../../utils'

import { createSelector } from 'reselect'
import { handleActions } from 'redux-actions'
import { selectorForSlice } from '@launchpadlab/lp-utils'
import { setFromRequest } from '@launchpadlab/lp-redux-api'

const reducerKey = 'hashtag'
const slice = 'root.hashtag'

const initialState = {
  hashtags: {},
}

const reducer = handleActions({
  ...setFromRequest(REQ_FETCH_HASHTAGS, 'hashtags'),
  [actions.createHashtag]: (state, { payload: newTag }) => {
    const tagCollection = getOr([], 'hashtags.success', state)
    return set('hashtags.success', [...tagCollection, newTag], state)
  },
  [actions.updateHashtag]: (state, { payload: { id, text } }) => {
    const tagCollection = getOr([], 'hashtags.success', state)
    const newTagCollection = tagCollection.map(tag => {
      return (tag.id === id) ? { ...tag, text } : tag
    })
    return set('hashtags.success', newTagCollection, state)
  },
  [actions.destroyHashtag]: (state, { payload: id }) => {
    const tagCollection = getOr([], 'hashtags.success', state)
    const newTagCollection = tagCollection.filter(tag => tag.id !== id)
    return set('hashtags.success', newTagCollection, state)
  }
}, initialState)

const select = selectorForSlice(slice)

const selectors = {
  tags: select('hashtags.success', []),
}

selectors.displayedTags = createSelector(
  [selectors.tags],
  function (tags) {
    return tags
  }
)

export { reducer, reducerKey, selectors }
