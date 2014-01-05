# SimplestView

SimplestView splits up views and templates in a Rails 3 application to make it easier to improve the code quality therein.
This happens by replacing the anonymous class that inherits from ActionView::Base with your own view class.
This view class becomes the context within your existing rails templates.

_CAVEAT EMPTOR: Works with rails 3, but lacking specs._

## Installation

Add this line to your application's Gemfile:

    gem 'simplest_view'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplest_view

## Usage

1. Inside of your `ApplicationController` or a specific controller: `include SimplestView`
2. Inside of any Mailers you have (inherited from ActionMailer::Base): `include SimplestView`
3. `mv app/views app/templates`
4. mkdir app/views
5. append `app/views` to the Rails `autoload_paths` inside of `application.rb`

### To Add a View ###

Inside of `app/views`, create directories for your controllers. Within each controller directory, create a view to match the actions in your controller.

For a controller named PostsController with actions :index, :show, :edit you could create app/views/posts/index_view.rb, app/views/posts/show_view.rb, app/views/posts/edit_view.rb respectively.

Then, create your view by inheriting from ActionView::Base:

```
class Posts::IndexView < ActionView::Base
end
```

Any methods defined within will be accessible from your matching templates at app/templates/posts/index.html.erb, etc.

_NOTE: If you do not create a view class, the default rails behavior will continue to work as always!_

### Handling `new` & `create` ###

If you have a `new` action in the `PostsController`, like so:

```
def new
end
```

This will implicitly render the `app/templates/posts/new.html.erb` template, and will look for the view inside `app/views/posts/new_view.rb`.

If you also have a `create` action:

```
def create
  if post.save
    redirect_to ...
  else
    render :new
  end
end
```

When this attempts to render the `new` template, it will _not_ try to look for a view inside `app/views/posts/new_view.rb` because we are only rendering the `new` template, but we are inside of the `create` action still. Put your view inside of `app/views/posts/create_view.rb`.

If the views are exactly the same, I have simply made the constants equal, like so: `Posts::CreateView = Posts::NewView`.

This will apply to any template and view that you render from another action. Another common example is `edit`/`update`.

## TODO

1. figure out how to test the integration with rails
2. generate to move new template generation into app/templates, and to generate view clases as needed.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
