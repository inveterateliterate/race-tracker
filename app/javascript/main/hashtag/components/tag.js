import React from 'react'
import PropTypes from 'prop-types'
import { TagForm } from '../forms'
import { compose } from 'redux'
import { connect } from 'react-redux'
import { getSetPropTypes, toggle } from '@launchpadlab/lp-utils'
import classnames from 'classnames'

import * as effects from '../../effects'
import * as actions from '../../actions'

const propTypes = {
  tag: PropTypes.object.isRequired,
  editTag: PropTypes.func.isRequired,
  destroyTag: PropTypes.func.isRequired,
  editingActive: PropTypes.bool,
  setEditing: PropTypes.func,
  ...getSetPropTypes('inputValue')
}

function HashtagTag({
  tag,
  editTag,
  destroyTag,
  editingActive,
  setEditing,
}) {
  return (
    <li>
      {editingActive &&
        <TagForm
          onSubmit={ effects.updateHashtag }
          onSubmitSuccess={
            (tag) => {
              editTag(tag)
              setEditing(false) }
            }
          initialValues={{ tag: tag.tag, id: tag.id }}
        />
      }

      {!editingActive &&
        <button
          className='destroy'
          onClick={
            () => effects.destroyTag({ id: tag.id })
                         .then(destroyTag)
          }
        >
        </button>
      }
    </li>
  )
}

HashtagTag.propTypes = propTypes

const mapDispatchToProps = {
  destroyTag = actions.destroyTag,
  editTag = actions.editTag
}

export default compose(
  connect(null, mapDispatchToProps),
  toggle('editing')
)(HashtagTag)

