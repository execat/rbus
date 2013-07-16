# Rbus
a living, self-correcting public transport system.

## Intent

Urban mobility is going to be the big problem of the coming few years. Cities that can keep their populations moving comfortably, reliably and safely will be the cities that see economic growth, prosperity and a better life for all their citizens. Cities where moving around is hard, expensive and unsafe will see moribund economic activity. Mumbai is a city that falls into the latter category along with the vast majority of third world urban centers. rBus is an attempt to change all of that.

Current forms of urban mobility are either uncomfortable, expensive or unsafe. Other initiatives by governments, while laudable, are too little (and perhaps too late). Building out metros in some chosen cities does little for the non-metro populations, are expensive and quickly reach capacity while taking years if not decades to build. rBus intends to deploy existing infrastructure to solve the problem. We turn existing roads and existing bus fleets into a massive, coordinated and responsive shared transport infrastructure. This is cheap and can happen overnight.

## Design Decisions

It would be worthwhile to conider some of the design decisions that were taken while building rBus so as to better understand the intent of the code. rBus is entirely commuter focussed.
It's main use case is intended for commuters - i.e. people who go from point A to B in the "morning" and return in the "evening". It is not intended to serve as an ad-hoc ridesharing platform. Our intention is to build out a core backbone of daily use on which spare capacity can easily be deployed towards ad-hoc trips. For now, the intention is to keep the operations simple and the service reliable. Therefore, in the first iteration, we intend to provide a point to point service. i.e. buses going from Malad to Bandra Kurla Complex will not stop to pick up commuters in Andheri East.

The purpose of this app is to collect commuter data and organise them into shared routes. For now it is a very simple app designed to bootstrap rBus like businesses quickly. Later, we would need to build out the resource allocation and scheduling parts of the application.

## Getting Started with the codebase

Set up the database

```
rake db:create db:migrate db:automigrate
rake db:create db:migrate db:automigrate RAILS_ENV=test
```

Download dependencies
```
bundle install
```

Run the specs

```
rspec spec
```

Enjoy. Let me know if something doesn't work.

Send me PRs!

## License

The code for rBus in licensed under the Apache License 2.0.

