defmodule Exlivery.Users.User do
  @keys [:address, :age, :cpf, :email, :name]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf, age, address) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       address: address,
       age: age,
       cpf: cpf,
       email: email,
       name: name
     }}
  end

  def build(_address, _name, _email, _cpf, _age), do: {:error, "Invalid parameters"}
end
