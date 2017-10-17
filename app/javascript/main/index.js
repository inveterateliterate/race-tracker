import WebpackerReact from 'webpacker-react'
import Routes from './routes'

/*
 * Register the app so WebpackerReact can find it
 */

WebpackerReact.setup({ MainApp: Routes })
