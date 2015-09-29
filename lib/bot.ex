defmodule BOT do

def make_client(jid, password) do
    [nickname | _] = :string.tokens(jid, '@')
    %{ jid: :erlang.list_to_binary(jid),
       password: :erlang.list_to_binary(password),
       nickname: :erlang.list_to_binary(nickname),
       resource: "bot",
       rooms: [],
       handlers: [{Hedwig.Handlers.Receiver, %{}}]
    }
end

def connect_client(client) do

    # Start the client, the client is made with `make_client/2` 
    {:ok, _pid} = Hedwig.start_client(client)

end

def disconnect_client(client) do
    
    # Get the pid of the client by the JID
    pid = Hedwig.whereis(client[:jid])

    # Stop the client.
    Hedwig.stop_client(pid)
end

def send_stanza(client, stanza) do

    # Get the pid of the client by the JID
    pid = Hedwig.whereis(client[:jid])

    Hedwig.Client.reply(pid, stanza)
end

end
