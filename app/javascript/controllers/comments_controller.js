import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  connect() {
    const commentsBlock = document.getElementById("comments");
    const postId = commentsBlock.getAttribute("data-post-id");
    console.log(postId);

    createConsumer().subscriptions.create(
      {
        channel: "CommentsChannel",
        post_id: postId,
      },
      {
        connected: () => {
          console.log(`Connected to ${postId}`);
        },
        received: (data) => {
          console.log(data);
          switch (data.action) {
            case "new_comment":
              commentsBlock.insertAdjacentHTML("beforeend", data.comment);
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
  }
}
