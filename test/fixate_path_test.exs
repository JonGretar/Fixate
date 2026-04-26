defmodule Fixate.FixturePathTest do
  use ExUnit.Case

  test "fixture_path/0 returns the configured path" do
    assert Fixate.fixture_path() == "test/fixtures"
  end
end
