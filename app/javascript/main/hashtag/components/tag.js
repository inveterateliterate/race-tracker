import React from 'react'
import PropTypes from 'prop-types'
import { HashtagForm } from '../forms'
import { compose } from 'redux'
import { togglePropTypes, toggle } from '@launchpadlab/lp-utils'
// import classnames from 'classnames'
import * as effects from '../../effects'

const propTypes = {
  tag: PropTypes.object.isRequired,
  onEdit: PropTypes.func.isRequired,
  onDelete: PropTypes.func.isRequired,
  ...togglePropTypes('editing')
}

const defaultProps = {}

function HashtagTag({
  tag: {
    id,
    tag,
  },
  onEdit,
  onDelete,
  editing,
  setEditing,
}) {
  return (
    <li>
      {
        !editing &&
        <label onDoubleClick={ () => setEditing(true) }>
          { tag }
        </label>
      }
      {editing &&
        <HashtagForm
          onSubmit={ effects.updateHashtag }
          onSubmitSuccess={ tag => {
              onEdit(tag)
              setEditing(false)
          }}
          initialValues={{ tag, id }}
        />
      }
      {
        !editing &&
        <button
          className='destroy'
          onClick={ () => effects.destroyHashtag({ id }).then(() => onDelete(id)) }
        >
        </button>
      }
    </li>
  )
}

HashtagTag.propTypes = propTypes
HashtagTag.defaultProps = defaultProps

export default compose(
  toggle('editing')
)(HashtagTag)

