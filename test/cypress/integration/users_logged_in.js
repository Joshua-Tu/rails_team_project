describe("Users logged in", function() {
    before(function(){ 
        cy.visit('/users/sign_in')
        cy.get("input[type='text']").type('nathaniel@test.com')
        cy.get("input[type='passwprd']").type('password')
    })

});