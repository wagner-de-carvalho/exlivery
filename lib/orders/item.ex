defmodule Exlivery.Orders.Item do
  @categories [:carne, :hamburguer, :japonesa, :pizza, :prato_feito, :sobremesa]

  @keys [:description, :category, :unity_price, :quantity]

  @enforce_keys @keys

  defstruct @keys

  def build(description, category, unity_price, quantity)
      when quantity > 0 and category in @categories do
    {:ok,
     %__MODULE__{
       category: category,
       description: description,
       quantity: quantity,
       unity_price: unity_price
     }}
  end

  def build(_description, _category, _unity_price, _quantity), do: {:error, "Invalid parameters"}
end
