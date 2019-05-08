describe('Users', function() {


    it('Show Sign in Page', function() {
        cy.visit('/users/sign_up') 
        cy.get('form')
        cy.get('.actions').children().contains('Sign up').click()
    });


});