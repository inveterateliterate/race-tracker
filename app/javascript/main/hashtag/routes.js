import React from 'react'
import { Route, IndexRoute } from 'react-router'
import * as views from './views'

const Routes = (
  <Route path='/hashtag'>
    <IndexRoute component={ views.Hashtag } />
  </Route>
)

export default Routes
