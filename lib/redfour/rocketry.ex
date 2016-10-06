defmodule Redfour.Rocketry do

  import Converter
  import Calc
  import Redfour.Laws
  import Bodies

  # def escape_velocity(:earth) do #long notation
  #   earth
  #     |> escape_velocity
  # end

  def escape_velocity(:earth), do: earth |> escape_velocity #single line notation

  def escape_velocity(:moon), do: moon |> escape_velocity

  def escape_velocity(:mars), do: mars |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do #guard
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  def orbital_speed(height) do
    g_constant * earth.mass / orbital_radius(height)
      |> square_root
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
  end

  defp orbital_radius(height) do #private function
      earth.radius + (height |> to_m)
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * g_constant * mass/radius
      |> square_root
  end

end
