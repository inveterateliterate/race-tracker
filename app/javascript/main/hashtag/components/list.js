import React from 'react'
import PropTypes from 'prop-types'
import HashtagTag from './tag'
import { compose } from 'redux'
// import { filter } from 'lodash'
import { connect } from 'react-redux'
import { selectors } from '../reducer'
import { onMount } from '@launchpadlab/lp-utils'
// import { selectors as apiSelectors } from '@launchpadlab/lp-redux-api'

import * as apiActions from '../../api-actions'

const propTypes = {
  tags: PropTypes.array.isRequired,
  list: PropTypes.string.isRequired
}

function HashtagList({
  tags,
  list
}) {
  return (
    <ul className="hashtag-list">
      { list === 'all' &&
        tags.map((tag, i) => {
          return <HashtagTag key={ i } tag={ tag } />
        })
      }
    </ul>
  )
}

HashtagList.propTypes = propTypes

const mapStateToProps = (state) => {
  return {
    list: selectors.list(state),
    tags: selectors.items(state)
  }
}

const mapDispatchToProps = {
  fetchHashtags: apiActions.fetchHashtags
}

export default compose(
  connect(mapStateToProps, mapDispatchToProps),
  onMount('fetchHashtags')
)(HashtagList)
