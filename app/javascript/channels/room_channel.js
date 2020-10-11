import consumer from "./consumer"
$(document).on('turbolinks:load', function () {
  if ($('#room').length) {
    const chatChannel = consumer.subscriptions.create({ channel: "RoomChannel", room_id: $('#room').data('room_id') }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        const element = document.getElementById('room');
        if (element.dataset.user_id == data.user_id) {
          const html = this.createspeakR(data);
          element.insertAdjacentHTML('beforeend', html);
        } else {
          const html = this.createspeakL(data);
          element.insertAdjacentHTML('beforeend', html);
        };
        document.getElementById('message_message').value = ''
      },

      createspeakR(data) {
        return `
          <div class="balloon_r">
            <div class="faceicon">
              <img class="ui circular image" src=${data.iconurl}>
            </div>
            <div class="meta room_meta_r">
              <span class="date">${data.time}</span>
            </div>
            <div class="says">
              <div class="content">
              ${data.message}
              </div>
            </div>
          </div>
        `
      },
      createspeakL(data) {
        return `
          <div class="balloon_l">
            <div class="faceicon">
              <img class="ui circular image" src=${data.iconurl}>
            </div>
            <div class="says">
              <div class="content">
              ${data.message}
              </div>
            </div>
            <div class="meta room_meta_l">
              <span class="date">${data.time}</span>
            </div>
          </div>
        `
      }
    });
    this.subscription = chatChannel;
  }
  else if (this.subscription) {
    consumer.subscriptions.remove(this.subscription);
  };
});
