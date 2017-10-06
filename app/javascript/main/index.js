import React from 'react'
import WebpackerReact from 'webpacker-react'
import { Route, Router, browserHistory } from 'react-router'
import initializeStore from './store'
import { Provider } from 'react-redux'
import { views } from './hashtag'

const store = initializeStore()

WebpackerReact.setup({ MainApp })

const HashtagShow = views.HashtagShow

function MainApp () {
  return(
    <Provider store={ store }>
      <Router history={ browserHistory }>
        <Route path='/' component={ HashtagShow } />
      </Router>
    </Provider>
  )
}
