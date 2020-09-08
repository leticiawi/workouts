// app/javascript/channels/chatroom_channel.js
import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    console.log("oi")

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initChatroomCable };

// tutorial
// class ChatRoomsChannel < ApplicationCable::Channel
//   def subscribed
//     stream_from "chat_room_#{params[:chat_room_id]}"
//   end
// end
