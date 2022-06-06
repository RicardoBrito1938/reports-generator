defmodule ReportsGenerator.Parser do
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)

    # different sintax
    # |> Stream.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    # e-commecial to say we have a anonymous function
    # another option coulde be:
    # List.update_at(2, fn elem -> String.to_integer(elem) end )
    |> List.update_at(2, &String.to_integer/1)
  end
end
