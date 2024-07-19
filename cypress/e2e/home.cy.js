describe('Home Page', () => {
    it('should visit the home page', () => {
      cy.visit('/');
    });

    it("should have products on the page", () => {
        cy.visit("/");
        cy.get(".products article").should("be.visible");
    });

    it("should have 2 products on the page", () => {
        cy.visit("/");
        cy.get(".products article").should("have.length", 2);
    });
});