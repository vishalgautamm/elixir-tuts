defmodule PhysicsTest do
  use ExUnit.Case

  test "the escape velocity of earth is correct" do
    evEarth = Physics.Rocketry.escape_velocity(:earth)
    assert evEarth == 11.2
  end

  test "the escape velocty of mars is correct" do
    evMars = Physics.Rocketry.escape_velocity(:mars)
    assert evMars == 5.0
  end

  test "the escape velocity of moon is correct" do
    evMoon = Physics.Rocketry.escape_velocity(:moon)
    assert evMoon == 2.4
  end

  test "escape velocity of Planet X is correct" do
    ev = %{mass: 4.0e22, radius: 6.21e6}
      |> Physics.Rocketry.escape_velocity
    assert ev == 0.9
  end

  test "converting light to seconds" do
    ls = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert ls == 0.00587
  end

  test "Orbital acceleration for earth at 100km" do
    orbital_acc = Physics.Rocketry.orbital_acceleration(100)
    assert orbital_acc == 9.813646479293858
  end

  test "Calculates the height when t is 4 hours" do
    h = Physics.Rocketry.correct_orbital_height |> IO.inspect
  end

  test "Orbital term for 100km above earth" do
    term = Physics.Rocketry.orbital_term(54450.5109768944)
    assert (term > 1) && (term < 2)
  end

end
