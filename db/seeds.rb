require 'date'

puts "Seeding database with initial data..."

ActiveRecord::Base.transaction do
  # Clear existing data (optional if you want a clean slate each time)
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

  # Fetch some cities for reference (for reservations)
  city_san_francisco = City.find_by!(name: 'San Francisco', state: state_california)
  city_dallas = City.find_by!(name: 'Dallas', state: state_texas)

  # Create Workspaces
  puts "Creating Workspaces..."
  # Assigning user_john, user_jane, and user_edward as owners
  workspace_sf_po2 = Workspace.create!(
    name: 'SF Mid Market - Private Office 2p',
    model: 'PO-2p',
    description: 'San Francisco - Mid Market. Move-in ready office, capacity of 2 persons. Fully furnished.',
    address: '#1005 Market St. SF, CA',
    price: 0,
    image: 'https://img.freepik.com/free-photo/luxury-cottage-old-suburb-illuminated-by-twilight-lighting-generated-by-artificial-intelligence_188544-150345.jpg',
    discount: 0,
    category: '',
    user: user_john
  )

  workspace_sf_po4 = Workspace.create!(
    name: 'SF Mid Market - Private Office 4p',
    model: 'PO-4p',
    description: 'San Francisco - Mid Market. Move-in ready office, capacity of 4 people. Fully furnished.',
    address: '#1005 Market St. SF, CA',
    price: 0,
    image: 'https://www.zillowstatic.com/bedrock/app/uploads/sites/47/strategies-for-finding-cheap-houses-c81cd7.jpg',
    discount: 0,
    category: '',
    user: user_john
  )

  workspace_sf_mr20 = Workspace.create!(
    name: 'SF Downtown - Meeting Room 20p',
    model: 'MR-20p',
    description: 'San Francisco - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 20 people.',
    address: '#473 Franklin St. SF, CA',
    price: 0,
    image: 'https://rdcnewsadvice.wpengine.com/wp-content/uploads/2018/08/Indianapolis-IN-home.jpg',
    discount: 0,
    category: '',
    user: user_john
  )

  workspace_dallas_mr10 = Workspace.create!(
    name: 'Dallas Downtown - Meeting Room 10p',
    model: 'MR-10p',
    description: 'Dallas - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 10 people.',
    address: '#387 Johnson St. Downtown, Dallas, TX',
    price: 0,
    image: 'https://i.pinimg.com/550x/fc/07/40/fc0740d7c26d93974e117cb88a81bc36.jpg',
    discount: 0,
    category: '',
    user: user_jane
  )

  workspace_dallas_po4 = Workspace.create!(
    name: 'Dallas Downtown - Private Office 4p',
    model: 'PO-4p',
    description: 'Dallas - Downtown. Move-in ready office, capacity of 4 people. Fully furnished.',
    address: '#387 Johnson St. Downtown, Dallas, TX',
    price: 0,
    image: 'https://cdn.habitusliving.com/wp-content/uploads/2024/02/1.smallmodhomesFEAT.jpg',
    discount: 0,
    category: '',
    user: user_jane
  )

  workspace_ny_po4 = Workspace.create!(
    name: 'NY Central Park - Private Office 4p',
    model: 'PO-4p',
    description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 4 persons. Fully furnished.',
    address: '#387 Fifth Ave. MAN, New York City, NY',
    price: 0,
    image: 'https://images.surferseo.art/fdb08e2e-5d39-402c-ad0c-8a3293301d9e.png',
    discount: 0,
    category: '',
    user: user_edward
  )

  workspace_ny_po8 = Workspace.create!(
    name: 'NY Central Park - Private Office 8p',
    model: 'PO-8p',
    description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 8 persons. Fully furnished.',
    address: '#387 Fifth Ave. MAN, New York City, NY',
    price: 0,
    image: 'https://s42814.pcdn.co/wp-content/uploads/2024/05/240321-This_Old_House_Raquel_Langworthy_058_V2-scaled-1024x576.jpg.optimal.jpg',
    discount: 0,
    category: '',
    user: user_edward
  )

  # Create Reservations
  puts "Creating Reservations..."
  start_date = Date.tomorrow
  end_date = start_date + 3.days

  reservation1 = Reservation.create!(
    user: user_john,
    workspace: workspace_sf_po2,
    date_reserved: Date.today,
    date_cancelled: nil,
    start_date: start_date,
    end_date: end_date,
    start_time: Time.new(start_date.year, start_date.month, start_date.day, 9, 0, 0, "-06:00"), # 9:00 am local time
    end_time: Time.new(end_date.year, end_date.month, end_date.day, 17, 0, 0, "-06:00"), # 5:00 pm local time
    city: city_san_francisco,
    comments: "Test reservation 1 - User John - SF Private Office 2p"
  )

  reservation2 = Reservation.create!(
    user: user_jane,
    workspace: workspace_dallas_mr10,
    date_reserved: Date.today,
    date_cancelled: nil,
    start_date: start_date,
    end_date: end_date,
    start_time: Time.new(start_date.year, start_date.month, start_date.day, 9, 0, 0, "-06:00"), # 9:00 am local time
    end_time: Time.new(end_date.year, end_date.month, end_date.day, 17, 0, 0, "-06:00"), # 5:00 pm local time
    city: city_dallas,
    comments: "Test reservation 2 - User Jane - Dallas Meeting Room 10p"
  )

  puts "Seeding completed successfully!"
end
