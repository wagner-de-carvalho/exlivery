defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case
  import Exlivery.Factory
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    setup do
      OrderAgent.start_link(%{})
      :order |> build() |> OrderAgent.save()
      :order |> build() |> OrderAgent.save()
      :ok
    end

    test "creates the report file" do
      Report.create("report_test.csv")
      response = File.read!("report_test.csv")

      expected_response =
        "00000000000,pizza,1,42.50,sobremesa,2,18.50,79.50\n" <>
          "00000000000,pizza,1,42.50,sobremesa,2,18.50,79.50\n"

      assert response == expected_response
    end
  end
end
