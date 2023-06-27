import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  constructor(...args) {
    super(...args);
    this.consumer = createConsumer();
  }
  connect() {
    const postId = document
      .getElementById("editing")
      .getAttribute("data-post-id");

    this.consumer.subscriptions.create(
      { channel: "PostEditingChannel", post_id: postId },
      {
        received: (data) => {
          const current_user = document
            .getElementById("editing")
            .getAttribute("data-current-user");
          if (current_user === String(data.user_id)) return;
          switch (data.action) {
            case "editing":
              const editingIndicator =
                document.getElementById("editing-indicator");
              if (data.enabled) {
                editingIndicator.innerHTML = `${data.user_name} está editando esta noticia.`;
                editingIndicator.style.display = "block";
              } else {
                editingIndicator.style.display = "none";
              }
              break;
            case "updated":
              const updatedIndicator =
                document.getElementById("updated-indicator");
              updatedIndicator.innerHTML = `${data.user_name} acaba de editar esta noticia. Recargue la página para ver los cambios.`;
              updatedIndicator.style.display = "block";
          }
        },
      }
    );
  }
  disconnect() {
    this.consumer.subscriptions.subscriptions.forEach((subscription) => {
      this.consumer.subscriptions.remove(subscription);
    });
  }
}
