var webpack = require('webpack')
var path = require('path')
var dotenv = require('dotenv')
dotenv.config()

var webpackSrc = path.resolve(__dirname, '..', 'react')
var webpackDest = path.resolve(__dirname, '..', 'app', 'assets', 'webpack')

module.exports = {
  entry: {
    main: path.join(webpackSrc, 'main', 'index'),
  },

  output: {
    filename: '[name].js',
    path: webpackDest,
  },

  module: {
    rules: [
      {
        test: /\.jsx?(.erb)?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
      }
    ],
  },

  resolve: {
    alias: {
      'utils': path.join(webpackSrc, 'utils'),
      'lp-components': '@launchpadlab/lp-components',
      'lp-form': '@launchpadlab/lp-form',
      'lp-redux-api': '@launchpadlab/lp-redux-api',
      'lp-requests': '@launchpadlab/lp-requests',
      'lp-utils': '@launchpadlab/lp-utils',
    },
  },

  plugins: [
    // new webpack.optimize.CommonsChunkPlugin({
    //   name: 'vendor',
    //   minChunks: function (module) {
    //     // this assumes your vendor imports exist in the node_modules directory
    //     return module.context && module.context.indexOf('node_modules') !== -1;
    //   }
    // }),
    //CommonChunksPlugin will now extract all the common modules from vendor and main bundles
    new webpack.optimize.CommonsChunkPlugin({
      name: 'webpack-manifest', //But since there are no more common modules between them we end up with just the runtime code included in the manifest file
      minChunks: Infinity,
    }),
  ],
}
