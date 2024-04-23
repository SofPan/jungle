describe('Jungle App Product Details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });

  it("There is a product details page", () => {
    cy.get('.products article a').first().click()

    cy.get('.product-detail').should("be.visible")
  });
});