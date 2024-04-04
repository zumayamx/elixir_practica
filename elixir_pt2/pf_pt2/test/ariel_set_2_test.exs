#    Tests for the set of problems by Ariel Ortiz
#    Applications of the general concepts of functional programming
#
#    Gilberto Echeverria
#    2022_03_04

defmodule Hw.Ariel2Test do
  use ExUnit.Case
  alias Hw.Ariel2

  describe "insert:" do
    @tag :optional
    test "insert in empty list",
      do: assert(Ariel2.insert([], 14) == [14])

    @tag :optional
    test "insert at the beginning",
      do: assert(Ariel2.insert([5, 6, 7, 8], 4) == [4, 5, 6, 7, 8])

    @tag :optional
    test "insert in the middle",
      do: assert(Ariel2.insert([1, 3, 6, 7, 9, 16], 5) == [1, 3, 5, 6, 7, 9, 16])

    @tag :optional
    test "insert at the end",
      do: assert(Ariel2.insert([1, 5, 6], 10) == [1, 5, 6, 10])
  end

  describe "insertion_sort:" do
    @tag :optional
    test "empty list",
      do: assert(Ariel2.insertion_sort([]) == [])

    @tag :optional
    test "unsorted list",
      do:
        assert(Ariel2.insertion_sort([4, 3, 6, 8, 3, 0, 9, 1, 7]) == [0, 1, 3, 3, 4, 6, 7, 8, 9])

    @tag :optional
    test "sorted list",
      do: assert(Ariel2.insertion_sort([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6])

    @tag :optional
    test "inverted list",
      do: assert(Ariel2.insertion_sort([6, 5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5, 6])

    @tag :optional
    test "repeated elements",
      do: assert(Ariel2.insertion_sort([5, 5, 5, 1, 5, 5, 5]) == [1, 5, 5, 5, 5, 5, 5])
  end

  describe "rotate_left: " do
    # @tag :optional
    test "empty list",
      do: assert(Ariel2.rotate_left([], 5) == [])

    # @tag :optional
    test "0 rotation",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 0) == [:a, :b, :c, :d, :e, :f, :g]
        )

    # @tag :optional
    test "1 rotation",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 1) == [:b, :c, :d, :e, :f, :g, :a]
        )

    # @tag :optional
    test "-1 rotation",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -1) == [:g, :a, :b, :c, :d, :e, :f]
        )

    # @tag :optional
    test "3 rotation",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 3) == [:d, :e, :f, :g, :a, :b, :c]
        )

    # @tag :optional
    test "-3 rotation",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -3) == [:e, :f, :g, :a, :b, :c, :d]
        )

    # @tag :optional
    test "greater than length",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 8) == [:b, :c, :d, :e, :f, :g, :a]
        )

    # @tag :optional
    test "negative greater than length",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -8) == [:g, :a, :b, :c, :d, :e, :f]
        )

    # @tag :optional
    test "multiples of rotation 1",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 45) == [:d, :e, :f, :g, :a, :b, :c]
        )

    # @tag :optional
    test "negative multiples of rotation 1",
      do:
        assert(
          Ariel2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -45) == [:e, :f, :g, :a, :b, :c, :d]
        )
  end

  describe "prime_factors:" do
    # @tag :optional
    test "factor of 1",
      do: assert(Ariel2.prime_factors(1) == [])

    # @tag :optional
    test "factors of 2",
      do: assert(Ariel2.prime_factors(2) == [2])

    # @tag :optional
    test "factors of 6",
      do: assert(Ariel2.prime_factors(6) == [2, 3])

    # @tag :optional
    test "factors of 96",
      do: assert(Ariel2.prime_factors(96) == [2, 2, 2, 2, 2, 3])

    # @tag :optional
    test "factors of 467",
      do: assert(Ariel2.prime_factors(467) == [467])

    # @tag :optional
    test "factors of 666",
      do: assert(Ariel2.prime_factors(666) == [2, 3, 3, 37])
  end

  describe "gcd:" do
    @tag :optional
    test "gcd(0, 0)",
      do: assert(Ariel2.gcd(0, 0) == 0)

    @tag :optional
    test "gcd(3, 0)",
      do: assert(Ariel2.gcd(3, 0) == 3)

    @tag :optional
    test "gcd(0, 2)",
      do: assert(Ariel2.gcd(0, 2) == 2)

    @tag :optional
    test "gcd(2, 2)",
      do: assert(Ariel2.gcd(2, 2) == 2)

    @tag :optional
    test "gcd(10, 8)",
      do: assert(Ariel2.gcd(10, 8) == 2)

    @tag :optional
    test "gcd(8, 10)",
      do: assert(Ariel2.gcd(8, 10) == 2)

    @tag :optional
    test "gcd(270, 192)",
      do: assert(Ariel2.gcd(270, 192) == 6)

    @tag :optional
    test "gcd(13, 7919)",
      do: assert(Ariel2.gcd(13, 7919) == 1)

    @tag :optional
    test "gcd(20, 16)",
      do: assert(Ariel2.gcd(20, 16) == 4)

    @tag :optional
    test "gcd(54, 24)",
      do: assert(Ariel2.gcd(54, 24) == 6)

    @tag :optional
    test "gcd(6307, 1995)",
      do: assert(Ariel2.gcd(6307, 1995) == 7)
  end

  describe "deep_reverse:" do
    @tag :optional
    test "empty list",
      do: assert(Ariel2.deep_reverse([]) == [])

    @tag :optional
    test "list with 2 elements",
      do: assert(Ariel2.deep_reverse([:a, :b]) == [:b, :a])

    @tag :optional
    test "list with 3 elements",
      do: assert(Ariel2.deep_reverse([:a, :b, :c]) == [:c, :b, :a])

    @tag :optional
    test "one nested list",
      do: assert(Ariel2.deep_reverse([:a, [:b, :c, :d], 3]) == [3, [:d, :c, :b], :a])

    @tag :optional
    test "two nested lists",
      do:
        assert(
          Ariel2.deep_reverse([:a, [:b, :c, :d], 3, [4, 5, 6]]) == [
            [6, 5, 4],
            3,
            [:d, :c, :b],
            :a
          ]
        )

    @tag :optional
    test "nested 2 deep",
      do: assert(Ariel2.deep_reverse([[1, 2], 3, [4, [5, 6]]]) == [[[6, 5], 4], 3, [2, 1]])
  end

  describe "insert_everywhere:" do
    @tag :optional
    test "insert in empty list",
      do: assert(Ariel2.insert_everywhere([], :x) == [[:x]])

    @tag :optional
    test "insert in list with one element",
      do: assert(Ariel2.insert_everywhere([:a], :x) == [[:x, :a], [:a, :x]])

    @tag :optional
    test "insert in list with three elements",
      do:
        assert(
          Ariel2.insert_everywhere([:a, :b, :c], :x) ==
            [[:x, :a, :b, :c], [:a, :x, :b, :c], [:a, :b, :x, :c], [:a, :b, :c, :x]]
        )

    @tag :optional
    test "insert in list with five elements",
      do:
        assert(
          Ariel2.insert_everywhere([:a, :b, :c, :d, :e], :x) ==
            [
              [:x, :a, :b, :c, :d, :e],
              [:a, :x, :b, :c, :d, :e],
              [:a, :b, :x, :c, :d, :e],
              [:a, :b, :c, :x, :d, :e],
              [:a, :b, :c, :d, :x, :e],
              [:a, :b, :c, :d, :e, :x]
            ]
        )
  end

  # RLE

  describe "pack:" do
    # @tag :optional
    test "empty list",
      do: assert(Ariel2.pack([]) == [])

    # @tag :optional
    test "list with 1 element",
      do: assert(Ariel2.pack([:a]) == [[:a]])

    # @tag :optional
    test "list with multiple repeated elements",
      do:
        assert(
          Ariel2.pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
            [[:a, :a, :a, :a], [:b], [:c, :c], [:a, :a], [:d], [:e, :e, :e, :e]]
        )

    # @tag :optional
    test "list with no repeated elements",
      do: assert(Ariel2.pack([1, 2, 3, 4, 5]) == [[1], [2], [3], [4], [5]])

    # @tag :optional
    test "list with all repeated elements",
      do: assert(Ariel2.pack([9, 9, 9, 9, 9]) == [[9, 9, 9, 9, 9]])
  end

  describe "compress:" do
    @tag :optional
    test "empty list",
      do: assert(Ariel2.compress([]) == [])

    @tag :optional
    test "list with 1 element",
      do: assert(Ariel2.compress([:a]) == [:a])

    @tag :optional
    test "list with multiple repeated elements",
      do:
        assert(
          Ariel2.compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
            [:a, :b, :c, :a, :d, :e]
        )

    @tag :optional
    test "list with no repeated elements",
      do: assert(Ariel2.compress([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5])

    @tag :optional
    test "list with all repeated elements",
      do: assert(Ariel2.compress([9, 9, 9, 9, 9]) == [9])
  end

  describe "encode:" do
    # @tag :optional
    test "empty list",
      do: assert(Ariel2.encode([]) == [])

    # @tag :optional
    test "list with 1 element",
      do: assert(Ariel2.encode([:a]) == [{1, :a}])

    # @tag :optional
    test "list with multiple repeated elements",
      do:
        assert(
          Ariel2.encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
            [{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]
        )

    # @tag :optional
    test "list with no repeated elements",
      do: assert(Ariel2.encode([1, 2, 3, 4, 5]) == [{1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}])

    # @tag :optional
    test "list with all repeated elements",
      do: assert(Ariel2.encode([9, 9, 9, 9, 9]) == [{5, 9}])
  end

  describe "encode_modified:" do
    @tag :optional
    test "empty list",
      do: assert(Ariel2.encode_modified([]) == [])

    @tag :optional
    test "list with 1 element",
      do: assert(Ariel2.encode_modified([:a]) == [:a])

    @tag :optional
    test "list with multiple repeated elements",
      do:
        assert(
          Ariel2.encode_modified([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
            [{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]
        )

    @tag :optional
    test "list with no repeated elements",
      do: assert(Ariel2.encode_modified([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5])

    @tag :optional
    test "list with all repeated elements",
      do: assert(Ariel2.encode_modified([9, 9, 9, 9, 9]) == [{5, 9}])
  end

  describe "decode:" do
    # @tag :optional
    test "empty list",
      do: assert(Ariel2.decode([]) == [])

    # @tag :optional
    test "list with 1 element",
      do: assert(Ariel2.decode([:a]) == [:a])

    # @tag :optional
    test "list with multiple repeated elements",
      do:
        assert(
          Ariel2.decode([{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]) ==
            [:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]
        )

    # @tag :optional
    test "list with no repeated elements",
      do: assert(Ariel2.decode([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5])

    # @tag :optional
    test "list with all repeated elements",
      do: assert(Ariel2.decode([{5, 9}]) == [9, 9, 9, 9, 9])
  end

  #  describe "args_swap:" do
  #    do: assert Ariel2.args_swap(list).(1, 2) == [2, 1]
  #    do: assert Ariel2.args_swap(/).(8, 2) == 1/4
  #    do: assert Ariel2.args_swap(cons).([1, 2, 3], [4, 5, 6]) == [(4, 5, 6], 1, 2, 3)
  #    do: assert Ariel2.args_swap(map).([-1, 1, 2, 5, 10], /) == [-1, 1, 1/2, 1/5, 1/10]
  #  end
  #
  #  describe "there_exists_one?:" do
  #    do: assert Ariel2.there_exists_one?(positive?, []) == #f
  #    do: assert Ariel2.there_exists_one?(positive?, [-1, -10, 4, -5, -2, -1]) == #t
  #    do: assert Ariel2.there_exists_one?(positive?, [-1, -10, 4, -5, 2, -1]) == #f
  #    do: assert Ariel2.there_exists_one?(negative?, [-1]) == #t
  #    do: assert Ariel2.there_exists_one?(symbol?, [4, 8, 15, 16, 23, 42]) == #f
  #    do: assert Ariel2.there_exists_one?(symbol?, [4, 8, 15, sixteen, 23, 42]) == #t
  #  end

  describe "linear_search:" do
    @tag :optional
    test "empty list",
      do: assert Ariel2.linear_search([], 5, &Kernel.==/2) == false
    @tag :optional
    test "compare numbers",
      do: assert Ariel2.linear_search([48, 77, 30, 31, 5, 20, 91, 92, 69, 97, 28, 32, 17, 18, 96], 5, &Kernel.==/2) == 4
    @tag :optional
    test "compare strings",
      do: assert Ariel2.linear_search(["red", "blue", "green", "black", "white"], "black", &String.equivalent?/2) == 3
    @tag :optional
    test "compare atoms",
      do: assert Ariel2.linear_search([:a, :b, :c, :d, :e, :f, :g, :h], :h, &Kernel.==/2) == 7
    @tag :optional
    test "string contains",
      do: assert Ariel2.linear_search(["terminal", "keyboard", "mouse", "monitor"], "ous", &String.contains?/2) == 2
  end
end
