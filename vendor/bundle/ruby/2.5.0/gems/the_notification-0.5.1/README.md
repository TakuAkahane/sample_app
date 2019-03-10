## TheNotification

Just add JSON on HTML notifications in your APP

Designed for Bootstrap 3 style of for toastr notifications

## How it works

Just remove

```ruby
<%= form_for(@resource) do |f| %>
  <% if @resource.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@resource.errors.count, "error") %> prohibited this resource from being saved:</h2>

      <ul>
      <% @resource.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  # ....

<% end %>
```

with

```ruby
<%= form_for(@post) do |f| %>
  <%= render partial: 'the_notification/form', locals: { object: @post } %>

  # ....

<% end %>
```

and add to Layout

```ruby
<body>    
  <%= render partial: 'the_notification/flash' %>
  <%= yield %>
```

*application.css*
```js
*= require bootstrap
*= require the_notification/vendors/toastr
```

*application.js*
```js
//= require the_notification/vendors/toastr
//= require the_notification

$ ->
  TheNotification.show_notifications()
```

### HTML or JSON

```erb
<%= render partial: 'the_notification/flash', locals: { format: :html } %>
<%= render partial: 'the_notification/form', locals: { object: @post, format: :html } %>
```

or

```erb
<%= render partial: 'the_notification/flash', locals: { format: :json } %>
<%= render partial: 'the_notification/form', locals: { object: @post, format: :json } %>
```

*initializers/the_notification.rb*
```ruby
TheNotification.configure do |config|
  config.default_type = :json # :html
end
```

### Localized errors

*models/user.rb*
```ruby
class Post < ActiveRecord::Base
  include TheNotification::LocalizedErrors
end
```

*config/locales/ru.yml*
```
activerecord:
  models:
    post: Публикация
  attributes:
    post:
      title: "Загловок"
```

Now errors messages will looks like this:

```
Загловок: не может быть пустым
```

instead

```
Title: не может быть пустым
```

### Installation

```ruby
gem 'the_notification'
```

```sh
$ bundle
```

### Usage

TODO: Write usage instructions here
