# Elixir day one exercises

# Easy ex 1

# point {x, y}
{x, y} = {3, 4}

# line {m, x, b}
{m, x, b} = {2, 0, 1}

# circle {x, y, r}
{x, y, r} = {3, 4, 1}

# polygon - list of points
p = [{3,4}, {5,6}, {1,2}]

# triangle could be list of points or fixed
{a, b, c} = {{3,4}, {5,6}, {1,2}}

# Easy ex 2
defmodule DayOne do
    def hypotenuse(a, b), do: :math.sqrt(:math.pow(a,2) + :math.pow(b,2))
end

# Easy ex 3 and 4
foo = "foo"
is_atom(foo) # false
bar = String.to_atom(foo)
is_atom(bar) # true

# Medium ex 1

defmodule DayOneRecursion do
    def listSize([]), do: 0
    def listSize([head | tail]), do: 1 + listSize(tail)

    def minAcc([], acc), do: acc
    def minAcc([head | tail], acc) do
        if head < acc do
            minAcc(tail, head)
        else
            minAcc(tail, acc)
        end
    end
    def min([head | tail]), do: minAcc(tail, head)

    def maxAcc([], acc), do: acc
    def maxAcc([head | tail], acc) do
        if head > acc do
            maxAcc(tail, head)
        else
            maxAcc(tail, acc)
        end
    end
    def max([head | tail]), do: maxAcc(tail, head)
end

# Medium ex 2

defmodule Words do
    def word_count([], acc), do: acc
    def word_count([head | tail], acc) do
        if Keyword.has_key?(acc, head) do
            word_count(tail, elem(Keyword.get_and_update(acc, head, fn x -> {x, x+1} end), 1))
        else
            word_count(tail, acc ++ [{head, 1}])
        end
    end
    def word_count(list), do: word_count(list, [])
end

# iex(69)> Words.word_count([:foo, :bar, :foo, :baz])
# [foo: 2, bar: 1, baz: 1]
