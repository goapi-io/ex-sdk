defmodule GoApi.Conf do

  @cg_base_url Application.compile_env(:go_api, GoApi)[:cg_base_url]
  @api_key_stock Application.compile_env(:go_api, GoApi)[:api_key][:stock]
  @api_key_regional Application.compile_env(:go_api, GoApi)[:api_key][:regional]
  @api_key_places Application.compile_env(:go_api, GoApi)[:api_key][:places]

  @print_url Application.compile_env(:go_api, GoApi)[:print_url]

  def cg_base_url() do
    @cg_base_url
  end
  def api_key_stock() do
    @api_key_stock
  end
  def api_key_regional() do
    @api_key_regional
  end
  def api_key_places() do
    @api_key_places
  end
  def print_url() do
    @print_url
  end


    def get_api(api_path) do
      url = @cg_base_url <> api_path
      if @print_url, do: IO.puts url
      res = HTTPoison.get!(url)
      Poison.decode!(res.body)
    end

    def get_api_params(api_path, params \\ %{}) do
      query_params = URI.encode_query(params)
      url = @cg_base_url <> api_path <> query_params
      if @print_url, do: IO.puts url
      res = HTTPoison.get!(url)
      Poison.decode!(res.body)
    end


end
