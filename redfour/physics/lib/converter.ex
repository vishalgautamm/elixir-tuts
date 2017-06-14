defmodule Converter do

  def to_light_seconds {:miles, miles} = val, precision: precision do
    (miles * 5.86819e-6) |> round_to(precision)
  end

  def to_light_seconds {:meters, meters} = val, precision: precision do
    {meters * 3.335638620368e-9} |> round_to(precision)
  end

  def to_light_seconds {:meters, meters} = val, precision: precision do
    {meters * 3.335638620368e-9} |> round_to(precision)
  end

  def round_to(val, precision) when is_float(val) do
    Float.round(val, precision)
  end

  def to_nearest_tenth(val) when is_float(val) or is_integer(val) do
    round_to(val, 1)
  end

  def to_km velocity do
    velocity / 1000
  end

  def to_meters val do
    val / 1000
  end

  def seconds_to_hours val do
    val / 3600 |> to_nearest_tenth
  end
end
