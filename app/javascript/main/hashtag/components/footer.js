import React from 'react';
import PropTypes from 'prop-types'
import { compose } from 'redux'
import { connect } from 'react-redux'
import { selectors } from '../reducer'
import { filter } from 'lodash'
import { classnames } from 'classnames'
import * as actions from '../actions'

const propTypes = {
  count: PropTypes.number.isRequired,
  list: PropTypes.string.isRequired,
  setList: PropTypes.func.isRequired
}

function HashtagFooter({
  count,
  list,
  setList
}) {
   return (
    <div className="footer">
      <span className="hashtag-count">
        <strong>{ count }</strong> hashtags
      </span>
    </div>
  )
}

HashtagFooter.propTypes = propTypes

const mapStateToProps = (state) => {
  return {
    list: selectors.list(state),
    count: filter(selectors.items(state), { completed: false}).length
  }
}

const mapDispatchToProps = {
  setList: actions.setList
}

export default compose(
  connect(mapStateToProps, mapDispatchToProps)
)(HashtagFooter)
