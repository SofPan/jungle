describe('Jungle App Product Details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });

  it("When add product is clicked, cart total increases by 1", () => {
    cy.get('.products article').find('.btn').contains('Add').click({ scrollBehavior: 'center' });

    cy.get('.nav-item.end-0').contains('My Cart (1)');
  });
});