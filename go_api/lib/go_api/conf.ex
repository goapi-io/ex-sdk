defmodule GoApi.Conf do

  @cg_base_url Application.compile_env(:go_api, GoApi)[:cg_base_url]
  @api_key Application.compile_env(:go_api, GoApi)[:api_key]
  @print_url Application.compile_env(:go_api, GoApi)[:print_url]

  def cg_base_url() do
    @cg_base_url
  end

  def api_key() do
    @api_key
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
