defmodule Chatterize.ChatChannel do
  use Phoenix.Channel
  intercept ["new_message"]

  def join("chat:lobby", _message, socket) do
    send(self, :user_joined)
    {:ok, socket}
  end

  def handle_info(:user_joined, socket) do
    broadcast! socket, "new_message",  %{id: socket.assigns[:public_id], body: "#{socket.assigns[:public_id]} joined the chat."}
    {:noreply, socket}
  end


  def handle_in("new_message", %{"body" => body}, socket) do
    broadcast! socket, "new_message", %{id: socket.assigns[:public_id], body: body}
    {:noreply, socket}
  end

  def handle_out("new_message", payload, socket) do
    push socket, "new_message", payload
    {:noreply, socket}
  end

  def terminate(msg, socket) do
    broadcast! socket, "new_message", %{id: socket.assigns[:public_id], body: "#{socket.assigns[:public_id]} left the chat."}
  end
end
