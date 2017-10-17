import {applyMiddleware, compose, createStore, combineReducers } from 'redux'
import { routerReducer } from 'react-router-redux'
import thunkMiddleware from 'redux-thunk'
import { reducer as formReducer } from 'redux-form'
import { middleware as apiMiddleware } from './api'
import { reducer as apiReducer } from '@launchpadlab/lp-redux-api'
import { reducer as rootReducer, reducerKey as rootKey } from './reducer'

function initializeStore () {
  const reducer = combineReducers({
    form: formReducer,
    [rootKey]: rootReducer,
    routing: routerReducer,
    api: apiReducer
  })

  const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose

  const enhancers = composeEnhancers(
    applyMiddleware(
      apiMiddleware,
      thunkMiddleware
    )
  )

  const initialState = {}
  return createStore(reducer, initialState, enhancers)
}

export default initializeStore
