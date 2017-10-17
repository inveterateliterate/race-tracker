import React from 'react'
import PropTypes from 'prop-types'
import HashtagTag from './tag'

const propTypes = {
  tags: PropTypes.array.isRequired,
  onEdit: PropTypes.func.isRequired,
  onDelete: PropTypes.func.isRequired,
}

const defaultProps = {}

function HashtagList({
  tags,
  onEdit,
  onDelete,
}) {
  return (
    <ul className="hashtag-list">
      {
        tags.map(tag =>
          <HashtagTag
            key={ tag.id }
            tag={ tag }
            onEdit={ onEdit }
            onDelete={ onDelete }
          />
        )
      }
    </ul>
  )
}

HashtagList.propTypes = propTypes

HashtagList.defaultProps = defaultProps

export default HashtagList
