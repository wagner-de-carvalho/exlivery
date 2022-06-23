defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "Rua ABC",
      age: 30,
      cpf: "00000000000",
      email: "fulano@mail.com",
      name: "Fulano de Tal"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de calabresa",
      quantity: 1,
      unity_price: Decimal.new("42.50")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua ABC",
      items: [
        build(:item),
        build(:item,
          description: "Açaí",
          category: :sobremesa,
          unity_price: Decimal.new("18.50"),
          quantity: 2
        )
      ],
      total_price: Decimal.new("79.50"),
      user_cpf: "00000000000"
    }
  end
end
