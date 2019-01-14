#Sea Learner

This project is created by [Christine Gomez](https://www.linkedin.com/in/christine-gomez/).

Click [here](https://www.youtube.com/watch?v=y-aZkFSJ6pU) for a demo video.

Sea Learner users React/Redux for its frontend and uses Ruby on Rails for its backend.

Sea Learner is a childrens app designed for a child to become familiar with using a keyboard and pronouncing words. It tests a childs ability to identify colors, shapes, numbers, etc.

##Running The Application
- First, you'll want to clone this repository along with the [frontend](https://github.com/christine1226/SeaCards).
- Next, you'll have to run an `npm install` in the frontend
- Make sure to run  `bundle install` and  `rails db:migrate` in this repository
- Then, you will want to run `rails s` in this repository
- Once the backend server is running you'll want to run `json-server --watch db.json -p30003` on the frontend
- Finally, you will be able to run `npm start` on the frontend repository as well. You'll be asked if you'd like to run a server on a different port where you can type in Y and hit enter. Your server will run and you'll be able to use the app.
