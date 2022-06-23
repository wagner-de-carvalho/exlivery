defmodule Exlivery.Factory do
  use ExMachina
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
end
