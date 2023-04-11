describe('product detail tests', () => {

  beforeEach( () => {
    cy.visit('http://0.0.0.0:3000/')
  })

  it('clicks on product to go to product details page', () => {
    cy.get(':nth-child(1) > a > img').click()
    cy.get(".products-show").should("be.visible");
  })

})