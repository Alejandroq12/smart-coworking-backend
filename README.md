## Smart Coworking - Back-end

<a name="readme-top"></a>
<div align="center">
    <img src="/logo-julio.png" alt="main-logo" width="500"  height="auto" />
  <br/>
  <h3><b>Smart Coworking - Back-end</b></h3>
</div>
📗 Table of Contents <a name="table_of-contents"></a>

- [Smart Coworking - Back-end](#smart-coworking---back-end)
- [📖 About project - Smart Coworking - Back-end ](#-about-project---smart-coworking---back-end-)
- [📖 KANBAN BOARD - Book An Appointment Web App - Ruby on Rails Back-End ](#-kanban-board---book-an-appointment-web-app---ruby-on-rails-back-end-)
- [🛠 Built With ](#-built-with-)
  - [Tech Stack ](#tech-stack-)
  - [Key Features ](#key-features-)
- [💻 Getting Started ](#-getting-started-)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Database](#database)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Check linters](#check-linters)
- [👥 Authors ](#-authors-)
- [🔭 Future Features ](#-future-features-)
- [🤝 Contributing ](#-contributing-)
- [⭐️ Show your support ](#️-show-your-support-)
- [🙏 Acknowledgments ](#-acknowledgments-)
- [❓ FAQ ](#-faq-)
- [📝 License ](#-license-)

## 📖 About project - Smart Coworking - Back-end <a name="about-project"></a>

TSmart Coworking is a full-stack web application developed with Ruby on Rails & React. This project represents the back-end part of the complete project, developed with Ruby on Rails. The front-end part is developed in another repository, using React.js and Redux.

Front-end link: https://github.com/Alejandroq12/smart-coworking-frontend

Back-end link: https://github.com/Alejandroq12/smart-coworking-backend

## 📖 KANBAN BOARD - Book An Appointment Web App - Ruby on Rails Back-End <a name="kanban-board"></a>

- Number of team members: 3 (Julio Alejandro Quezada, Kazim Mohammadi, Juan Carlos Muñoz)

- Link to our Kanban Board: https://github.com/users/jcmunav63/projects/6/views/1

- Links to 2 images that show our Kanban Board at the beginning...
  - First image (Kanban Board - table view) https://drive.google.com/file/d/1ZEWuTbIN_ITMl13PYAsZh3aQ4zbOEOJT/view?usp=drive_link

  - Second image (Kanban Board - table view) https://drive.google.com/file/d/132tbQEmSjXSmgK0uiCKLVfwkUYCtLdNi/view?usp=drive_link


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

  <ul>
    <li><a href="https://ruby-doc.org/">Ruby v 3.2.2</a></li>
    <li><a href="https://rubyonrails.org/">Rails v 7.1.2</a></li>
    <li><a href="https://www.postgresql.org/">PostgreSQL v 16.1.1</a></li>
  </ul>

### Key Features <a name="key-features"></a>
- **Set up a Ruby on Rails project together with React.js as the front-end.**
- **Set up linters using Stylelint and Rubocop**
- **Connect the Rails project to a PostgreSQL database.**
- **Set up a User model, a controller, and the corresponding database table.**
- **Configure an API endpoint to request the users data from the front-end application.**
- **Implement all API endpoints to request data about: Users, Coworking Spaces, Reservations, Cities, States.**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)

[Set Up Rails](https://www.ruby-lang.org/en/documentation/installation/)

Prerequisites: Ruby, Ruby Development Kit (for Windows), Ruby Gems packaging system, and PostgreSQL database server. Run the following commands...
```sh
$ gem install rails
```

### Setup

```sh
  cd my-folder
  git clone https://github.com/Alejandroq12/smart-coworking-backend.git
```

### Install

This project requires the following dependencies: the Ruby interpreter, the Gem package manager, the Ruby on Rails web framework, a PostgreSQL database server, the Webpack JS module bundler, the jsbundling-rails gem, and two linters checkers: RuboCop (Ruby) and Stylelint (CSS styles).

```sh
bundle install
```
a
### Database


```sh
sudo service postgresql start
```

Create database:

```sh
rails db:create
```

Run migrations:

```sh
rails db:migrate
```

Add the seeds:

```sh
rails db:seed
```

### Usage

To run the project, navigate to the project directory and execute the following command:

Start the Ruby on Rails web server (Puma server) typing the following command...
```sh
  rails server
```
or

```sh
  rails s
```
### Run tests
To execute all test suites in the application, use the following command in your terminal:

```sh
rspec
```

### Check linters

* Install the Rubocop and Stylelint linters.

Install the Rubocop linters checker using the following steps...
- First add the following code to the Gem file:
```sh
gem 'rubocop', '>= 1.0', '< 2.0'
```
- Second run the command to install dependicies in your project:
```sh
bundle install
```
- Remember to copy the .rubocop.yml file to your root directory.

gem 'rubocop', '>= 1.0', '< 2.0'

- Copy the linters.yml file inside of path .github/workflows


To run LINTERS, run the following command:

Run the following command for Ruby code...
```sh
rubocop
```

* Unit, request, and integration tests will be developed on another stage.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Juan Carlos Muñoz**

- GitHub: [@jcmunav63](https://github.com/jcmunav63)
- Twitter: [@jcmunav63](https://twitter.com/jcmunav63)
- LinkedIn: [@juan-carlos-muñoz](https://www.linkedin.com/in/juan-carlos-mu%C3%B1oz-5a15b6276/)

👤 **Kazim Mohammadi**

- GitHub: [@kazim110](https://github.com/kazim110)
- Twitter: [@kazim471](https://twitter.com/kazim471)
- LinkedIn: [@Kazim Mohammadi](https://www.linkedin.com/in/kazim-mohammadi/)

👤 **Julio Alejandro Quezada**

- GitHub: [Alejandroq12](https://github.com/Alejandroq12)
- Twitter: [@JulioAle54](https://twitter.com/JulioAle54)
- LinkedIn: [Julio Quezada](https://www.linkedin.com/in/quezadajulio/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- *** Implement other functionalities, like authorization.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please give me a star on Github. Thanks in advance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

* We would like to acknowledge that our application is based on Murat Korkmaz application design called "Vespa - Responsive Redesign", which is open for use under the [Creative Commons license](https://creativecommons.org/licenses/by-nc/4.0/). You can find this design on [Behance](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign). We are very grateful to Murat Korkmaz for his excellent contribution.

* We would like to thank our colleagues, who inspire us to do our best everyday.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

**Did you create this project from scratch?**

  - It is a complete Ruby on Rails project on the backend with connection to React.js and Redux.js on the frontend. It uses two repos, this one for the back-end and another one for the front-end.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
