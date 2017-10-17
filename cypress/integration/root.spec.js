describe('Root', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('the title should be `RaceTweeter`', () => {
    cy
      .title().should('include', 'RaceTweeter')
  })
})
