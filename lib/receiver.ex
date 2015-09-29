defmodule Hedwig.Handlers.Receiver do
    @moduledoc """
    Parse the incoming stanza, after BOT has sent any stanza to the server.
    """

    @usage """
    Nothing
    """

    use Hedwig.Handler

    def handle_event(%Message{} = msg, opts) do
        Logger.info fn -> "Message Incoming Stanza: #{inspect msg}" end
        {:ok, opts}
    end

    def handle_event(%Presence{} = presence, opts) do
        Logger.info fn -> "Presence Incoming Stanza: #{inspect presence}" end
        {:ok, opts}
    end

    def handle_event(%IQ{} = iq, opts) do
        Logger.info fn -> "IQ Incoming Stanza: #{inspect iq}" end
        {:ok, opts}
    end

    def handle_event(_, opts), do: {:ok, opts}

end
