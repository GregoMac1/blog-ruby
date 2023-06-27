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

   - Muestra la lista de noticias en la que se muestran los datos:
     - Título.
     - Imagen.
     - Autor.
     - Fecha de creación.
   - Muestra un enlace en el título de cada noticia a la página de la noticia.
   - Muestra un botón para crear una noticia (solo para usuarios editores).

2. **Página de creación de noticia** (solo para usuarios editores): /posts/new

   - Muestra un formulario para crear una noticia con los campos:
     - Título.
     - Imagen.
     - Cuerpo.
   - Muestra un botón para crear la noticia.

3. **Página de una noticia**: /posts/:id

   - Muestra el título de la noticia.
   - Muestra la imagen de la noticia.
   - Muestra el autor de la noticia.
   - Muestra el cuerpo de la noticia.
   - Muestra la fecha de creación de la noticia.
   - Muestra la fecha de última modificación de la noticia y el usuario que la modificó por última vez.
   - Muestra la lista de comentarios de la noticia.
   - Muestra un formulario para crear un comentario (sólo para usuarios lectores o editores).
   - Muestra un indicador si otro usuario está escribiendo un comentario.
   - Muestra un botón para editar la noticia (solo para usuarios editores).
   - Muestra un botón para ocultar/mostrar la noticia (solo para usuarios editores).
   - Muestra un botón para eliminar la noticia si está oculta (solo para usuarios editores).

4. **Página de edición de noticia** (solo para usuarios editores): /posts/:id/edit

   - Muestra el autor de la noticia.
   - Muestra la fecha de creación de la noticia.
   - Muestra la fecha de última modificación de la noticia.
   - Muestra un indicador si otro usuario está editando la noticia.
   - Muestra un formulario para editar la noticia con los campos:
     - Título.
     - Imagen.
     - Cuerpo.
   - Muestra un botón para guardar los cambios.

### Uso de WebSockets

Se utilizarán WebSockets para notificar a los usuarios de los siguientes eventos:

- Un usuario publicó una noticia.
- Un usuario empieza a escribir un comentario.
- Un usuario deja de escribir un comentario.
- Un usuario escribió un comentario.
- Un usuario está editando una noticia.
- Un usuario dejó de editar una noticia.
- Un usuario editó una noticia.
