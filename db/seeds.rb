require 'date'

puts "Seeding database with initial data..."

ActiveRecord::Base.transaction do
  # For future devs of this project:
  # Uncomment these lines if you want to start fresh each time you run seeds.
  # User.destroy_all
  # Reservation.destroy_all
  # Workspace.destroy_all
  # City.destroy_all
  # State.destroy_all
  # Country.destroy_all

  # Create Users
  puts "Creating Users..."
  user_john = User.create!(
    name: 'John Smith',
    email: 'johnsmith@gmail.com',
    password: 'me1234',
    password_confirmation: 'me1234',
    role: 'default'
  )

  user_jane = User.create!(
    name: 'Jane Summer',
    email: 'janesummer@gmail.com',
    password: 'me1234',
    password_confirmation: 'me1234',
    role: 'default'
  )

  user_edward = User.create!(
    name: 'Edward Stone',
    email: 'edwardstone@gmail.com',
    password: 'me1234',
    password_confirmation: 'me1234',
    role: 'admin'
  )

  # Create Country (USA)
  puts "Creating Country..."
  country_usa = Country.create!(name: 'United States of America', abbrev: 'USA')

  # Create States
  puts "Creating States..."
  state_california = State.create!(name: 'California', abbrev: 'CA', country: country_usa)
  state_new_york = State.create!(name: 'New York', abbrev: 'NY', country: country_usa)
  state_texas = State.create!(name: 'Texas', abbrev: 'TX', country: country_usa)

  # Create Cities for California
  puts "Creating Cities for California..."
  california_cities = %w[Los\ Angeles San\ Francisco San\ Diego Oakland San\ Jose Fresno Sacramento]
  california_cities.each do |city_name|
    City.create!(name: city_name, state: state_california)
  end

  # Create Cities for New York
  puts "Creating Cities for New York..."
  new_york_cities = ['New York City', 'Buffalo', 'Hempstead Town', 'Brookhaven', 'Syracuse', 'Rochester City']
  new_york_cities.each do |city_name|
    City.create!(name: city_name, state: state_new_york)
  end

  # Create Cities for Texas
  puts "Creating Cities for Texas..."
  texas_cities = ['Dallas', 'Austin', 'Houston', 'San Antonio', 'Fort Worth', 'El Paso', 'Arlington']
  texas_cities.each do |city_name|
    City.create!(name: city_name, state: state_texas)
  end

  # Fetch some cities for reference
  city_san_francisco = City.find_by!(name: 'San Francisco')
  city_dallas = City.find_by!(name: 'Dallas')
  city_new_york = City.find_by!(name: 'New York City')

  # Create Workspaces with varying prices and discounts
  puts "Creating Workspaces..."
  Workspace.create!(
    name: 'SF Mid Market - Private Office 2p',
    model: 'PO-2p',
    description: 'San Francisco - Mid Market. Move-in ready office, capacity of 2 persons. Fully furnished.',
    address: '#1005 Market St. SF, CA',
    price: 200.0,
    discount: 10.0,
    category: 'Private Office',
    city: city_san_francisco,
    user: user_john,
    image: 'https://img.freepik.com/free-photo/luxury-cottage-old-suburb-illuminated-by-twilight-lighting-generated-by-artificial-intelligence_188544-150345.jpg'
  )
  
  Workspace.create!(
    name: 'SF Downtown - Meeting Room 20p',
    model: 'MR-20p',
    description: 'San Francisco - Downtown. Book a room by the hour for meetings with a capacity of 20 people.',
    address: '#473 Franklin St. SF, CA',
    price: 150.0,
    discount: 5.0,
    category: 'Meeting Room',
    city: city_san_francisco,
    user: user_john,
    image: 'https://www.zillowstatic.com/bedrock/app/uploads/sites/47/strategies-for-finding-cheap-houses-c81cd7.jpg'
  )
  
  Workspace.create!(
    name: 'Dallas Downtown - Meeting Room 10p',
    model: 'MR-10p',
    description: 'Dallas - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 10 people.',
    address: '#387 Johnson St. Downtown, Dallas, TX',
    price: 100.0,
    discount: 15.0,
    category: 'Meeting Room',
    city: city_dallas,
    user: user_jane,
    image: 'https://i.pinimg.com/550x/fc/07/40/fc0740d7c26d93974e117cb88a81bc36.jpg'
  )
  
  Workspace.create!(
    name: 'NY Central Park - Private Office 4p',
    model: 'PO-4p',
    description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 4 persons. Fully furnished.',
    address: '#387 Fifth Ave. MAN, New York City, NY',
    price: 250.0,
    discount: 20.0,
    category: 'Private Office',
    city: city_new_york,
    user: user_edward,
    image: 'https://images.surferseo.art/fdb08e2e-5d39-402c-ad0c-8a3293301d9e.png'
  )
  
  Workspace.create!(
    name: 'NY Central Park - Private Office 8p',
    model: 'PO-8p',
    description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 8 persons. Fully furnished.',
    address: '#387 Fifth Ave. MAN, New York City, NY',
    price: 400.0,
    discount: 25.0,
    category: 'Private Office',
    city: city_new_york,
    user: user_edward,
    image: 'https://s42814.pcdn.co/wp-content/uploads/2024/05/240321-This_Old_House_Raquel_Langworthy_058_V2-scaled-1024x576.jpg.optimal.jpg'
  )
  
  # Create Reservations
  puts "Creating Reservations..."
  start_date = Date.tomorrow
  end_date = start_date + 3.days

  Reservation.create!(
    user: user_john,
    workspace: Workspace.first,
    start_date: start_date,
    end_date: end_date,
    start_time: Time.new(start_date.year, start_date.month, start_date.day, 9, 0, 0),
    end_time: Time.new(end_date.year, end_date.month, end_date.day, 17, 0, 0),
    comments: 'First reservation'
  )

  Reservation.create!(
    user: user_jane,
    workspace: Workspace.last,
    start_date: start_date + 1.day,
    end_date: end_date + 1.day,
    start_time: Time.new(start_date.year, start_date.month, start_date.day, 10, 0, 0),
    end_time: Time.new(end_date.year, end_date.month, end_date.day, 16, 0, 0),
    comments: 'Second reservation'
  )

  puts "Seeding completed successfully!"
end
