defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User
  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Fulano de Tal", "fulano@mail.com", "00000000000", 30, "Rua ABC")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when age is under 18, returns an error" do
      response = User.build("Fulano", "fulano@mail.com", "00000000000", 17, "Rua ABC")
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when cpf is not string, returns an error" do
      response = User.build("Fulano", "fulano@mail.com", 00_000_000_000, 18, "Rua ABC")
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
