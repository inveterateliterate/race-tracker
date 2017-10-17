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

function HeaderForm({ handleSubmit, invalid, pristine, submitting}) {
  return (
    <form onSubmit={ handleSubmit }>
      <Field
        name='tag'
        component={Input}
        className='new-hashtag'
        label='Add Hashtag'
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

HeaderForm.propTypes = propTypes

export default compose(
  lpForm({
    name: 'header-form',
    enableReinitialize: true,
  })
)(HeaderForm)
