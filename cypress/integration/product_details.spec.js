/// <reference types='cypress' />

describe('product page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  });
  it('can visit a products page', () => {
    cy.get('[alt="Cliff Collard"]').click()
  });
});
