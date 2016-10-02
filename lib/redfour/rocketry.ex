defmodule Converter do
  def to_nearest_tenth(val) do # private definition
    Float.ceil(val, 1)
  end

  def to_km(val) do
    val / 1000
  end

  def to_light_seconds({:miles, miles}) do
    (miles * 5.36819e-6) |> round_down
  end

  def round_down(val) when is_float(val), do: trunc(val)
end

defmodule Redfour.Rocketry do

  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6}
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do #guard
    planet
      |> calculate_escape
      |> Converter.to_km
      |> Converter.to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    g = 6.67e-11
    2 * g * mass/radius
      |> :math.sqrt
  end

end
