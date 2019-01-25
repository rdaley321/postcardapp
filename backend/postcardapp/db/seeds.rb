# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Postcard.destroy_all
Address.destroy_all
State.destroy_all

states_hash = {
    "AL" => "https://cdn.civil.services/us-states/flags/alabama-large.png",
    "AK" => "https://cdn.civil.services/us-states/flags/alaska-large.png",
    "AZ" => "https://cdn.civil.services/us-states/flags/arizona-large.png",
    "AR" => "https://cdn.civil.services/us-states/flags/arkansas-large.png",
    "CA" => "https://cdn.civil.services/us-states/flags/california-large.png",
    "CO" => "https://cdn.civil.services/us-states/flags/colorado-large.png",
    "CT" => "https://cdn.civil.services/us-states/flags/connecticut-large.png",
    "DE" => "https://cdn.civil.services/us-states/flags/delaware-large.png",
    "DC" => "https://upload.wikimedia.org/wikipedia/commons/d/d4/Flag_of_the_District_of_Columbia.svg",
    "FL" => "https://cdn.civil.services/us-states/flags/florida-large.png",
    "GA" => "https://cdn.civil.services/us-states/flags/georgia-large.png",
    "HI" => "https://cdn.civil.services/us-states/flags/hawaii-large.png",
    "ID" => "https://cdn.civil.services/us-states/flags/idaho-large.png",
    "IL" => "https://cdn.civil.services/us-states/flags/illinois-large.png",
    "IN" => "https://cdn.civil.services/us-states/flags/indiana-large.png",
    "IA" => "https://cdn.civil.services/us-states/flags/iowa-large.png",
    "KS" => "https://cdn.civil.services/us-states/flags/kansas-large.png",
    "KY" => "https://cdn.civil.services/us-states/flags/kentucky-large.png",
    "LA" => "https://cdn.civil.services/us-states/flags/louisiana-large.png",
    "ME" => "https://cdn.civil.services/us-states/flags/maine-large.png",
    "MD" => "https://cdn.civil.services/us-states/flags/maryland-large.png",
    "MA" => "https://cdn.civil.services/us-states/flags/massachusetts-large.png",
    "MI" => "https://cdn.civil.services/us-states/flags/michigan-large.png",
    "MN" => "https://cdn.civil.services/us-states/flags/minnesota-large.png",
    "MS" => "https://cdn.civil.services/us-states/flags/mississippi-large.png",
    "MO"=>"https://cdn.civil.services/us-states/flags/missouri-large.png",
    "MT"=>"https://cdn.civil.services/us-states/flags/montana-large.png",
    "NE"=>"https://cdn.civil.services/us-states/flags/nebraska-large.png",
    "NV"=>"https://cdn.civil.services/us-states/flags/nevada-large.png",
    "NH"=>"https://cdn.civil.services/us-states/flags/new-hampshire-large.png",
    "NJ"=>"https://cdn.civil.services/us-states/flags/new-jersey-large.png",
    "NM"=>"https://cdn.civil.services/us-states/flags/new-mexico-large.png",
    "NY"=>"https://cdn.civil.services/us-states/flags/new-york-large.png",
    "NC"=>"https://cdn.civil.services/us-states/flags/north-carolina-large.png",
    "ND"=>"https://cdn.civil.services/us-states/flags/north-dakota-large.png",
    "OH"=>"https://cdn.civil.services/us-states/flags/ohio-large.png",
    "OK"=>"https://cdn.civil.services/us-states/flags/oklahoma-large.png",
    "OR"=>"https://cdn.civil.services/us-states/flags/oregon-large.png",
    "PA"=>"https://cdn.civil.services/us-states/flags/pennsylvania-large.png",
    "PR"=>"https://upload.wikimedia.org/wikipedia/commons/2/28/Flag_of_Puerto_Rico.svg",
    "RI"=>"https://cdn.civil.services/us-states/flags/rhode-island-large.png",
    "SC"=>"https://cdn.civil.services/us-states/flags/south-carolina-large.png",
    "SD"=>"https://cdn.civil.services/us-states/flags/south-dakota-large.png",
    "TN"=>"https://cdn.civil.services/us-states/flags/tennessee-large.png",
    "TX"=>"https://cdn.civil.services/us-states/flags/texas-large.png",
    "UT"=>"https://cdn.civil.services/us-states/flags/utah-large.png",
    "VT"=> "https://cdn.civil.services/us-states/flags/vermont-large.png",
    "VA"=> "https://cdn.civil.services/us-states/flags/virginia-large.png",
    "WA"=>"https://cdn.civil.services/us-states/flags/washington-large.png",
    "WV"=>"https://cdn.civil.services/us-states/flags/west-virginia-large.png",
    "WI"=>"https://cdn.civil.services/us-states/flags/wisconsin-large.png",
    "WY"=>"https://cdn.civil.services/us-states/flags/wyoming-large.png"
}

states_hash.map do |key, val|
  State.create(name: key, image_url: val)
end

address1 = Address.create(street: '123 main st.', city: 'Spring', state: 'TX', zip: 67413)
address2 = Address.create(street: '456 hollow st.', city: 'League City', state: 'TX', zip: 73539)
address3 = Address.create(street: '789 big ct.', city: 'Somewhere', state: 'WA', zip: 64624)
address4 = Address.create(street: '123 little st.', city: 'Pearland', state: 'TX', zip: 52341)
address5 = Address.create(street: '321 Street st.', city: 'New York City', state: 'NY', zip: 74321)

# Postcard.create(message: 'cool message', name: 'Ryan', address_id: address1.id, state_id: 5)
# Postcard.create(message: 'cool message', name: 'Emma', address_id: address2.id, state_id: 7)
# Postcard.create(message: 'cool message', name: 'Claire', address_id: address3.id, state_id: 8)
# Postcard.create(message: 'cool message', name: 'Austin', address_id: address4.id, state_id: 9)
# Postcard.create(message: 'cool message', name: 'Jakob', address_id: address5.id, state_id: 20)
