describe('signed_in', function() {
    before(function() {
        cy.app('seed')

    });

    beforeEach("log in", function(){ 
        cy.wait(500)
        cy.visit('/users/sign_in')
        cy.get("[data-cy='email']").type("cypress@test.com")
        cy.get("[data-cy='password']").type("password")
        cy.get("input[type='submit']").click()
    });
    it("Show Listing Page", function() {
        cy.visit('/listings/new')
        cy.contains('New Listing')
    });

    it("Title title less than 3", function() { 
        cy.visit('/listings/new')
        cy.contains('New Listing')
        cy.get("[data-cy='title']").type("ab")
        cy.get("[data-cy='price']").type("6")
        cy.get("[data-cy='description']").type("this is a description")
        cy.get("[data-cy='showphone']").click()
        cy.get("[data-cy='submit']").click()
        cy.contains("Title is too short (minimum is 3 characters)")
    });

    it("Title length greater than 50", function() { 
        cy.visit('/listings/new')
        cy.contains('New Listing')
        cy.get("[data-cy='title']").type("aaaaabbbbbcccccdddddeeeeeaaaaabbbbbcccccdddddeeeeea")
        cy.get("[data-cy='price']").type("6")
        cy.get("[data-cy='description']").type("this is a description")
        cy.get("[data-cy='showphone']").click()
        cy.get("[data-cy='submit']").click()
        cy.contains("Title is too long (maximum is 50 characters)")
    });

    it("Description is too short", function() { 
        cy.visit('/listings/new')
        cy.contains('New Listing')
        cy.get("[data-cy='title']").type("Automated Listing Test")
        cy.get("[data-cy='price']").type("6")
        cy.get("[data-cy='description']").type("Success")
        cy.get("[data-cy='showphone']").click()
        cy.get("[data-cy='submit']").click()
        cy.contains('Description is too short (minimum is 10 characters)')
    });

    it("Listing Created", function() { 
        cy.visit('/listings/new')
        cy.contains('New Listing')
        cy.get("[data-cy='title']").type("Successful Listing Test")
        cy.get("[data-cy='price']").type("6")
        cy.get("[data-cy='description']").type("Listing Created")
        cy.get("[data-cy='showphone']").click()
        cy.get("[data-cy='submit']").click()
        cy.contains('Listing was successfully created.')
    });

    it("Destroy user listed item", function() { 
        cy.visit('/listings')
        cy.get("[data-confirm='Are you sure?']").contains('Remove').click()
        cy.wait(500)
        cy.wait(500)
        cy.contains('Listing was successfully destroyed.')
        // uncaught type error? message that a listing was successfully destroyed appears


    });

});