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

  users = [user_john, user_jane, user_edward]

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

  # Fetch all cities for reference
  all_cities = City.all

  # Image URLs provided
  image_urls = [
    'https://img.freepik.com/free-photo/luxury-cottage-old-suburb-illuminated-by-twilight-lighting-generated-by-artificial-intelligence_188544-150345.jpg',
    'https://www.zillowstatic.com/bedrock/app/uploads/sites/47/strategies-for-finding-cheap-houses-c81cd7.jpg',
    'https://i.pinimg.com/550x/fc/07/40/fc0740d7c26d93974e117cb88a81bc36.jpg',
    'https://images.surferseo.art/fdb08e2e-5d39-402c-ad0c-8a3293301d9e.png',
    'https://s42814.pcdn.co/wp-content/uploads/2024/05/240321-This_Old_House_Raquel_Langworthy_058_V2-scaled-1024x576.jpg.optimal.jpg',
    'https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/280229/pexels-photo-280229.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/164558/pexels-photo-164558.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2635038/pexels-photo-2635038.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1438832/pexels-photo-1438832.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2581922/pexels-photo-2581922.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/221540/pexels-photo-221540.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/209296/pexels-photo-209296.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/323775/pexels-photo-323775.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/209315/pexels-photo-209315.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2251247/pexels-photo-2251247.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2119713/pexels-photo-2119713.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2091166/pexels-photo-2091166.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/463734/pexels-photo-463734.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2183521/pexels-photo-2183521.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2360673/pexels-photo-2360673.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/280216/pexels-photo-280216.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2510067/pexels-photo-2510067.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/259646/pexels-photo-259646.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/158730/new-home-construction-retro-design-158730.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2416472/pexels-photo-2416472.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1457841/pexels-photo-1457841.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/434634/pexels-photo-434634.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/65225/boat-house-cottage-waters-lake-65225.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/803975/pexels-photo-803975.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/159869/farmhouse-summer-holiday-holiday-summer-159869.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3016430/pexels-photo-3016430.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3875090/pexels-photo-3875090.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2294125/pexels-photo-2294125.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1105754/pexels-photo-1105754.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2174992/pexels-photo-2174992.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2079626/pexels-photo-2079626.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2888489/pexels-photo-2888489.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1694360/pexels-photo-1694360.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/105829/pexels-photo-105829.jpeg?auto=compress&cs=tinysrgb&w=600'

  ]

  # Predefined categories and models
  categories = ['Private Office', 'Meeting Room', 'Hot Desk', 'Virtual Office', 'Event Space']
  models = {
    'Private Office' => ['PO-2p', 'PO-4p', 'PO-6p', 'PO-8p', 'PO-10p'],
    'Meeting Room' => ['MR-5p', 'MR-10p', 'MR-15p', 'MR-20p', 'MR-25p'],
    'Hot Desk' => ['HD-1p', 'HD-2p', 'HD-3p'],
    'Virtual Office' => ['VO-Basic', 'VO-Premium'],
    'Event Space' => ['ES-50p', 'ES-100p']
  }

  # Helper arrays for generating unique names and addresses
  adjectives = ['Modern', 'Cozy', 'Spacious', 'Elegant', 'Innovative', 'Creative', 'Dynamic', 'Urban', 'Chic', 'Vibrant']
  nouns = ['Hub', 'Space', 'Center', 'Workspace', 'Suite', 'Loft', 'Plaza', 'Nexus', 'Point', 'Zone']
  streets = ['Market St.', 'Broadway', 'Main St.', 'Fifth Ave.', 'Oak St.', 'Pine St.', 'Maple Ave.', 'Cedar Rd.', 'Elm St.', 'Washington Blvd.']

  # Existing Workspaces (optional: keep or remove)
  puts "Creating Initial Workspaces..."
  Workspace.create!(
    name: 'SF Mid Market - Private Office 2p',
    model: 'PO-2p',
    description: 'San Francisco - Mid Market. Move-in ready office, capacity of 2 persons. Fully furnished.',
    address: '#1005 Market St. SF, CA',
    price: 200.0,
    discount: 10.0,
    category: 'Private Office',
    city: City.find_by!(name: 'San Francisco'),
    user: user_john,
    image: image_urls.sample
  )
  
  Workspace.create!(
    name: 'SF Downtown - Meeting Room 20p',
    model: 'MR-20p',
    description: 'San Francisco - Downtown. Book a room by the hour for meetings with a capacity of 20 people.',
    address: '#473 Franklin St. SF, CA',
    price: 150.0,
    discount: 5.0,
    category: 'Meeting Room',
    city: City.find_by!(name: 'San Francisco'),
    user: user_john,
    image: image_urls.sample
  )
  
  Workspace.create!(
    name: 'Dallas Downtown - Meeting Room 10p',
    model: 'MR-10p',
    description: 'Dallas - Downtown. Book a room by the hour for meeting clients and co-workers. Capacity of 10 people.',
    address: '#387 Johnson St. Downtown, Dallas, TX',
    price: 100.0,
    discount: 15.0,
    category: 'Meeting Room',
    city: City.find_by!(name: 'Dallas'),
    user: user_jane,
    image: image_urls.sample
  )
  
  Workspace.create!(
    name: 'NY Central Park - Private Office 4p',
    model: 'PO-4p',
    description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 4 persons. Fully furnished.',
    address: '#387 Fifth Ave. MAN, New York City, NY',
    price: 250.0,
    discount: 20.0,
    category: 'Private Office',
    city: City.find_by!(name: 'New York City'),
    user: user_edward,
    image: image_urls.sample
  )
  
  Workspace.create!(
    name: 'NY Central Park - Private Office 8p',
    model: 'PO-8p',
    description: 'New York City - Central Park - Manhattan. Move-in ready office, capacity of 8 persons. Fully furnished.',
    address: '#387 Fifth Ave. MAN, New York City, NY',
    price: 400.0,
    discount: 25.0,
    category: 'Private Office',
    city: City.find_by!(name: 'New York City'),
    user: user_edward,
    image: image_urls.sample
  )

  # Create Additional Workspaces to reach a total of 50
  puts "Creating Additional Workspaces..."

  total_existing = Workspace.count
  desired_total = 50
  workspaces_to_create = desired_total - total_existing

  workspaces_to_create.times do |i|
    # Randomly select category
    category = categories.sample
    model = models[category].sample

    # Generate unique name
    adjective = adjectives.sample
    noun = nouns.sample
    city = all_cities.sample
    name = "#{city.name} #{adjective} #{noun} #{i + 1}"

    # Generate address
    street = streets.sample
    address_number = rand(100..999)
    address = "##{address_number} #{street}, #{city.name}, #{city.state.abbrev}"

    # Generate price and discount based on category
    case category
    when 'Private Office'
      price = rand(150..500).to_f
      discount = rand(5..30).to_f
    when 'Meeting Room'
      price = rand(80..300).to_f
      discount = rand(5..20).to_f
    when 'Hot Desk'
      price = rand(50..200).to_f
      discount = rand(0..10).to_f
    when 'Virtual Office'
      price = rand(100..250).to_f
      discount = rand(10..25).to_f
    when 'Event Space'
      price = rand(300..1000).to_f
      discount = rand(15..35).to_f
    else
      price = 100.0
      discount = 10.0
    end

    # Assign a random user
    user = users.sample

    # Assign a random image
    image = image_urls.sample

    # Create Workspace
    Workspace.create!(
      name: name,
      model: model,
      description: "#{city.name} - #{category}. #{adjective} and fully equipped space suitable for #{category.downcase}.",
      address: address,
      price: price,
      discount: discount,
      category: category,
      city: city,
      user: user,
      image: image
    )
  end

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
