defmodule GoApi.Places do

  import GoApi.Conf
  @api_key_places api_key_places() # define attribute module from @api_key to @api_key_places

 @moduledoc """
  Search for specific places in Indonesia and retrieve coordinates.
  """
  def find(area \\ "jawa") do
    get_api_params("places?search=#{area}&api_key=#{@api_key_places}")
  end

end
