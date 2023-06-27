import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  connect() {
    createConsumer().subscriptions.create("PostsChannel", {
      received: (data) => {
        switch (data.action) {
          case "new_post":
            const posts = document.getElementById("posts");
            posts.insertAdjacentHTML("afterbegin", data.html);
            break;
        }
      },
    });
  }
}
