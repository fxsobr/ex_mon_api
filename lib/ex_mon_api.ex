defmodule ExMonApi do
  @moduledoc """
  Modulo
  """
  alias ExMonApi.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
end
