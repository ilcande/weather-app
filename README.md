# Weather App

Small Ruby App built using [El Tiempo API](https://www.tiempo.com/)

The App allows users to run the program and retrieve minimum and maximum
average temperatures for a random location around the Barcelona Metropolitan Area.

* Process
```
Define a URL to be parsed. (Authentication needed)
Make an HTTP GET request to that URL. I used net/http which is a built in Ruby standard library, so no need to install dependencies.
Parse the JSON result.
Handle response body and retrieve data we want.
Implement custom logic such as random city selection.
```
[Net::HTTP Documentation](https://ruby-doc.org/stdlib-2.2.3/libdoc/net/http/rdoc/Net/HTTP.html)

* To test the App simply clone it in your local and swap the `#{eltiempo_token}`
  with your Tiempo API param.

* To execute the program and print the outputs run `ruby lib/weather.rb`
