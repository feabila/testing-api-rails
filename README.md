# API Rails

### To install dependencies: 
- bundle install

### To check possible routes: 
- rails routes

### To run API server local: 
- rails s

#### Ruby version: 2.6.0

#### System dependencies: 
    * Rails 6.0.3
    * SQLite3
    * Puma
    * Bootsnap
    * byebug
    * Tests: rspec-rails, factory_bot_rails, shoulda-matchers, faker, database_cleaner

#### Database creation
    * create_table "authors", force: :cascade do |t|
        * t.string "first_name"
        * t.string "last_name"
        * t.datetime "created_at", precision: 6, null: false
        * t.datetime "updated_at", precision: 6, null: false
    * end   
    
    * create_table "books", force: :cascade do |t|
        * t.string "title"
        * t.string "description"
        * t.integer "author_id", null: false
        * t.datetime "created_at", precision: 6, null: false
        * t.datetime "updated_at", precision: 6, null: false
        * t.index ["author_id"], name: "index_books_on_author_id"
    * end
    
    * add_foreign_key "books", "authors"

#### How to run the tests rspec
    * bundle exec rspec

#### ...
