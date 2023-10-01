defmodule GoApi.Regional do


  import GoApi.Conf
  @api_key api_key() # Mendefinisikan atribut module api_key


   @moduledoc """
  Get regional data for Indonesia.
  """
  def province do
    get_api_params("regional/provinsi?api_key=#{@api_key}")
  end

  def city do
    get_api_params("regional/kota?api_key=#{@api_key}")
  end

  def district do
    get_api_params("regional/kecamatan?api_key=#{@api_key}")
  end

  def subdistrict do
    get_api_params("regional/kelurahan?api_key=#{@api_key}")
  end



end
