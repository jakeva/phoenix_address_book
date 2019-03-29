defmodule AddressBook.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :age, :integer
      add :birthday, :date
      add :address, :string

      timestamps()
    end

  end
end
