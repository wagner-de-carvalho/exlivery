defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case
  alias Exlivery.Orders.Agent, as: OrderAgent
  import Exlivery.Factory

  describe "save/1" do
    setup do
      OrderAgent.start_link(%{})
      order = build(:order)
      {:ok, order: order}
    end

    test "saves the order", %{order: order} do
      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})
      order = build(:order)
      {:ok, order: order}
    end

    test "when the order is found, returns the order", %{order: order} do
      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = OrderAgent.get("99999999999")
      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
