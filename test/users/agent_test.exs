defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User
  import Exlivery.Factory

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "saves the user" do
      user = build(:user)
      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      cpf = "00000000000"
      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Rua ABC",
           age: 30,
           cpf: "00000000000",
           email: "fulano@mail.com",
           name: "Fulano de Tal"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("99999999999")
      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
