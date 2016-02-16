# ABOUT THIS FILE
# This file establishes the initial schema and any seed data.
# It should be run directly from the command line *once*.
# Rerunning it will destroy the existing database.
#

gem 'sqlite3'
require 'sqlite3'
require 'fileutils'

database_file = "address_book.sqlite3"
FileUtils.rm(File.expand_path('./'+database_file)) rescue nil
$db = SQLite3::Database.new(database_file)

# TODO: set up your schema here

$db.execute("CREATE TABLE contacts (
  'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  'first_name' VARCHAR(64) DEFAULT NULL,
  'last_name' VARCHAR(64) DEFAULT NULL,
  'company' VARCHAR(64) DEFAULT NULL,
  'phone_number' VARCHAR(64) DEFAULT NULL,
  'email' VARCHAR(64) DEFAULT NULL,
  'created_at' DATETIME NOT NULL,
  'updated_at' DATETIME NOT NULL);")

$db.execute("CREATE TABLE contacts_groups (
  'group_id' INTEGER NOT NULL,
  'contact_id' INTEGER NOT NULL);")

$db.execute("CREATE TABLE groups (
  'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  'name' VARCHAR(64) NOT NULL,
  'created_at' DATETIME NOT NULL,
  'updated_at' DATETIME NOT NULL);")

# TODO: set up any initial data here

$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Mr.', 'Hand', 'Globotech', '(123)123-1245', 'handsy@aol.com', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Stan', 'Marsh', 'GE', '(555)555-5555', 'smarsh@aol.com', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Kyles', 'Mom', 'Chik-fil-a', '(666)666-6666', 'handsy@aol.com', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Mr.', 'Hanky', 'Santa Claus', '(777)777-7777', 'hanksy@yahoo.com', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Mr.', 'Garrison', 'South Park Elementary', '(888)888-8888', 'Leatherman@gmail.com', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Chef', 'Isaac', 'Def Jam', '(999)999-9999', 'BigLove100@gmail.com', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Eric', 'Cartman', 'Cheesy Poofs', '(111)111-1111', 'ecartman@comcast.com', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'company', 'phone_number', 'email', 'created_at', 'updated_at')
  VALUES ('Big', 'Al', 'Fabulosity', '(222)222-2222', 'fabulous1@me.com', DATETIME('now'), DATETIME('now'));")
















