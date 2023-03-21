## Especificación de requerimientos

### Actores

1. Usuario **anónimo**:
   - Puede ver la lista de noticias.
   - Puede ver una noticia.
   - Puede ver los comentarios de una noticia.
2. Usuario **lector**:
   - Puede ver la lista de noticias.
   - Puede ver una noticia.
   - Puede ver los comentarios de una noticia.
   - Puede crear un comentario en una noticia.
3. Usuario **editor**:
   - Puede ver la lista de noticias.
   - Puede ver una noticia.
   - Puede ver los comentarios de una noticia.
   - Puede crear un comentario en una noticia.
   - Puede crear una noticia.
   - Puede editar una noticia.
   - Puede ocultar una noticia.
   - Puede mostrar una noticia.
   - Puede eliminar una noticia que esté oculta.

### Páginas

1. **Página de inicio**: /posts

   - Muestra la lista de noticias en la que se muestran los campos:
     - Título.
     - Autor.
     - Fecha de creación.
     - Fecha de última modificación.
   - Muestra un enlace en el título de cada noticia a la página de la noticia.
   - Muestra un botón para crear una noticia (solo para usuarios editores).
   - Muestra un botón para editar cada noticia (solo para usuarios editores).
   - Muestra un botón para ocultar/mostrar cada noticia (solo para usuarios editores).
   - Muestra un botón para eliminar cada noticia que esté oculta (solo para usuarios editores).

2. **Página de creación de noticia** (solo para usuarios editores): /posts/new

   - Muestra un formulario para crear una noticia con los campos:
     - Título.
     - Cuerpo.
   - Muestra un botón para crear la noticia.

3. **Página de una noticia**: /posts/:id

   - Muestra el título de la noticia.
   - Muestra el autor de la noticia.
   - Muestra el cuerpo de la noticia.
   - Muestra la fecha de creación de la noticia.
   - Muestra la fecha de última modificación de la noticia.
   - Muestra un indicador si otro usuario acaba de editar la noticia.
   - Muestra la lista de comentarios de la noticia.
   - Muestra un formulario para crear un comentario (sólo para usuarios lectores).
   - Muestra un indicador si otro usuario está escribiendo un comentario.
   - Muestra un botón para editar la noticia (solo para usuarios editores).
   - Muestra un botón para ocultar/mostrar la noticia (solo para usuarios editores).
   - Muestra un botón para eliminar la noticia si está oculta (solo para usuarios editores).

4. **Página de edición de noticia** (solo para usuarios editores): /posts/:id/edit

   - Muestra el título de la noticia.
   - Muestra el autor de la noticia.
   - Muestra el cuerpo de la noticia.
   - Muestra la fecha de creación de la noticia.
   - Muestra la fecha de última modificación de la noticia.
   - Muestra un indicador si otro usuario editor está editando la noticia.
   - Muestra un formulario para editar la noticia con los campos:
     - Título.
     - Cuerpo.
   - Muestra un botón para guardar los cambios.

5. **Página de conversaciones**: /chat

   - Muestra la lista de conversaciones en la que se muestran los campos:
     - Nombre del otro usuario.
     - Estado (conectado/desconectado).
     - Último mensaje.
     - Fecha del último mensaje.
   - Muestra un enlace en el nombre de cada conversación a la página de la conversación.
   - Muestra un botón para crear una conversación.

6. **Página de una conversación**: /chat/:id

   - Muestra el nombre del otro usuario.
   - Muestra el estado (conectado/desconectado).
   - Muestra la lista de mensajes de la conversación.
   - Muestra un campo para escribir un mensaje.
   - Muestra un indicador si otro usuario está escribiendo un mensaje.

### Uso de WebSockets

Se utilizarán WebSockets para notificar a los usuarios de los siguientes eventos:

- Un usuario está escribiendo un comentario.
- Un usuario escribió un comentario.
- Un usuario está editando una noticia.
- Un usuario editó una noticia.
- Un usuario se ha conectado/desconectado.
- Un usuario está escribiendo un mensaje.
- Un usuario escribió un mensaje.
