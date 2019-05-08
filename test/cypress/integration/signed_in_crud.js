describe('signed_in', function() {
    before(function() {
        cy.app('clean')
        cy.app('seed')
        cy.visit('/users/sign_up')
        cy.get('form').children()
        cy.get("[data-cy='fullname']").type("automated name test")
        cy.get("[data-cy='phonenumber']").type("4444666666")
        cy.get("[data-cy='username']").type("Cypress Username")
        cy.get("[data-cy='city']").type("City")
        cy.get("[data-cy='state']").type("State")
        cy.get("[data-cy='country']").type("Country")
        cy.get("[data-cy='email']").type("cypress@test.com")
        cy.get("[data-cy='password']").type("password")
        cy.get("[data-cy='cpassword']").type("password")
        cy.get("input[type='submit']").click()
        cy.contains("Welcome! You have signed up successfully")

    });

    it("Show Listing Page", function() {
        cy.visit('/listings/new')
        cy.contains('New Listing')
    });

});