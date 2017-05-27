defmodule FridgeServer do
  use GenServer

  def init(items) do
    {:ok, items} 
  end

  def handle_call({:store, item}, _from, items) do
    {:reply, :ok, [item|items]}
  end

  def handle_call({:take, item}, _from, items) do
    {:reply, {:ok, item}, items}
  end

end

defmodule FridgeServerTest do
  use ExUnit.Case

  test "putting something into the fridge" do
    {:ok, fridge} = :gen_server.start_link FridgeServer, [], []
    assert :ok == :gen_server.call(fridge, { :store , :bacon })
  end

  test "removing something from the fridge" do
    {:ok, fridge} = :gen_server.start_link FridgeServer, [], []
    :gen_server.call(fridge, {:store, :bacon})
    assert {:ok, :bacon} == :gen_server.call(fridge, {:take, :bacon})
  end 

  test "taking something from the fridge that isnt there" do
    {:ok, fridge} = :gen_server.start_link FridgeServer, [], []
    assert :not_found == :gen_server.call(fridge, {:take, :bacon})
  end

end
