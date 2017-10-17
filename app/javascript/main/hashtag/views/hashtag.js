import React from 'react'
import PropTypes from 'prop-types'
import { HashtagHeader, HashtagList } from '../components'
import { compose } from 'redux'
import { connect } from 'react-redux'
import { selectors } from '../reducer'
import { onMount } from '@launchpadlab/lp-utils'
// import { selectors as apiSelectors } from '@launchpadlab/lp-redux-api'
import * as apiActions from '../../api-actions'
import * as actions from '../actions'
// import * as effects from 'effects'


const propTypes = {
  createTag: PropTypes.func.isRequired,
  editTag: PropTypes.func.isRequired,
  destroyTag: PropTypes.func.isRequired,
  displayedTags: PropTypes.array.isRequired,
  // completedItems: PropTypes.arrayOf(Types.todoItem).isRequired,
  // activeItems: PropTypes.arrayOf(Types.todoItem).isRequired,
}

const defaultProps = {}

function Hashtag ({
  createTag,
  editTag,
  destroyTag,
  displayedTags,
}) {
  return (
    <section className="hashtagList">
      <header className="header">
        <h1>Hashtags</h1>
        <HashtagHeader onCreate={ createTag } />
      </header>

      <section className="container">
        <HashtagList
          tags={ displayedTags }
          onEdit={ editTag }
          onDelete={ destroyTag }
        />
      </section>
    </section>
  )
}

Hashtag.propTypes = propTypes
Hashtag.defaultProps = defaultProps

function mapStateToProps (state) {
  return {
    displayedTags: selectors.displayedTags(state)
  }
}

const mapDispatchToProps = {
  fetchHashtags: apiActions.fetchHashtags,
  createTag: actions.createHashtag,
  destroyTag: actions.destroyHashtag,
  editTag: actions.updateHashtag,
}

export default compose(
  connect(mapStateToProps, mapDispatchToProps),
  onMount('fetchHashtags'),
)(Hashtag)
