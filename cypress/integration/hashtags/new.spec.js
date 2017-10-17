describe('New Hashtag', () => {

  const tag = 'Foo'

  it('creates a new hashtag with a description (tag)', () => {
    cy
      .visit('hashtag')
      .get('input[name$=text').type(tag + '{enter}')

      .get('.hashtag-list').last().contains(tag)
  })
})
