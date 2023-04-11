describe('jungle app tests', () => {

  beforeEach( () => {
    cy.visit('http://0.0.0.0:3000/')
  })

  it('checks there are products on the page', () => {
    cy.get(".products article").should("be.visible");
  })

  it('checks there are 2 products on the page', () => {
    cy.get(".products article").should("have.length", 2);
  })

})