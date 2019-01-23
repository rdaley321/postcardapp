# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Postcard.destroy_all
Address.destroy_all

address1 = Address.create(street: '123 main st.', city: 'Spring', state: 'Texas', zip: 11111)
address2 = Address.create(street: '456 hollow st.', city: 'League City', state: 'Texas', zip: 22222)
address3 = Address.create(street: '789 big ct.', city: 'Somewhere', state: 'Washington', zip: 33333)
address4 = Address.create(street: '123 little st.', city: 'Pearland', state: 'Texas', zip: 44444)
address5 = Address.create(street: '321 Street st.', city: 'New York City', state: 'New York', zip: 77777)

Postcard.create(message: 'cool message', name: 'Ryan', address_id: address1.id)
Postcard.create(message: 'cool message', name: 'Emma', address_id: address2.id)
Postcard.create(message: 'cool message', name: 'Claire', address_id: address3.id)
Postcard.create(message: 'cool message', name: 'Austin', address_id: address4.id)
Postcard.create(message: 'cool message', name: 'Jakob', address_id: address5.id)
