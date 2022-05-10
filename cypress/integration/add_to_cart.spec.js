describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  });
  it('can add item to cart', () => {
    cy.get('.btn').first().click({force: true})
  });
});