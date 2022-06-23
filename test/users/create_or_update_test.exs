defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      user_params = %{
        address: "Rua ABC",
        age: 30,
        cpf: "00000000000",
        email: "fulano@mail.com",
        name: "Fulano de Tal"
      }

      {:ok, user_params: user_params}
    end

    test "when all params are valid, saves the user", %{user_params: user_params} do
      response = CreateOrUpdate.call(user_params)
      expected_response = {:ok, "User created or updated successfully"}
      
      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{user_params: user_params} do
      user_params = %{user_params | age: 15}
      response = CreateOrUpdate.call(user_params)
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
