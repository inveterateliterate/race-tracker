import { configureApi } from '@launchpadlab/lp-requests'
import { middleware as configureMiddleware } from '@launchpadlab/lp-redux-api'

export const config = {
  successDataPath: 'data.attributes',
}

export const middleware = configureMiddleware(config)
export const api = configureApi(config)
