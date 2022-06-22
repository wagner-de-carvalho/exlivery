defmodule Exlivery.Users.User do
  @keys [:age, :cpf, :email, :name]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf, age) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       age: age,
       cpf: cpf,
       email: email,
       name: name
     }}
  end
  def build(_name, _email, _cpf, _age), do: {:error, "Invalid parameters"}
end
