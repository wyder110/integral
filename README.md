# Integral

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `integral` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:integral, "~> 0.1.0"}
  ]
end
```

## Example usage

```elixir
iex> Integral.monte_carlo_method(fn x -> x end, 0, 10)
      50.06474343307806

      iex> Integral.simpson_method(fn x -> x end, 0, 10)
      50.00000000000001
```