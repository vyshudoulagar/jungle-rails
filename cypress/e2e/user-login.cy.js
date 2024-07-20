Cypress.Commands.add('createTestUser', () => {
    cy.exec('bundle exec rake test_setup:create_user')
});

describe('User Login', () => {
    before(() => {
        // Create user before running the test
        cy.createTestUser();
    });

    it('should visit the home page', () => {
      cy.visit('/');
    });

    it("can login users successfully", () => {
        cy.visit("/");
        cy.contains("Login").click();

        cy.get('input[name="email"]').type('john.doe@example.com');
        cy.get('input[name="password"]').type('password');
        cy.get('input[type="submit"]').click();

        cy.contains("Logout").should('be.visible');
    });

    it("create new user", () => {
        cy.visit("/");
        cy.contains("Sign Up").click();

        cy.get('input[name="user[first_name]"]').type('Jack');
        cy.get('input[name="user[last_name]"]').type('Sparrow');
        cy.get('input[name="user[email]"]').type('jack.sparrow@example.com');
        cy.get('input[name="user[password]"]').type('password');
        cy.get('input[name="user[password_confirmation]"]').type('password');
        cy.get('input[type="submit"]').click();

        cy.contains("Logout").should('be.visible');
    });
});