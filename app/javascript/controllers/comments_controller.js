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
        received: (data) => {
          switch (data.action) {
            case "new_comment":
              const commentsList = document.getElementById("comments-list");
              commentsList.insertAdjacentHTML("beforeend", data.html);
              if (data.current_user === data.comment.user_id)
                document.getElementById("comment-body-input").value = "";
              break;
            case "typing":
              const current_user =
                commentsBlock.getAttribute("data-current-user");
              if (current_user === String(data.user_id)) return;

              const typingIndicator =
                document.getElementById("typing-indicator");
              if (data.enabled) {
                typingIndicator.innerHTML = `${data.user_name} está escribiendo un comentario...`;
                typingIndicator.style.display = "block";
              } else {
                typingIndicator.style.display = "none";
              }
              break;
          }
        },
      }
    );
  }
}
