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


## Usage


Example Params : 
```
- SYMBOL = BBCA
- DATE = 2023-10-30 # This date is a Period Date for Broker Summary and Indicator
- LIMIT_PAGES # SET the LIMIT_PAGES for page you want to display as result, default was nil (Page 1)
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
iex(3)> GoApi.Regional.city("PROVINCE_ID" \\ "1") # Default : 1
iex(4)> GoApi.Regional.district  
iex(5)> GoApi.Regional.subdistrict

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
iex(18)> GoApi.Idx.indicators(%{"limit_page" => limit_pages, "date" => date} \\ %{"limit_page" => "", "date" => ""}) #Showing some techincal indikator, Default limit Page: 1, Set Date for Specific Period

-- Realtime --
#Get Data by Realtime
iex(19)> GoApi.Spv.e_ipo(%{})
iex(20)> GoApi.Spv.trending(%{})
iex(21)> GoApi.Spv.top_gainers(%{})
iex(22)> GoApi.Spv.top_losers(%{})
iex(23)> GoApi.Spv.companies(%{})
iex(24)> GoApi.Spv.indices(%{})

```


