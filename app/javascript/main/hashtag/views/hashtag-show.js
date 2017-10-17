import React from 'react'
import {
  HashtagHeader,
  HashtagList,
  HashtagFooter,
} from '../components'

function Show() {
  return (
    <section className="hashtagList">
      <HashtagHeader />
      <section className="container">
        <HashtagList />
      </section>
      <HashtagFooter />
    </section>
  )
}

export default Show
