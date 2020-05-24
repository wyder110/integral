defmodule Integral do
  @moduledoc """
  Documentation for `Integral`.
  """

  @doc """
  Monte carlo integration method.
  Simpson integration method.

  ## Examples

      iex> Integral.monte_carlo_method(fn x -> x end, 0, 10)
      50.06474343307806

      iex> Integral.simpson_method(fn x -> x end, 0, 10)
      50.00000000000001

  """

  def monte_carlo_method(f, from, to, n \\ 10000) do
    sum = monteCarloProbes(f,from,to,n,0,0)
    (sum*(to-from)/n)
  end

  defp monteCarloProbes(f, from, to, n, i, acc) do
    cond do
      i == n -> acc
      true -> monteCarloProbes(f,from,to,n,i+1, acc + f.(:rand.uniform()*(to-from) + from))
    end
  end

  def simpson_method(f, from, to, n \\ 10000) do
    ((simpsonMethodLoop(f, from, to, 1, n, 0)*(to-from)/n)/6)
  end

  defp simpsonMethodLoop(f, from, to, i, n, acc) do
    dx = (to-from)/n
    cond do
      i > n -> acc
      true -> simpsonMethodLoop(f, from, to, i+1, n, acc + f.(from + (i-1.0)*dx) + 4*f.(from + (i-0.5)*dx) + f.(from + i*dx))
    end
  end

end
