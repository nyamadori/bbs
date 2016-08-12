bbs
====

[![CircleCI](https://circleci.com/gh/nyamadori/bbs.svg?style=svg)](https://circleci.com/gh/nyamadori/bbs)

A chat application like Slack.

Development
-----

### Setup

```
$ cd bbs
$ bundle install
$ cd frontend && npm install
$ ./bin/rails db:create db:migrate
```

### Run

```
$ cd bbs
$ ./bin/rails s              # run API server
$ cd frontend && npm run dev # run frontend server
$ open http://localhost:8080
```
