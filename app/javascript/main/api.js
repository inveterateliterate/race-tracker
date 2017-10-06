import { configureApi } from '@launchpadlab/lp-requests'
import { middleware as configureMiddleware } from '@launchpadlab/lp-redux-api'


function before() {

}

function onUnauthorized() {

}

export const config = {

}

export const middleware = configureMiddleware(config)
export const api = configureApi(config)
