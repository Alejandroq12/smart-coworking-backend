# Seeds file to create initial data for the database tables

user1 = User.create(name: 'John Smith', email: 'johnsmith@gmail.com', password: 'me1234', role: 'default')
user2 = User.create(name: 'Jane Summer', email: 'janesummer@gmail.com', password: 'me1234', role: 'default')
user3 = User.create(name: 'Edward Stone', email: 'edwardstone@gmail.com', password: 'me1234', role: 'admin')
