import { combineReducers } from 'redux'

import {
  reducer as hashtagReducer,
  reducerKey as hashtagReducerKey
} from './hashtag'

const reducerKey = 'root'

const reducer = combineReducers({
  [hashtagReducerKey]: hashtagReducer
})

export { reducer, reducerKey }
