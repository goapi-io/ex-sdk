defmodule GoApi.Idx do

  import GoApi.Conf
  @api_key api_key() # Mendefinisikan atribut module api_key

 @moduledoc """
  Get data for companies listed on IDX (Indonesia Stock Exchange).
  """

  def companies do
    get_api_params("stock/idx/companies?api_key=#{@api_key}")
  end

  def indices do
    get_api_params("stock/idx/indices?api_key=#{@api_key}")
  end

  def index_items(symbol \\ "MNC36") do
    get_api_params("stock/idx/index/#{symbol}/items?&api_key=#{@api_key}")
  end


  def emitent_detail(emitent_symbol \\ "BMRI") do
    get_api_params("stock/idx/#{emitent_symbol}?api_key=#{@api_key}")
  end


  def stock_prices(symbol_list \\ "BBRI,BBCA") do
    get_api_params("stock/idx/prices?symbols=#{symbol_list}&api_key=#{@api_key}")
  end

  def trending_stocks do
    get_api_params("stock/idx/trending?api_key=#{@api_key}")
  end

  def top_gainers do
    get_api_params("stock/idx/top_gainer?api_key=#{@api_key}")
  end


  def top_losers do
    get_api_params("stock/idx/top_loser?api_key=#{@api_key}")
  end

  def historical_stock_data(%{"symbol" => symbol, "date_from" => date_from, "date_to" => date_to} \\ %{"symbol" => "BBCA", "date_from" => "2023-01-01", "date_to" => "2023-03-01"}) do
    get_api_params("stock/idx/#{symbol}/historical?from=#{date_from}&to=#{date_to}&api_key=#{@api_key}")
  end


  def broker_summary(%{"symbol" => symbol, "date_from" => date_from, "date_to" => date_to} \\ %{"symbol" => "BBCA", "date_from" => "2023-01-01", "date_to" => "2023-03-01"}) do
    get_api_params("stock/idx/#{symbol}/broker_summary?from=#{date_from}&to=#{date_to}&api_key=#{@api_key}")
  end

end
