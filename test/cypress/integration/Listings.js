describe('Listings', function() {
    it('Create New Listing', function() {
    cy.visit('listings/new')
    cy.get("input[type='text']").type("This is an autocreated Author")
    cy.contains("Create Author").click()
    cy.contains("Author was successfully created.")

    });
    
});