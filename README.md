# BugZilla
Bug Tracking Demo Project
command: rails new.

add following to gem file
gem 'devise'
gem "pundit"
gem 'jquery-rails'

command: bundle
command: rails g devise:install
command: rails g devise User
command: rails g devise:views
command: rails g model Projects
command: rails g model Bugs
command: rails g Comments
command: rails g migrations CreateJoinTableUsersProjects Users Projects
command: rails g migrations CreateJoinTableBugsComments Bugs Comments

#active Stroage 
command: rails active_storage:install
