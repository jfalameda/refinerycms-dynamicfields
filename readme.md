# Dynamicfields extension for Refinery CMS.

This plugin allows you to create models dynamically and attach them to pages in order to request customizable information and to present it later on the front-end.

Author: José Fernández Alameda.
This plugin still is still in beta and bugs might be found. Please report!

![Plugin image](http://josealameda.se/dynamicfields/tab.png "Plugin image")

## Installation instructions

Add the gem to your Gemfile:

```ruby
gem 'refinerycms-dynamicfields', :git => 'https://github.com/jfalameda/refinerycms-dynamicfields.git'
```

Run the plugin installation command

```shell
rails generate refinery:dynamicfields
```

Run the migrations

```shell
rake db:migrate
```

Now a new tab with the name "Dynamic fields" will appear on the Refinery backend. There is where you create the models that will be attached to the pages.

IMPORTANT! Remember to activate the `page_views` on the configuration file. To do this, go to the file `config/initializers/refinery/pages.rb` and comment out the following lines:

```ruby
config.view_template_whitelist = ["home", "show"]
config.use_view_templates = true
```

The reason to do this is because the models can be attached to the pages based on an ID or to their templates, so a model would be used on all the pages using a certain view template.

## Creating a model and attaching it to a page

1. Create a page and save it.
2. Go to the "Dynamic fields" tab on the administration page
3. Create a new dynamicfield.
4. Select the `page_id` on the criteria section and select the page where the model will be attached on the list
5. Fill the model name and create a few fields, set up a name and an id for them.
6. Save the dynamicform.
7. Now, edit the page we chose to attach the model to and on the "Custom fields" tab the form will be displayed.
8. Enjoy, report bugs and collaborate!

![Plugin image](http://josealameda.se/dynamicfields/page_tab.png "Plugin image")

## Retrieve the filled fields on the template

In order to retrieve the custom filled information, a helper is provided:

```erb
<% get_field("field_id") %>
```

Examples

```erb
<p>
	<span>Image field</span>
	<%= image_fu get_field("hero"), "300x300" %>
</p>
<p>
	<span>Textarea</span>
	<%= get_field("hero_text") %>
</p>
<p>
	<span>WYSIWYG field</span>
	<%= raw get_field("bigtext") %>
</p>
<p>
	<span>Text field</span>
	<%= get_field("facebook_like_url") %>
</p>
<p>
	<span>Resource text (file)</span>
	<%= link_to "Download PDF file", get_field("pdf_file").url %>
</p>
```
