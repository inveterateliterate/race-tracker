import React from 'react'
import PropTypes from 'prop-types'
import { compose } from 'redux'
import {
  Input,
  SubmitButton,
  ButtonArea,
} from 'lp-components'
import { Field, propTypes as formPropTypes } from 'redux-form'
import { lpForm } from 'lp-form'

const propTypes = {
  ...formPropTypes,
  invalid: PropTypes.bool,
  pristine: PropTypes.bool,
  submitting: PropTypes.bool,
  handleSubmit: PropTypes.func.isRequired,
  submit: PropTypes.func.isRequired,
  form: PropTypes.string.isRequired,
}

function HashtagForm({ handleSubmit, invalid, pristine, submitting }) {
  return (
    <form onSubmit={ handleSubmit }>
      <Field
        name='text'
        component={Input}
        className='edit-hashtag'
      >
      </Field>
      <ButtonArea>
        <SubmitButton { ...{ invalid, pristine, submitting } }>
          Save
        </SubmitButton>
      </ButtonArea>
    </form>
  )
}

HashtagForm.propTypes = propTypes

export default compose(
  lpForm({
    name: 'hashtag-form',
    enableReinitialize: true,
  })
)(HashtagForm)
