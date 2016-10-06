defmodule RedfourTest do
  use ExUnit.Case
  doctest Redfour

  test "Redfour.Rocketry earth" do
    assert Redfour.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "Redfour.Rocketry moon" do
    assert_in_delta Redfour.Rocketry.escape_velocity(:moon), 2.38, 0.1
  end

  test "Redfour.Rocketry mars" do
    assert_in_delta Redfour.Rocketry.escape_velocity(:mars), 5.03, 0.1
  end

  test "Redfour.Rocketry.escape_velocity with map" do
    assert Redfour.Rocketry.escape_velocity(%{mass: 100, radius: 50}) == 0.1
  end

  test "Redfour.Rocketry.orbital_speed" do
    assert Redfour.Rocketry.orbital_speed(100) == 7845.797893364734
  end

  test "Redfour.Rocketry.orbital_acceleration" do
    assert_in_delta Redfour.Rocketry.orbital_acceleration(100), 9.50, 0.015 #margin of error
  end

end
