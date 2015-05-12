# Elgoob3

* Words are stored, as well as related page IDs.
* Only words match in search.
* I didn’t use any algorithm to search.

## Running

```console
$ bundle install
$ bundle exec rackup
```

The application will be available on http://localhost:9292

Indexing:
```console
curl -i 'http://localhost:9292/index' -d '{ "pageId": 100, "content": "What is your problem, Watson? Do you have it?" }'
curl -i 'http://localhost:9292/index' -d '{ "pageId": 200, "content": "Houston, we have a problem." }'
curl -i 'http://localhost:9292/index' -d '{ "pageId": 300, "content": "Elementary, dear Watson." }'
curl -i 'http://localhost:9292/index' -d '{ "pageId": 999, "content": "We are the problem, dear Watson." }'
```

Searching:
```console
http://localhost:9292/search?query=Elementary,%20dear%20Watson%20chalala
```
