# ex-sdk
GoAPI Elixir SDK



## Installation
Specification
```elixir
 def project do
    [
     ...
      elixir: "~> 1.15"
     ...
    ]
  end
```
List the Hex package in your application dependencies.

```elixir
def deps do
  [
      {:httpoison, "~> 2.1"},
      {:poison, "~> 5.0.0"}
  ]
end
```


## Configuration

Setup configuration variables in your `config/config.exs` file:

```elixir
 config :go_api, GoApi,
 cg_base_url: "https://api.goapi.io/",
 api_key: [
  stock: "YOUR_STOCK_API",
  regional: "YOUR_REGIONAL_API",
  places: "YOUR_PLACES_API"
 ],
 spv_speed: 5000, #milisecond 5000 -> 5 seconds, supervisor speed
 print_url: false #true for optional debugging
```

Run

```shell
• mix deps.get
• mix compile
• iex -S mix run 
```

Config Notifier :
```shell
1. {:error, "cg_base_url is missing or empty in the config"}
2. {:error, "api_key_regional is missing or empty in the config"}
3. {:error, "api_key_places is missing or empty in the config"}
4. {:error, "api_key_stock is missing or empty in the config"}
5. {:error, "spv_speed is missing or less than or equal to 0 in the config"}
6. {:info, "print_url is active in the config"}
```


## Usage


Example Params : 
```elixir
- SYMBOL = BBCA
- DATE = 2023-10-30 # This date is a Period Date for Broker Summary and Indicator
- LIMIT_PAGES # SET the LIMIT_PAGES for the page you want to display as a result, default was nil (Page 1)
- DATE_FROM = 2023-01-01
- DATE_TO = 2023-08-01
- API_KEY :
  - STOCK:  _ZtJr4WeQpSKn************,
  - REGIONAL:  **********pHLQQN7_1jgR,
  - PLACES:  _9MoS98Xn******iBhI983NJ3NhJ42
```



Interactive Elixir (1.15.2) :
```shell
# Search for specific places in Indonesia and retrieve coordinates.
iex(1)> GoApi.Places.find("sumatra") # Default : jawa

# Get regional data for Indonesia.
iex(2)> GoApi.Regional.province  
iex(3)> GoApi.Regional.city("PROVINCE_ID" \\ 1) # Default : 1
iex(4)> GoApi.Regional.district("CITY_ID" \\ 11.01)  
iex(5)> GoApi.Regional.sub_district("DISTRICT_ID" \\ "11.01.01") #become string

-- Snapshot --
# Get data (Snapshot) for companies listed on IDX (Indonesia Stock Exchange).  
iex(6)> GoApi.Idx.companies
iex(7)> GoApi.Idx.indices    
iex(8)> GoApi.Idx.index_items("SYMBOL" \\ "MNC36") # Default: MNC36
iex(9)> GoApi.Idx.company_profiles("SYMBOL" \\ "BBCA") # Default: BBCA
iex(10)> GoApi.Idx.emitent_detail("EMITEN_SYMBOL" \\ "BMRI")  # Default: BMRI
iex(11)> GoApi.Idx.prices("SYMBOL_LIST" \\ "BBRI,BBCA") # Default: BBRI / BBRI, BBCA. Separate emitters with commas to search for multiple emitters.
iex(12)> GoApi.Idx.trending
iex(13)> GoApi.Idx.top_gainers
iex(14)> GoApi.Idx.top_losers
iex(15)> GoApi.Idx.historical_stock_data(%{"symbol" => symbol, "date_from" => date_from, "date_to" => date_to} \\ %{"symbol" => "BBCA", "date_from" => "2023-01-01", "date_to" => "2023-03-01"}) # Struct Format, Default Symbol: BBCA, From: 2023-01-01, To: 2023-03-01, (Date Format: YYYY-MM-DD)
iex(16)> GoApi.Idx.e_ipo
iex(17)> GoApi.Idx.broker_summary(%{"symbol" => symbol, "date" => date} \\ %{"symbol" => "BBCA", "date" => "2023-10-30"}) # Struct Format, Default Symbol: BBCA, Date Period: 2023-10-30 (Date Format: YYYY-MM-DD)
iex(18)> GoApi.Idx.indicators(%{"limit_page" => limit_pages, "date" => date} \\ %{"limit_page" => "", "date" => ""}) #Showing some techincal indicator, Default limit Page: 1, Set Date for Specific Period
iex(19)> GoApi.Idx.news(%{"page" => page, "symbol" => symbol} \\ %{"page" => "1", "symbol" => "BBCA"}) #News Stock and Investations, Default limit Page: 1 (if Empty) - Limit Per Page = 100, Set Symbol For Specific Emiten

-- Realtime --
#Get Data by Realtime
iex(19)> GoApi.Spv.e_ipo(%{})
iex(20)> GoApi.Spv.trending(%{})
iex(21)> GoApi.Spv.top_gainers(%{})
iex(22)> GoApi.Spv.top_losers(%{})
iex(23)> GoApi.Spv.companies(%{})
iex(24)> GoApi.Spv.indices(%{})

```


