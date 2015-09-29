BOT ALTENWALD
=============

BOT to send and receive stanzas to/from XMPP server using Elixir.

* NOTE: This BOT is only for testing purposes.

**Dependencies:**

	* Hedwig - XMPP Client Framework

**How to use:**

Download the code from github repo:

```bash
git clone https://github.com/zgbjgg/elixir_bot
```

Download dependencies and compile:

```bash
make 
```

Start the Elixir Interactive Shell and play:

```bash
$ iex -S mix
```

Create a client to connect against the server:

```elixir
iex(1)> client = BOT.make_client('allison@zgbjggs-macbook-pro.local', '123456')
%{handlers: [{Hedwig.Handlers.Receiver, %{}}],
  jid: "allison@zgbjggs-macbook-pro.local", nickname: "allison", password: "123456",
  resource: "altenwald", rooms: []}
```

Connect the client:

```elixir
iex(3)> BOT.connect_client(client)
{:ok, #PID<0.144.0>}
```

Create a stanza:

```elixir
stanza = Hedwig.Stanza.iq('some', 'set', {:xmlel, "data", [{"xmlns", 'some-ns'}], []})   
{:xmlel, "iq", [{"to", 'some'}, {"type", 'set'}, {"id", "0868"}],
 {:xmlel, "data", [{"xmlns", 'some-ns'}], []}}
iex(2)> Hedwig.Stanza.to_xml(stanza)
"<iq to='some' type='set' id='0868'><data xmlns='some-ns'/></iq>"
```

In order to create a valid stanza, the third parameter would be a xmlel record with this:

* Name 
* Attrs
* Body (which also is a xmlel element)


Send the stanza from client:

```elixir
BOT.send_stanza(client, stanza)
```

All the logs of incoming and outgoing stanzas will be printed into console.

