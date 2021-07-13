defmodule KeywordLists do
  use Koans

  @intro "KeywordLists"

  koan "Like maps, keyword lists are key-value pairs" do
    kw_list = [foo: "bar"]

    assert kw_list[:foo] == "bar"
  end

  koan "Keys may be repeated, but only the first is accessed" do
    kw_list = [foo: "bar", foo: "baz"]

    assert kw_list[:foo] == "bar"
  end

  koan "You could access the values of repeating key" do
    kw_list = [foo: "bar", foo1: "bar1", foo: "baz"]

    assert Keyword.get_values(kw_list, :foo) == ["bar", "baz"]
  end

  koan "Keyword lists are just special syntax for lists of two-element tuples" do
    assert [foo: "bar"] == [{:foo, "bar"}]
  end

  koan "But unlike maps, the keys in keyword lists must be atoms" do
    not_kw_list = [{"foo", "bar"}]

    # We use a stricter version of assert_raise() with 3 arguments, which takes
    # an additional string or regex as the 2nd argument to match against the
    # exception's message.
    assert_raise ArgumentError, "the Access calls for keywords expect the key to be an atom, got: \"foo\"", fn -> not_kw_list["foo"] end
  end
end
