require "rails_helper"

RSpec.describe "Collections Show Page" do
  describe "as a visitor" do
    before :each do
      single_collection = File.read('spec/fixtures/get_single_collection.json')
      stub_request(:get, "http://localhost:3000/api/v0/collections/ARN").to_return(status: 200, body: single_collection)
      visit "/collections/ARN"
    end

    it "displays the name and attributes" do
      expect(page).to have_content("Abu Ja'far")
      # expect(page).to have_content("Number of Cards: 3")
      # expect(page).to have_content("Set Logo: https://img.scryfall.com/sets/3dn.svg?1555905600")
    end
  end
end