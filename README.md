# Final Capstone Project's API

This is part of Microverse's final capstone project.

In this repository, I build an API with data for dragon flying instructors, classes, and user profiles based in the characters of [How to Train Your Dragon][httyd] series.

## Table of contents

- [Final Capstone Project's API](#final-capstone-projects-api)
  - [Table of contents](#table-of-contents)
  - [About](#about)
  - [The back-end API](#the-back-end-api)
    - [Data in the user table](#data-in-the-user-table)
    - [Data in instructors table](#data-in-instructors-table)
    - [Data in fly_classes table](#data-in-flyclasses-table)
    - [How to use it](#how-to-use-it)
      - [End points](#end-points)
    - [Technologies used](#technologies-used)
  - [Contact](#contact)
  - [Acknowledgments](#acknowledgments)


## About

The project's goal was to create a book of appointment. The back-end should be a REST API done with Ruby on Rails. The front-end should be done with React and Redux. This README will be focused on the API. For more details about the project visit the front-end's repository.

The project's assignment can be seen [here][assignment].

The front-end repository can be found [here][front-end].

Link to a live version [here][live-version].

Repository: https://github.com/phalado/final-capstone-api/


## The back-end API

The back-end consists of an API that receives a message and answers it with data from a database. The database is composed of three tables, to know, one for user data, one for instructors data, and one for classes.


### Data in the user table

* name
* email
* password_digest


### Data in instructors table

* name
* dragonType
* dragonName
* instImage - Instructor's image
* dragonImage - Dragon's image


### Data in fly_classes table

* classTime
* instructor_id
* status - Boolean (not used)
* user_id


### How to use it

Base URL: https://dragon-test-drive-api.herokuapp.com


#### End points

*/users*

* **GET** - to receive an object with all users
* **POST** - to create a new user - with parameters:
  * name
  * email
  * password
  * password_confirmation

*/users/:id*

* **PATCH** - to edit a user - with parameters:
  * name
  * email
  * password
  * password_confirmation
* **GET** - to receive a specific user's data
* **DELETE** - to delete a user

*/login*

* **GET** - to check login parameters - with parameters:
  * email
  * password

*/instructors*

* **GET** - to receive an object with all users
* **POST** - to create a new instructor - with parameters:
  * name
  * instImage
  * dragonName
  * dragonType
  * dragonImage

*instructors/id*

* **GET** - to receive a specific instructor's data

*/fly_classes*

* **GET** - to receive an object with all the classes
* **POST** - to create a new class - with parameters:
  * instructor_id
  * user_id
  * classTime
  * status

*fly_classes/:id*

* **DELETE** - to delete a specific class


### Technologies used

To create this project I used:

* Ruby on Rails
* bcrypt gem
* Heroku
* Postgresql
* rspec


## Contact

Author: Raphael Cordeiro

Follow me on [Twitter][rapha-twitter],  visit my [Github portfolio][rapha-github], my [Linkedin][rapha-linkedin] or my [personal portfolio][rapha-personal].


## Acknowledgments

[Microverse][mcvs]

I have no business rights about the characters used in this API. This is only for learning purposes. All characters belong to [DreamWorks][httyd].



<!-- Links -->
[assignment]: https://www.notion.so/Final-Capstone-Project-Book-an-Appointment-41ded2ee99ff4fe4becf91acb332ca26
[live-version]: https://features--berksacademy.netlify.app/
[front-end]: https://github.com/phalado/final-capstone
[httyd]: https://www.dreamworks.com/how-to-train-your-dragon
[mcvs]: https://www.microverse.org/
[rapha-github]: https://github.com/phalado
[rapha-twitter]: https://twitter.com/phalado
[rapha-linkedin]: https://www.linkedin.com/in/raphael-cordeiro/
[rapha-personal]: https://phalado.github.io/