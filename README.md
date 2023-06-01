# Shopping List
This is a simple webapp which people can use to keep track of a shopping list.

## Key Features:
- Add an item to the shopping list
- View the whole shopping list
- Delete an individual item from the shopping list
- Delete the entire shopping list, with a single button click (without needing to delete each individual item one by one) 
- Login with a Google account
- Shopping list persists between logins

## Addional Features:
- Search items on the shopping list
- Drag and drop items to sort shoppping list
- Save or unsave an indvidual item on the list
- Unsave all items on the saved list
- Sign up to make a new account without a Google Account

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
- Go to http://localhost:3000/ to view the app

## Thank you
Thank you for inviting me to this stage of the process. I really enojoyed building this webapp! I look forward to presenting it during the interview and to receiving feedback on what can be improved.
 
 
