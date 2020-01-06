defmodule SendGrid.Email.Asm do
  defstruct group_id: nil, groups_to_display: nil

  defimpl Jason.Encoder do
    def encode(%{group_id: nil}, opts) do
      Jason.Encode.atom(nil, opts)
    end

    def encode(%{group_id: group_id, groups_to_display: groups_to_display}, opts) do
      params =
        %{}
        |> put_value(:group_id, group_id)
        |> put_value(:groups_to_display, groups_to_display)

      Jason.Encode.map(params, opts)
    end

    defp put_value(map, _key, nil), do: map
    defp put_value(map, key, value), do: Map.put(map, key, value)
  end
end
