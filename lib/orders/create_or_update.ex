defmodule Exlivery.Orders.CreateOrUpdate do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Order
  alias Exlivery.Users.Agent, as: UserAgent

  def call(%{user_cpf: cpf, items: items}) do
    with {:ok, user} <- UserAgent.get(cpf),
         {:ok, items} <- build_items(items),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order)
    end
  end

  defp build_items(items) do
    {:ok, items}
  end
end
