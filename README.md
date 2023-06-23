# Shopping List
This is a simple webapp which people can use to keep track of a shopping list.

## Key Features:
- Add an item to the shopping list
- View the whole shopping list
- Delete an individual item from the shopping list
- Delete the entire shopping list with a single button click (without needing to delete each individual item one by one) 
- Login with a Google account
- Shopping list persists between logins

## Additional Features:
- Search items on the shopping list
- Filter shopping list based on categories
- Drag and drop items to sort shoppping list
- Save or unsave an individual item on the list
- View only saved items on a seperate page
- Unsave all items on the saved list
- Sign up to make a new account without a Google Account

## Future Plans
Besides the issues below, there are few more features I want to build:
- [ ] Update schema so that users has many lists which has many items which has many bookmarks, and users has many bookmarks
- [ ] Allow users to add their own profile photo on sign up if they are not using a Google Account
- [ ] Add a description which toggles down when you click an item card
- [x] Add categories to the item's model so that the list can be filtered based on item type (e.g. Groceries, Clothes, Toiletries, Electronics etc)
- [ ] Add a web scraper so that people can search and add items from the internet

### Known Issues
- Get the turbo alert to pop up before deleting all items to confirm if the user is sure they want to delete all items
- Prevent the deletion of the saved list when deleting items from the shopping list
- Prevent redirection to shopping list page when unsaving or deleting items on the saved list page

## Preview
<img width="1728" alt="Screenshot 2023-06-23 at 13 31 18" src="https://github.com/Project-Assignments/project19SA/assets/114405652/03f6d1fe-59ab-4d23-8400-b8e95e5b3ab1">
<img width="1728" alt="Screenshot 2023-06-23 at 13 32 18" src="https://github.com/Project-Assignments/project19SA/assets/114405652/29a74341-1407-42c8-833f-8d146e06877c">
<img width="1728" alt="Screenshot 2023-06-23 at 13 32 33" src="https://github.com/Project-Assignments/project19SA/assets/114405652/0543e288-055d-4e05-bf9c-7db42498c6bf">
<img width="1728" alt="Screenshot 2023-06-23 at 13 32 45" src="https://github.com/Project-Assignments/project19SA/assets/114405652/d92ca697-db7a-4bee-b6f5-2c2932cd0b81">
<img width="1728" alt="Screenshot 2023-06-23 at 13 35 04" src="https://github.com/Project-Assignments/project19SA/assets/114405652/6cdf6e0f-a891-44dc-88d2-5e625e423dd2">

## Setup:
- Clone project
```
mkdir ~/code/Project-Assignments
cd ~/code/Project-Assignments
git clone git@github.com:Project-Assignments/project19SA.git
cd project19SA
cd shopping-list
```
- Check ruby version using the following command (should be version 3.1.2)
```
ruby -v
```
- Install gems and all dependencies
```
bundle install
yarn install
```
- Create database and migrate the schema
```
rails db:create db:migrate 
```
- Run the server:
```
bin/rails s
```
- #### Go to http://localhost:3000/ to view the app

## Thank you!
Thank you for inviting me to this stage of the process. I really enjoyed building this webapp! I look forward to presenting and discussing it during the interview, and to receiving feedback on what can be improved.
 
 
