describe('Add to Cart', () => {
    it('should visit the home page', () => {
      cy.visit('/');
    });

    it("should increase cart by 1 when a Add to Cart is clicked", () => {
        cy.visit("/");
        cy.contains("My Cart (0)").should("exist");

        cy.contains("Scented Blade")
          .parent()
          .find(".btn")
          .click();
        cy.contains("My Cart (1)").should("exist");
    });
});