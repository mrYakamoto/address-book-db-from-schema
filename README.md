# Address Book Db From Schema 
 
##Learning Competencies 

* Use sqlite gem to create a database using Ruby commands
* Use sqlite gem to perform CRUD operations on tables in a database using Ruby commands

## Summary 

 Let's build an address book so we can keep track of all the awesome programmers we know. 

Revisit (**or do if you have not already**) the [Address Book Schema]( https://github.com/sea-lions-2014/db-drill-address-book-schema-challenge)  and write a ruby program to create Objects to represent the address book and create the database  `address_book.db`

##Releases

###Release 0 : Create the address_book database

Create the SQL Schema that represents your database tables.  Then, create a file called  `setup.rb` which you will run only once and will create your database.  All other parts of your code will assume that the database has already been created.

Next, load some initial records into this database from hardcoded SQL statements.  This code should also be in `setup.rb`.

**Extra Credit**: Instead of hardcoding your insert statements, create a csv/YAML/JSON file with the data and import it.

###Release 1 : Build the Ruby classes

First,  create classes that correspond to your tables, e.g., a "contacts" table corresponds to a Contact class.  These classes should have methods that allow you to add, delete, update records in the database. 

It should work as follows:

```ruby
contact = Contact.new(:name => "Alex")
contact.id # nil
contact.save # This executes an INSERT statement and makes a new record
contact.id # e.g., 20

contact.name = "Bob"
contact.save # This executes an UPDATE statement
```

Note, you will also need to allow your classes to have access to your database.  There are several ways to do this, but an easy way would be just to create a global variable that is accessible in all of your classes.  (this is fine for now we'll get into more OO approaches later).

```ruby
$db = SQLite3::Database.new "address_book.db"
```
###Release 2 : Work with the address_book database using Ruby

Next, create driver code and additional methods in your code that allows you to complete the following tasks.

<ol start="0"><li>Add a contact</li>
<li>Add a group</li>
<li> Change a contact address </li>
<li> Delete a contact </li>
<li> Delete a group - careful here - what does this mean? What implications does it (should it) have on your data? </li>
</ol>

###Release 3 :  Data validation
Input from users is "Dangerous".  What if they give you a phone number with 17 digits? How about an address without a state? How does your database handle this?  How does your Ruby code handle this?

These are complex questions.  Come up with a plan to work with phone numbers (must have a valid format) and email addresses (must have a valid format and be unique).  

Implement this plan in your code.  


<!-- ##Optimize Your Learning  -->

##Resources

* [Ruby gem for SQLite](https://github.com/luislavena/sqlite3-ruby)
* [SQLite 3](http://sqlite-ruby.rubyforge.org/sqlite3)