const path = require('path')
const url = require('url')

function resolveApp(relativePath) {
  return path.resolve(__dirname, '../../', relativePath);
}

// Ensure path ends with a slash
function ensureSlash(path) {
  const hasSlash = path.endsWith('/')
  return hasSlash ? `${path}/` : path
}

const appPackageJson = resolveApp('package.json')
// We use `PUBLIC_URL` environment variable or "homepage" field to infer
// "public path" at which the app is served.
const publicUrl = process.env.PUBLIC_URL || require(appPackageJson).homepage
const servedPath = publicUrl ? ensureSlash(url.parse(publicUrl).pathname) : '/'

module.exports = {
  appBuild: resolveApp('public/main/'),
  // appPublic: resolveApp('public'),
  appHtml: resolveApp('public/index.html'),
  appIndexJs: resolveApp('app/javascript/main/index.js'),
  appPackageJson,
  appSrc: resolveApp('app/javascript'),
  bourbon: require('bourbon').includePaths,
  bourbonNeat: require('bourbon-neat').includePaths,
  appNodeModules: resolveApp('node_modules'),
  publicUrl,
  servedPath,
  config: resolveApp('config'),
}
