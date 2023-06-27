import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  connect() {
    const post_id = document
      .getElementById("comments")
      .getAttribute("data-post-id");
    console.log(post_id);
    createConsumer().subscriptions.create(
      {
        channel: "CommentsChannel",
        post_id: post_id,
      },
      {
        connected: () => {
          console.log(`Connected to ${post_id}`);
        },
        received: (data) => {
          console.log(data);
          //console.log(this);
          /*switch (data.action) {
            case "create":
              this.element.insertAdjacentHTML("beforeend", data.comment);
              break;
            case "is_typing":
              this.element.querySelector(
                `#comment-${data.comment_id} .typing-indicator`
              ).style.display = "block";
              break;
            case "not_typing":
              this.element.querySelector(
                `#comment-${data.comment_id} .typing-indicator`
              ).style.display = "none";
              break;
          }*/
        },
      }
    );
  }
}

/*document.addEventListener("turbolinks:load", () => {
  const post_id = document
    .getElementById("post-id")
    .getAttribute("data-post-id");
  console.log(post_id);

  consumer.subscriptions.create(
    {
      channel: "CommentsChannel",
      post_id: this.element.dataset.postid,
    },
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        switch (data.action) {
          case "create":
            this.element.insertAdjacentHTML("beforeend", data.comment);
            break;
          case "is_typing":
            this.element.querySelector(
              `#comment-${data.comment_id} .typing-indicator`
            ).style.display = "block";
            break;
          case "not_typing":
            this.element.querySelector(
              `#comment-${data.comment_id} .typing-indicator`
            ).style.display = "none";
            break;
        }
      },
    }
  );
});*/
