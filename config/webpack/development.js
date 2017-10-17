const webpack = require('webpack')
const CaseSensitivePathsPlugin = require('case-sensitive-paths-webpack-plugin')
const WatchMissingNodeModulesPlugin = require('react-dev-utils/WatchMissingNodeModulesPlugin')
const ManifestPlugin = require('webpack-manifest-plugin')
const getEnv = require('./get-env')
const paths = require('./paths')
const aliases = require('./aliases')

module.exports = {
  devtool: 'cheap-module-source-map',
  entry: [ paths.appIndexJs ],
  output: {
    // Not used in dev but WebpackDevServer crashes without it:
    path: paths.appBuild,
    // Add /* filename */ comments to generated require()s in the output.
    pathinfo: true,
    // This does not produce a real file. It's just the virtual path that is
    // served by WebpackDevServer in development.
    filename: 'main.js',
    // This is the URL that app is served from.
    publicPath: '/',
  },
  resolve: {
    alias: aliases(paths.appSrc),
  },
  module: {
    loaders: [
      // The "url" loader handles all assets unless explicitly excluded.
      // It embeds assets smaller than the specified size as data URLs to avoid requests.
      {
        exclude: [
          /\.html$/,
          /\.(js|jsx)$/,
          /\.scss$/,
          /\.json$/,
          /\.svg$/
        ],
        loader: 'url',
        query: {
          limit: 10000,
          name: 'static/media/[name].[hash:8].[ext]'
        }
      },
      // Process JS with Babel
      {
        test: /\.(js|jsx)$/,
        include: paths.appSrc,
        loaders: [ 'babel-loader?cacheDirectory=true' ],
      },
      {
        test: /\.scss$/,
        include: paths.appSrc,
        loaders: [
          'style',
          'css',
          'sass'
        ]
      },
      // JSON is not enabled by default in Webpack but both Node and Browserify
      // allow it implicitly so we also enable it.
      {
        test: /\.json$/,
        loader: 'json'
      },
      // "file" loader for svg
      {
        test: /\.svg$/,
        loader: 'file',
        query: {
          name: 'static/media/[name].[hash:8].[ext]'
        }
      }
      // ** STOP ** Are you adding a new loader?
      // Remember to add the new extension(s) to the "url" loader exclusion list :)
    ]
  },
  plugins: [
    // Webpacker expects a manifest file
    new ManifestPlugin({ publicPath: '/', writeToFileEmit: true }),
    // Injects env variables into JS code
    new webpack.DefinePlugin({
      'process.env': getEnv(process.env.NODE_ENV),
    }),
    // This is necessary to emit hot updates (currently CSS only):
    new webpack.HotModuleReplacementPlugin(),
    // Watcher doesn't work well if you mistype casing in a path so we use
    // a plugin that prints an error when you attempt to do this.
    new CaseSensitivePathsPlugin(),
    // Automatically watches for missing modules
    new WatchMissingNodeModulesPlugin(paths.appNodeModules)
  ],
  // Some libraries import Node modules but don't use them in the browser.
  // Tell Webpack to provide empty mocks for them so importing them works.
  node: {
    fs: 'empty',
    net: 'empty',
    tls: 'empty'
  }
}
