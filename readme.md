# Dynamicfields extension for Refinery CMS.

This plugins allows to create models dynamically and attach them to pages in order to request customizable information and to present it lately on the front-end.

## Instalation instructions

Add the gem to your Gemset file

			gem 'refinerycms-dynamicfields', :git => 'https://github.com/jfalameda/refinerycms-dynamicfields.git'

Run the plugin installation command
	rails generate refinery:dynamicfields

Rum the migrations
	rails db:migrate

Now a new tab with the name "Dynamic fields" will appear on the backend. There is where you create the models that will be attached to the pages.

IMPORTANT! Remember to activate the page_views on the configuration file. To to this, go to the file config/initializers/refinery/pages.rb and comment out the following lines:
	config.view_template_whitelist = ["home", "show"]
  config.use_view_templates = false
The reason to do this is because the models can be attached to the pages based on an ID or to their templates, so a model would be used on all the pages using a certain view template.


