# Seeds file to create initial data for the database tables

user1 = User.create(name: 'John Smith', email: 'johnsmith@gmail.com', password: 'me1234', password_confirmation: 'me1234', role: 'default')
user2 = User.create(name: 'Jane Summer', email: 'janesummer@gmail.com', password: 'me1234', password_confirmation: 'me1234', role: 'default')
user3 = User.create(name: 'Edward Stone', email: 'edwardstone@gmail.com', password: 'me1234', password_confirmation: 'me1234', role: 'admin')

# Country - USA
country1 = Country.create(name: 'United States of America', abbrev: 'USA')

# Three states of USA
state1 = State.create(name: 'California', abbrev: 'CA', country_id: country1.id)
state2 = State.create(name: 'New York', abbrev: 'NY', country_id: country1.id)
state3 = State.create(name: 'Texas', abbrev: 'TX', country_id: country1.id)

# Some cities in California
city1 = City.create(name: 'Los Angeles', state_id: state1.id)
city2 = City.create(name: 'San Francisco', state_id: state1.id)
city3 = City.create(name: 'San Diego', state_id: state1.id)
city4 = City.create(name: 'Oakland', state_id: state1.id)
city5 = City.create(name: 'San Jose', state_id: state1.id)
city6 = City.create(name: 'Fresno', state_id: state1.id)
city7 = City.create(name: 'Sacramento', state_id: state1.id)

# Some cities in New York
city8 = City.create(name: 'New York City', state_id: state2.id)
city9 = City.create(name: 'Buffalo', state_id: state2.id)
city10 = City.create(name: 'Hempstead Town', state_id: state2.id)
city11 = City.create(name: 'Brookhaven', state_id: state2.id)
city12 = City.create(name: 'Syracuse', state_id: state2.id)
city13 = City.create(name: 'Rochester City', state_id: state2.id)

# Some cities in Texas
city14 = City.create(name: 'Dallas', state_id: state3.id)
city15 = City.create(name: 'Austin', state_id: state3.id)
city16 = City.create(name: 'Houston', state_id: state3.id)
city17 = City.create(name: 'San Antonio', state_id: state3.id)
city18 = City.create(name: 'Fort Worth', state_id: state3.id)
city19 = City.create(name: 'El Paso', state_id: state3.id)
city20 = City.create(name: 'Arlington', state_id: state3.id)

# Coworking Spaces
space1 = SpaceCw.create(name: 'SF Mid Market - Private Office 2p', model: 'PO-2p', description: 'San Francisco -Mid Market. Move-in ready office, capacity of 2 persons. Fully furnished.',
  address: '#1005 Market St. SF, CA', price: 0, image: 'http://cdn.com/122546.png', discount: 0, category: '', user_id: user1.id)
space2 = SpaceCw.create(name: 'SF Mid Market - Private Office 4p', model: 'PO-4p', description: 'San Francisco - Mid Market. Move-in ready office, capacity of 4 people. Fully furnished.',
  address: '#1005 Market St. SF, CA', price: 0, image: 'http://cdn.com/122545.png', discount: 0, category: '', user_id: user1.id)
space3 = SpaceCw.create(name: 'SF Downtown - Meeting Room 20p', model: 'MR-20p', description: 'San Francisco - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 20 people.',
  address: '#473 Franklin St. SF, CA', price: 0, image: 'http://cdn.com/122536.png', discount: 0, category: '', user_id: user1.id)
space4 = SpaceCw.create(name: 'Dallas Downtown - Meeting Room 10p', model: 'MR-10p', description: 'Dallas - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 10 people.',
  address: '#387 Johnson St. Downtown, Dallas, TX', price: 0, image: 'http://cdn.com/123336.png', discount: 0, category: '', user_id: user2.id)
space5 = SpaceCw.create(name: 'Dallas Downtown - Private Office 4p', model: 'PO-4p', description: 'Dallas - Downtown. Move-in ready office, capacity of 4 people. Fully furnished.',
  address: '#387 Johnson St. Downtown, Dallas, TX', price: 0, image: 'http://cdn.com/122545.png', discount: 0, category: '', user_id: user2.id)
space6 = SpaceCw.create(name: 'NY Central Park - Private Office 4p', model: 'PO-4p', description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 4 persons. Fully furnished.',
  address: '#387 Fifth Ave. MAN, New York City, NY', price: 0, image: 'http://cdn.com/432547.png', discount: 0, category: '', user_id: user3.id)
space7 = SpaceCw.create(name: 'NY Central Park - Private Office 8p', model: 'PO-8p', description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 8 persons. Fully furnished.',
  address: '#387 Fifth Ave. MAN, New York City, NY', price: 0, image: 'http://cdn.com/482587.png', discount: 0, category: '', user_id: user3.id)
