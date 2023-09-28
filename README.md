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

Add the following configuration variables in your `config/config.exs` file:

```elixir
  config :go_api, GoApi,
  cg_base_url: "https://api.goapi.id/v1/",
  api_key: "YOUR_API_KEY",
  print_url: false

```

Run

```elixir
• mix deps.get
• mix compile
• iex -S mix run 
```


## Usage


Example Params : 
```
- SYMBOL = AAPL
- INT_TIME = 1 (Max 240 - Recommended)
- TIME = minute / hour
- DATE_FROM = 2023-01-01
- DATE_TO = 2023-08-01
- API_KEY = _ZtJr4WeQpSKn******pHLQQN7_1jgR
```

Interactive Elixir (1.15.2) :
```shell
# Search for specific places in Indonesia and retrieve coordinates.
iex(1)> GoApi.Places.find("sumatra") # Default : jawa

# Get regional data for Indonesia.
iex(2)> GoApi.Regional.province  
iex(3)> GoApi.Regional.city  
iex(4)> GoApi.Regional.district  
iex(5)> GoApi.Regional.subdistrict

# Get data for companies listed on IDX (Indonesia Stock Exchange).  
iex(6)> GoApi.Idx.companies
iex(7)> GoApi.Idx.indices    
iex(8)> GoApi.Idx.index_items("SYMBOL" \\ "MNC36") # Default: MNC36
iex(9)> GoApi.Idx.emitent_detail("EMITEN_SYMBOL" \\ "BMRI")  # Default: BMRI
iex(10)> GoApi.Idx.stock_prices("SYMBOL_LIST" \\ "BBRI,BBCA") # Default: BBRI / BBRI, BBCA. Separate emitters with commas to search for multiple emitters.
iex(11)> GoApi.Idx.trending_stocks
iex(12)> GoApi.Idx.top_gainers
iex(13)> GoApi.Idx.top_losers
iex(14)> GoApi.Idx.historical_stock_data(%{"symbol" => symbol, "date_from" => date_from, "date_to" => date_to} \\ %{"symbol" => "BBCA", "date_from" => "2023-01-01", "date_to" => "2023-03-01"}) # Struct Format, Default Symbol: BBCA, From: 2023-01-01, To: 2023-03-01, (Date Format)
iex(15)> GoApi.Idx.broker_summary(%{"symbol" => symbol, "date_from" => date_from, "date_to" => date_to} \\ %{"symbol" => "BBCA", "date_from" => "2023-01-01", "date_to" => "2023-03-01"}) # Struct Format, Default Symbol: BBCA, From: 2023-01-01, To: 2023-03-01, (Date Format)
```


