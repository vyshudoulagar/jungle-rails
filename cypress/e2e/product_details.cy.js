describe('Product Details', () => {
    it('should visit the home page', () => {
      cy.visit('/');
    });

    it("should load product details when a product is clicked", () => {
        cy.visit("/");
        cy.contains("Scented Blade").click();

        cy.get(".products-show").should("exist");
        cy.get(".page-header").should("contain", "Scented Blade");
    });
});