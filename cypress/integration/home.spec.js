/// <reference types='cypress' />

describe('home page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  });
  it('displays products on the page', () => {
    cy.get('.products article').should('be.visible');
  });
  it('displays 12 products on the page', () => {
    cy.get('.products article').should('have.length', 12);
  });
});
