defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "the escape velocty of mars is correct" do
    evMars = Physics.Rocketry.escape_velocity(:mars)
    assert evMars == 5.0
  end

  test "the escape velocity of moon is correct" do
    evMoon = Physics.Rocketry.escape_velocity(:moon)
    assert evMoon == 2.4
  end


  test "the escape velocity of earth is correct" do
    evEarth = Physics.Rocketry.escape_velocity(:earth)
    assert evEarth == 11.2
  end

  test "escape velocity of Planet X is correct" do
    ev = %{mass: 4.0e22, radius: 6.21e6}
      |>Physics.Rocketry.escape_velocity
    assert ev == 0.9
  end

  test "the orbital speed of earth is correct" do
    os = Physics.Rocketry.orbital_speed(100)
    assert os == 7907.1
  end

  test "the Arjusted orbital term for earth is correct" do
    ort = Physics.Rocketry.orbital_term (100)
    assert ort == 0.0
  end

end
