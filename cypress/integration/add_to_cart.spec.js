describe('product detail tests', () => {

  beforeEach( () => {
    cy.visit('http://0.0.0.0:3000/')
  })

  it('clicks on product to add to cart', () => {
    cy.get('.btn').first().click()
    cy.contains('a.nav-link[href="/cart"]', 'My Cart (1)').should('be.visible');
  });

})