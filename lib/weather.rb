require 'net/http'
require 'json'

class Weather
  def self.forecast
    main_locations = [
      {
        city: "Badalona",
        code: 1196
      },
      {
        city: "Barcelona",
        code: 1200
      },
      {
        city: "Calella",
        code: 1216
      },
      {
        city: "Cerdanyola de Vallès",
        code: 1333
      },
      {
        city: "Cornellà de Llobregat",
        code: 1196
      },
      {
        city: "Gavà",
        code: 1381
      },
      {
        city: "L' Hospitalet de Llobregat",
        code: 1649
      },
      {
        city: "Manresa",
        code: 1661
      },
      {
        city: "Martorell",
        code: 1662
      },
      {
        city: "El Masnou",
        code: 1666
      },
      {
        city: "Mataró",
        code: 1669
      },
      {
        city: "Sabadell",
        code: 11926
      },
      {
        city: "Sant Cugat Del Vallès",
        code: 82
      },
      {
        city: "Sitges",
        code: 1337
      },
      {
        city: "Terrassa",
        code: 1346
      },
      {
        city: "Vic",
        code: 2
      },
      {
        city: "Vilanova i la Geltrú",
        code: 1150
      }
    ]

    code = main_locations.map { |city| city[:code] }.sample

    url = "http://api.tiempo.com/index.php?api_lang=es&localidad=#{code}&affiliate_id=#{eltiempo_token}&v=3.0"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    weather = JSON.parse(response)

    days = weather["day"]
    location = weather["location"]

    tempmin = days.map do |key, value|
      value.select do |k, v|
        v.to_i if k.include?("tempmin")
      end
    end

    tempmax = days.map do |key, value|
      value.select do |k, v|
        v.to_i if k.include?("tempmax")
      end
    end

    tempmin_total = tempmin.map { |day| day['tempmin'].to_i }.reduce(0, :+)
    tempmax_total = tempmax.map { |day| day['tempmax'].to_i }.reduce(0, :+)

    av_min = tempmin_total / tempmin.size
    av_max = tempmax_total / tempmax.size

    p "Current forecast for #{location}"
    p "The average of the minimum temperature over the next week is #{av_min}ºC"
    p "The average of the maximum temperature over the next week is #{av_max}ºC"
  end
end

Weather.forecast();
