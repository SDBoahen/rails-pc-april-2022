# The Wooblies Are Selling Snacks ✨🐱🍇🍪🍿🍩🍫🧁🍨🍡🥨🍊🐱✨

The Wooblies need your help! Please help them design a Rails API to handle Request to GET, POST, and DELETE Data and support their entrepreneurial endevors! ✨🐱🙏🥺🐱✨

In this repo, there is a Rails application with some features built out. There
is also NOT a fully built React frontend application....soooo, use Postman 🧑‍🚀👍🚀😅 so you can test if your API is working.

Your job is to build out the Rails API to add the functionality described in the
deliverables below.

## Setup

To download the dependencies for the backend, run:

```console
$ bundle install
```

There is some starter code in the `db/seeds.rb` file so that once you've
generated the models, you'll be able to create data to test your application.

You can run your Rails API on [`localhost:3000`](http://localhost:3000) by running:

```console
$ rails s
```

You can run a React app after you pass the Code Challenge

You are not being assessed on React, and I don't want y'all spending any time on it now; we can have more fun on the Frontend once we get into Project Mode. At that time y'all can build out Frontend code that can test out the behavior of your APIs in a realistic setting.

There are also NO tests included so test your Controller Actions using Postman 😬👍.

Depending on your preference, you can either check your progress by:

- Running the Rails server and using Postman to make requests
- Running the Rails server and using Postman to make requests
or
- Running the Rails server and using Postman to make requests

<!-- 😬😅 // Lol -->


## Models

Your Models will each have the following attributes:

- A `Woobly`:
string :name
string :hometown

- A `Snack`:
string :name
string :ingredients

- A `WooblySnack` belongs to a `Woobly` and belongs to a `Snack`
float :price
string :special_additional_ingredients
boolean :marked_as_healthy


You need to create the following relationships:

- A `Woobly` has many `Snack`s through `WooblySnack`
- A `Snack` has many `Woobly`s through `WooblySnack`
- A `WooblySnack` belongs to a `Woobly` and belongs to a `Snack`


Start by creating the models and migrations for the following database tables:

If you use a Rails generator to create the models, make sure to use the
`--no-test-framework` flag to avoid overwriting the test files on the Actual Code Challenge (If you know you will use the tests on the Day-Of). Today, it won't make a difference.

Add any code needed in the model and migration files to ESTABLISH THE RELATIONSHIPS/ASSOCIATIONS neccessary.

Also, feel free to add additional seeds to the seeds file, but you will likelly suffice more data when using your POST controller actions in the Deliverables.


Then, run the migrations and seed file:

```sh
rails db:migrate db:seed
```




## Validations

Add validations to the `Woobly` model:

- must have a `name`


Add validations to the `Snack` model:

- must have a `name`
- `name` must be unique


Add validations to the `WooblySnack` model:

- must have a `price` between 1 and 1000000




## Routes

Set up the following routes. Make sure to return JSON data in the format
specified along with the appropriate HTTP verb.


### GET /wooblies

Return JSON data in the format below:

```json
[
    {
        "name": "Woobly",
        "hometown": "The Bronx"
    },
    {
        "name": "Joobly",
        "hometown": "Manhattan"
    },
    {
        "name": "WaWaWa",
        "hometown": "Republica Dominicana"
    },
    {
        "name": "Mooply",
        "hometown": "The Abyss"
    }
]
```


### GET /wooblies/:id

If the `Woobly` exists, return JSON data in the format below:

```json
{
  "id": 1,
  "name": "Woobly",
  "hometown": "Austin",
  "snacks": [
    {
        "id": 1,
        "name": "Ice Cream",
        "ingredients": "Ice, Cream, Happiness"
    },
    {
      "id": 2,
      "name": "Chips",
      "ingredients": "Potatoes, Salt"
    }
  ]
}
```

If the `Woobly` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Woobly not found 🌾😕🌾"
}
```


### POST /wooblies

This route should create a new `Woobly`. It should accept an object with the following
properties in the body of the request:

```json
{
    "name": "Confoobly",
    "hometown": "Florida"
}
```

If the `Woobly` is created successfully, send back a response with the data
related to that `Woobly`:

```json
{
    "id": 5,
    "name": "Confoobly",
    "hometown": "Florida"
}
```

If the `Woobly` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
  "errors": ["validation errors"]
}
```


### DELETE /wooblies/:id

If the `Woobly` decides to Retire, check if they exist, and then they should be removed from the database, along with any `WooblySnack`s that are associated with it (a `WooblySnack` belongs
to a `Woobly`, so you need to delete the `WooblySnack`s before the
`Woobly` can be deleted).

After Retiring that `Woobly`, return an _empty_ response body, along with the
appropriate HTTP status code.

If the `Woobly` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Woobly not found 🌾🙃🌾"
}
```




### GET /snacks

Return JSON data in the format below:

```json
[
    {
      "id": 1,
      "name": "Ice Cream",
      "ingredients": "Ice, Cream, Happiness"
    },
    {
      "id": 2,
      "name": "Chips",
      "ingredients": "Potatoes, Salt"
    }
    { 
      "id": 3,
      "name": "Grapes",
      "ingredients": "...Grapes?"
    }
]
```


### GET /snacks/:id

If the `Snack` exists, return JSON data in the format below:

```json
{
  "id": 1,
  "name": "Ice Cream",
  "ingredients": "Ice, Cream, Happiness",
  "wooblies": [
    {
        "id": 1,
        "name": "Woobly",
        "hometown": "The Bronx"
    }
  ]
}
```

If the `Snack` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Snack not found 🍽🙃🥣"
}
```


### POST /snacks

This route should create a new `Snack`. It should accept an object with the following
properties in the body of the request:

```json
{
    "name": "Pinapples",
    "ingredients": "Pine, Apples, Magic✨"
}
```

If the `Snack` is created successfully, send back a response with the data
related to that `Snack`:

```json
{
    "id": 4,
    "name": "Pinapples",
    "ingredients": "Pine, Apples, Magic✨"
}
```

If the `Snack` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
  "errors": ["validation errors"]
}
```




### POST /wooblie_snacks

This route should create a new `WooblySnack` that is associated with an
existing `Snack` and `Woobly`. It should accept an object with the following
properties in the body of the request:

```json
{
  "price": 5.55,
  "special_additional_ingredients": "Love💛✨",
  "marked_as_healthy": true,
  "snack_id": 1,  // (or any valid :id)
  "woobly_id": 5 // (or any valid :id)
}
```

If the `WooblySnack` is created successfully, send back a response with the data
related to the `Snack`:

```json
{
  "name": "Ice Cream",
  "ingredients": "Ice, Cream, Happiness",
  "being_sold_for": 5.55 
}
```

If the `WooblySnack` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
  "errors": ["validation errors"]
}
```


### DELETE /wooblie_snacks

If the `WooblySnack` exists, it should be removed from the database

After deleting the `WooblySnack`, return an _empty_ response body, along with the
appropriate HTTP status code.

If the `WooblySnack` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "#{Woobly} doesn't sell #{Snack} Anymore 🥣😿"
}
```