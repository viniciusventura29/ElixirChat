defmodule ChatMutipleRoomsWeb.ChatChannel do
  use ChatMutipleRoomsWeb, :channel

  alias ChatMutipleRooms.Chats

  @impl true
  def join("chat:" <> _room, _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    "chat:"<> room = socket.topic
    payload = Map.merge(payload, %{"room" => room})
    Chats.create_message(payload)
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

end
