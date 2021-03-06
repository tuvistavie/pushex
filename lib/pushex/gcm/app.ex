defmodule Pushex.GCM.App do
  @moduledoc """
  `Pushex.GCM.App` represents a GCM application.

  The `name` is a unique identifier used to find the application,
  and the `auth_key` is the API key provided by Google.
  """
  use Vex.Struct

  defstruct [:name, :auth_key]

  @type t :: %__MODULE__{name: String.t, auth_key: String.t}

  validates :name,
    presence: true,
    type: [is: :string]
  validates :auth_key,
    presence: true,
    type: [is: :string]

  def create(app) do
    app = struct(Pushex.GCM.App, app)
    Pushex.Util.validate(app)
  end
  def create!(app) do
    case create(app) do
      {:ok, app} -> app
      {:error, errors} -> raise Pushex.ValidationError, errors: errors
    end
  end
end
