defmodule FixateTest do
  use ExUnit.Case
  use Fixate.Case

  @fixture "text.txt"
  @fixture named_text: "text.txt"
  @fixture "subdirectory/subtext.txt"
  test "Reads basic files", ctx do
    assert ctx.text == "OK"
    assert ctx.text == ctx.named_text
    assert ctx.subtext == "SUB_OK"
  end

  test "Does not leak between tests", ctx do
    assert_raise KeyError, ~r/^key :text not found in:.*/, fn -> ctx.text end
  end

  @fixture "number.integer.txt"
  @fixture named_number: "number.integer.txt"
  test "Parses integer", ctx do
    assert ctx.number == 42
    assert ctx.number == ctx.named_number
  end
end
