import {
  REQ_FETCH_HASHTAGS
} from '../api-actions'

import * as actions from './actions'

import {
  set,
  cloneDeep,
  updateArray,
  getIndexOf,
  getOr
} from '../../utils'

import { handleActions } from 'redux-actions'
import { selectorForSlice } from '@launchpadlab/lp-utils'
import { setFromRequest } from '@launchpadlab/lp-redux-api'

const reducerKey = 'hashtag'
const slice = 'hashtag.hashtag'

const updateTags = (tags, tagToUpdate) => {
  const tagIndex = getIndexOf(tags, tag => tag.id === tagToUpdate.id)
  return updateArray(tags, tagToUpdate, tagIndex)
}

const removeTag = (array, index) => {
  const clonedArray = cloneDeep(array)
  clonedArray.splice(index, 1)
  return clonedArray
}

const initialState = {
  list: 'all',
  hashtags: {},
}

const reducer = handleActions({
  ...setFromRequest(REQ_FETCH_HASHTAGS, 'hashtags'),

  [actions.setList]: (state, action) => set('list', action.payload, state),

  [actions.createHashtag]: (state, action) => {
    const tagCollection = getOr([], 'hashtags.success', state)
    return set('hashtags.success', [...tagCollection, action.payload], state)
  }

}, initialState)

const select = selectorForSlice(slice)

const selectors = {
  list: select('list'),
  tags: select('hashtags.success', []),
}

export { reducer, reducerKey, selectors }
