import React from 'react';
import PropTypes from 'prop-types'
import { HeaderForm } from '../forms'
import { compose } from 'redux'
import { connect } from 'react-redux'
import * as effects from '../../effects'
import * as actions from '../actions'

const propTypes = {
  createTag: PropTypes.func,
}

function HashtagHeader({
  createTag
}) {
   return (
    <header className="header">
      <h1>HashTags</h1>
      <HeaderForm
         onSubmit={ effects.createHashtag }
         onSubmitSuccess={
          (tag, _, { reset }) => {
            createTag(tag)
            reset()
         }}
      />
    </header>
  )
}

HashtagHeader.propTypes = propTypes

const mapDispatchToProps = {
  createItem: actions.createHashtag
}

export default compose(
  connect(null, mapDispatchToProps)
)(HashtagHeader)
