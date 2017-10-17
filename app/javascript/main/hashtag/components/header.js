import React from 'react';
import PropTypes from 'prop-types'
import { HeaderForm } from '../forms'
import * as effects from '../../effects'

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
