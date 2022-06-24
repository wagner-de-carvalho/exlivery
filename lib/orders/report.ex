defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Item, Order}

  def create(file_name \\ "report.csv") do
    order_list = build_order_list()

    File.write(file_name, order_list)
  end

  defp build_order_list do
    OrderAgent.list_all()
    |> Map.values()
    |> Enum.map(&order_string/1)
  end

  defp order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    items_string = Enum.map(items, &items_string/1)
    "#{cpf}#{items_string},#{total_price}\n"
  end

  defp items_string(%Item{category: category, quantity: quantity, unity_price: price}) do
    ",#{category},#{quantity},#{price}"
  end
end
