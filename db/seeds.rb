# Seeds file to create initial data for the database tables

user1 = User.create(name: 'John Smith', email: 'johnsmith@gmail.com', password: 'me1234', password_confirmation: 'me1234', role: 'default')
user2 = User.create(name: 'Jane Summer', email: 'janesummer@gmail.com', password: 'me1234', password_confirmation: 'me1234', role: 'default')
user3 = User.create(name: 'Edward Stone', email: 'edwardstone@gmail.com', password: 'me1234', password_confirmation: 'me1234', role: 'admin')

country1 = Country.create(name: 'United States of America', abbrev: 'USA')

state1 = State.create(name: 'California', abbrev: 'CA', country_id: country1.id)
state2 = State.create(name: 'New York', abbrev: 'NY', country_id: country1.id)
state3 = State.create(name: 'Texas', abbrev: 'TX', country_id: country1.id)

city1 = City.create(name: 'Los Angeles', state_id: state1.id)
city2 = City.create(name: 'San Francisco', state_id: state1.id)
city3 = City.create(name: 'New York City', state_id: state2.id)
city4 = City.create(name: 'Buffalo', state_id: state2.id)
city5 = City.create(name: 'Dallas', state_id: state3.id)
city6 = City.create(name: 'Austin', state_id: state3.id)

space1 = SpaceCw.create(name: 'SF Mid Market - Private Office 2p', model: '', description: 'San Francisco -Mid Market. Move-in ready office, capacity of 2 persons. Fully furnished.',
  address: '', price: 0, image: 'http://cdn.com/122546.png', discount: 0, category: '', user_id: user1.id)
space2 = SpaceCw.create(name: 'SF Mid Market - Private Office 4p', model: '', description: 'San Francisco - Mid Market. Move-in ready office, capacity of 4 persons. Fully furnished.',
  address: '', price: 0, image: 'http://cdn.com/122545.png', discount: 0, category: '', user_id: user1.id)
space3 = SpaceCw.create(name: 'SF Downtown - Meeting Room', model: '', description: 'San Francisco - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 20 people.',
  address: '', price: 0, image: 'http://cdn.com/122536.png', discount: 0, category: '', user_id: user1.id)
