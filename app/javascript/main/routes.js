import React from 'react'
import {
  Route,
  Router,
  IndexRedirect,
  browserHistory,
} from 'react-router'
import { Provider } from 'react-redux'
import { syncHistoryWithStore } from 'react-router-redux'
import initializeStore from './store'
import { routes as HashtagRoutes } from './hashtag'
import Layout from './layout'

const store = initializeStore()

const history = syncHistoryWithStore(browserHistory, store)

function Routes () {
  return(
    <Provider store={ store }>
      <Router history={ history }>
        <Route path='/' component={ Layout }>
          <IndexRedirect to='hashtag' />
            { HashtagRoutes }
        </Route>
      </Router>
    </Provider>
  )
}

export default Routes
