// Webpack aliases
const path = require('path')

function aliases (basePath) {
  const to = ext => path.resolve(basePath, ext)
  return {
    'utils': to('utils'),
    'lp-components': '@launchpadlab/lp-components',
    'lp-form': '@launchpadlab/lp-form',
    'lp-redux-api': '@launchpadlab/lp-redux-api',
    'lp-requests': '@launchpadlab/lp-requests',
    'lp-utils': '@launchpadlab/lp-utils',
    'components': to('components'),
    'reducer': to('main/reducer'),
    'types': to('main/types'),
    'api-actions': to('main/api-actions'),
    'effects': to('main/effects'),
    'config': to('config'),
    'api': to('main/api'),
    'auth': to('main/auth'),
  }
}

module.exports = aliases
