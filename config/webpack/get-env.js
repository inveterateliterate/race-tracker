const fs = require('fs')
const path = require('path')
const mapValues = require('lodash/mapValues')
const paths = require('./paths')

// Read ENV vars based on environment
function getEnv (environment) {
  // Read vars from relevant .env file
  const filepath = path.join(paths.config, `.env.${ environment }`)
  const fileVars = readEnvFile(filepath)
  // Read vars from process
  const processVars = {}
  Object.keys(process.env).forEach(key => processVars[key] = process.env[key])
  // Stringify all vars and return
  const allVars = Object.assign({}, fileVars, processVars)
  return mapValues(allVars, JSON.stringify)
}

function readEnvFile (filepath) {
  // If file isn't found, return empty object
  if (!fs.existsSync(filepath)) return {}
  const envVarFile = fs.readFileSync(filepath, 'utf8')
  // Pull variables from file
  const vars = {}
  envVarFile.replace(/(\w+)=(.+)/g, (_, $1, $2) => vars[$1] = $2)
  return vars
}

module.exports = getEnv
