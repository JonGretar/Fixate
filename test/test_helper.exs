ExUnit.start()
Fixate.start(fixture_path: "test/fixtures")

Fixate.add_parser("integer.txt", &String.to_integer(&1))
