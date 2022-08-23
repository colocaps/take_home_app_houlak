# houlak_take_home_app

Test Flutter App.

## Getting Started

Este proyecto se realizo con la API de Spotify para developers.

Funciona con un token generado en 0Auth2 proporcionado por la misma API.

Alguna cosas a saber de este proyecto:

- Se utiliza Clean Architecture para toda la estructura del proyecto.
- Se utiliza Clean Code para mejor lectura del proyecto.
- Se utiliza Inyeccion de dependencias y con un service locator en este caso manejado por el paquete get_it.
- Se utiliza principios SOLID en la mayoria de los casos.
- Se utilizan varios patrones de diseño como por ejemplo Singleton, abstract fatory, adapter entre otros.
- A su vez se utiliza BloC para manejo de estados.
- Se implemento, en su mayoria, abstracciones para que el proyecto no sufra de acoplamiento, pudiendo agregar o modificar componentes sin riesgo.
- Se creo un Theme Manager para la correcta utilizacion de colores, fuentes, tamaños, asi cuando el usuario decida cambiar el tema de su telefono, cambie automaticamente de light a dark cuando sea necesario.
- Se utiliza la internacionalizacion de flutter l10n y i18n , que tambien cuando el usuario cambie el idioma de su telefono se cambie automaticamente el la aplicacion.(Solo españo e ingles por ahora).
- La app esta separada por packages para evitar el acoplamiento. La idea es que solo lo que sea necesario utilizar globalmente sea conocido por todos los paquetes en este caso el package Core. Lo demas solo sera conocido por el root de la app.
- Se utilizo Github como herramienta para el control de versiones, donde se creo una rama para cada package donde se realizaban commits cortos y claros en la mayoria de los casos y se hicieron los respectivos PR a master/main tras finalizado el desarrollo de cada tarea.

Documentacion de la API de Spotify

- [Console for developers of Spotify](https://developer.spotify.com/console/)

Paquetes utilizados de terceros:

- Flutter BloC
- Auto Size Text
- Flutter web auth
- Top Snackbar flutter
- Intl
- Mocktail (para test)
- Audio player
- Get it

Todos estos paquetes han sido aprobados con un 90% o mas en pub.dev y tienen sus respectivas abstracciones creadas en caso de que alguno deje de tener actualizaciones o sea dado de baja para poder reemplazarlo sin provocar un blocker haciendo esta tarea mas sencilla.

Esta App ha sido desarrollada por Esteban Farias, flutter dev.

Para mas info visita mi web que esta completamente realizada en Flutter. (Todavia en consturccion)

- [Esteban Farias Flutter Dev.](https://colocaps.github.io/)

## Detalles

Detalles faltantes a tener en cuenta

- Se podria mejorar la implementacion del inicio de sesion ya que solo se utilizo el Implicit Grant Flow que no es lo mas seguro para una app. Para esto seria bueno tambien implementar el paquete de shared_preferences para guardar el token. Teniendo esto en cuenta se puede implementar un decoder para el token y saber cuando caduca.

- Se podria tambien implementar el cierre de sesion del usuario.

- Se podria mejorar la utilizacion de el audio player, ya que ahora solo puede dar Play y Stop solamente. (Lo que haria seria hacer un package con el audio player aparte y manejar todo desde ahi con estados).

- Se dejo preparada la app en caso de querer agrear ademas de busqueda por artista, tambien de otros types como Album, Playlist, Track, etc.

- Se deja preparada la app para agregar textos a la internazionalizacion.

- Tambien se podria implementar un plugin para ejecutar todos los test de una sola vez.
