# First Phoenix Attempt
First Elixir-newbie attempt at a Phoenix application following a tutorial : 
https://graffino.com/web-development/first-steps-in-elixir-and-phoenix-create-a-blog-prototype

As this tutorial was created in September 2020, there were quite a number of changes required to work with the newer Phoenix and Elixir versions.
Took some time to figure out what's what, what changes required and how to do so such that it built without errors - got there eventually. :)

This buildable version works with Phoenix 1.7.12 and Elixir 1.17.1.
As this was all done inside a docker container, the db(dockered Postgres too) connection strings have been removed.
Not tested outside a container.

Original Readme notes on creation of Phoenix application:

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
