defmodule AddressBook.People.Person do
  use Ecto.Schema
  use Timex
  import Ecto.Changeset

  schema "people" do
    field :address, :string
    field :age, :integer
    field :birthday, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    attrs = if attrs["birthday"] do
      bday = attrs["birthday"]
      {year, _} = Integer.parse(bday["year"])
      {month, _} = Integer.parse(bday["month"])
      {day, _} = Integer.parse(bday["day"])
      case Timex.parse("#{year}/#{month}/#{day}", "{YYYY}/{M}/{D}") do
        {:ok, date} ->
          age = Timex.diff(Timex.now, date, :years)
          Map.put(attrs, "age", age)
        {:error, msg} -> IO.puts msg
      end
    else
      attrs
    end

    person
    |> cast(attrs, [:name, :age, :birthday, :address])
    |> validate_required([:name, :age, :birthday, :address])
  end
end
