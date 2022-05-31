
# Elixir Receive Do

Receive do receives a message and processes it. In this example it calculates the area of a shape with dimensions specified. To process multiple messages it recursively calls the `area_loop()` function.
```elixir
defmodule Geometry do
  def area_loop do
    receive do
      {:rectangle, w, h} ->
        IO.puts("Area = #{w * h}")
        area_loop()
      {:circle, r} ->
        IO.puts("Area = #{3.14 * r * r}")
        area_loop()
    end
  end
end
```