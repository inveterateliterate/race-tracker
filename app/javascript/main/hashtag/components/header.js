import React from 'react';
import PropTypes from 'prop-types'
import { HeaderForm } from '../forms'
import { compose } from 'redux'
import { connect } from 'react-redux'
import * as effects from '../../effects'
import * as actions from '../actions'

const propTypes = {
  onCreate: PropTypes.func,
}

const defaultProps = {}

function HashtagHeader({
  onCreate
}) {
   return (
    <HeaderForm
       onSubmit={ effects.createHashtag }
       onSubmitSuccess={
        (tag, _, { reset }) => {
          onCreate(tag)
          reset()
       }}
    />
  )
}

HashtagHeader.propTypes = propTypes
HashtagHeader.defaultProps = defaultProps

export default HashtagHeader
