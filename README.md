<p align="center">
  <img src="http://evolsports.com.au/wp-content/uploads/2016/06/shopping-cart-logo-icon-70706.png" width="150" height="150" alt="Adop Shop logo"/>
</p>

# Little Shoppe 

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)


A brownfiled project where an existing e-commerce store was turned multitenant. Users are able to browse items from multiple stores, add them to their cart, and check out with stripe. Admins of stores are also able to view a variety of analytics to help drive increased sales.  

## Getting Started


These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have rails installed, if not:

```
gem install rails 
```

### Installing

To get up and running in your browser clone this repo 

Install the dependenices

```
bundle install 
```

Create the database

```
rails db:create
```

Run the migrations

```
rails db:migrate
```

Start the server

```
rails server
```

Visit localhost:3000 in your browser to start exploring out stores

## Running the tests

Install the dependencies

```
bundle install
```

Run rspec

```
rspec
```


### Test Example

Each test ensures working functionality for a particular user story. 

```
context "As an authenticated store manager" do
    it "I can create an item" do
      store = create(:store)
      manager = create(:store_manager, store: store)
      role = Role.create(title: "store_manager")
      create(:user_role, user: manager, role: role)
      create(:item)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(manager)

      visit admin_store_items_path(store)
      click_on "Create New Item"
      fill_in "item[title]", with: "Onesie"
      fill_in "item[description]", with: "This Onesie is awesome!"
      fill_in "item[price]", with: "59.99"
      page.attach_file("item[image]", testing_image)
      click_on "Submit"

      expect(current_path).to eq(admin_store_items_path(store))
      expect(page).to have_content("Onesie")
      expect(page).to have_content("59.99")
    end
end 
```

## Built With

* [Rails](https://github.com/rails/rails) 
* [Bootstrap](https://github.com/twbs/bootstrap-rubygem) 

## Versioning

Version 1.0

## Authors

* **Nico Lewis** [contact](https://github.com/nico24687)
* **Lauren Billington** [contact](https://github.com/blaurenb)
* **Kelley Jenkins** [contact](https://github.com/kelleyjenkins)

## License

This project is licensed under the MIT License 


