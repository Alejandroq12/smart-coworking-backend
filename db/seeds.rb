require 'date'

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
  address: '#1005 Market St. SF, CA', price: 0, image: 'https://img.freepik.com/free-photo/luxury-cottage-old-suburb-illuminated-by-twilight-lighting-generated-by-artificial-intelligence_188544-150345.jpg', discount: 0, category: '', user_id: user1.id)
space2 = SpaceCw.create(name: 'SF Mid Market - Private Office 4p', model: 'PO-4p', description: 'San Francisco - Mid Market. Move-in ready office, capacity of 4 people. Fully furnished.',
  address: '#1005 Market St. SF, CA', price: 0, image: 'https://www.zillowstatic.com/bedrock/app/uploads/sites/47/strategies-for-finding-cheap-houses-c81cd7.jpg', discount: 0, category: '', user_id: user1.id)
space3 = SpaceCw.create(name: 'SF Downtown - Meeting Room 20p', model: 'MR-20p', description: 'San Francisco - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 20 people.',
  address: '#473 Franklin St. SF, CA', price: 0, image: 'https://rdcnewsadvice.wpengine.com/wp-content/uploads/2018/08/Indianapolis-IN-home.jpg', discount: 0, category: '', user_id: user1.id)
space4 = SpaceCw.create(name: 'Dallas Downtown - Meeting Room 10p', model: 'MR-10p', description: 'Dallas - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 10 people.',
  address: '#387 Johnson St. Downtown, Dallas, TX', price: 0, image: 'https://i.pinimg.com/550x/fc/07/40/fc0740d7c26d93974e117cb88a81bc36.jpg', discount: 0, category: '', user_id: user2.id)
space5 = SpaceCw.create(name: 'Dallas Downtown - Private Office 4p', model: 'PO-4p', description: 'Dallas - Downtown. Move-in ready office, capacity of 4 people. Fully furnished.',
  address: '#387 Johnson St. Downtown, Dallas, TX', price: 0, image: 'https://cdn.habitusliving.com/wp-content/uploads/2024/02/1.smallmodhomesFEAT.jpg', discount: 0, category: '', user_id: user2.id)
space6 = SpaceCw.create(name: 'NY Central Park - Private Office 4p', model: 'PO-4p', description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 4 persons. Fully furnished.',
  address: '#387 Fifth Ave. MAN, New York City, NY', price: 0, image: 'https://images.surferseo.art/fdb08e2e-5d39-402c-ad0c-8a3293301d9e.png', discount: 0, category: '', user_id: user3.id)
space7 = SpaceCw.create(name: 'NY Central Park - Private Office 8p', model: 'PO-8p', description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 8 persons. Fully furnished.',
  address: '#387 Fifth Ave. MAN, New York City, NY', price: 0, image: 'https://s42814.pcdn.co/wp-content/uploads/2024/05/240321-This_Old_House_Raquel_Langworthy_058_V2-scaled-1024x576.jpg.optimal.jpg', discount: 0, category: '', user_id: user3.id)

# Space Reservations
start_date1 = Date.tomorrow
end_date1 = Date.tomorrow + 3.days
start_time1 = Time.new(start_date1.year, start_date1.month, start_date1.day, 3, 0, 0) # 9:00 am (my time zone is UTC -6, so 3+6 = 9)
end_time1 = Time.new(end_date1.year, end_date1.month, end_date1.day, 11, 0, 0) # 5:00 pm (my time zone is UTC -6, so 11+6 = 17)

reservation1 = Reservation.create(user_id: user1.id, space_cw_id: space1.id, date_reserved: Date.today, date_cancelled: '', start_date: start_date1, end_date: end_date1,
  start_time: start_time1, end_time: end_time1, city_id: city2.id, comments: "Test reservation 1 - User 1 - Space 1 - City 2")

start_date2 = Date.tomorrow
end_date2 = Date.tomorrow + 3.days
start_time2 = Time.new(start_date2.year, start_date2.month, start_date2.day, 3, 0, 0) # 9:00 am (my time zone is UTC -6, so 3+6 = 9)
end_time2 = Time.new(end_date2.year, end_date2.month, end_date2.day, 11, 0, 0) # 5:00 pm (my time zone is UTC -6, so 11+6 = 17)

reservation2 = Reservation.create(user_id: user2.id, space_cw_id: space4.id, date_reserved: Date.today, date_cancelled: '', start_date: start_date2, end_date: end_date2,
  start_time: start_time2, end_time: end_time2, city_id: city14.id, comments: "Test reservation 2 - User 2 - Space 4 - City 14")
