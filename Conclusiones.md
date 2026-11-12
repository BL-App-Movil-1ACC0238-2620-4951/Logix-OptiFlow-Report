<div style="break-before: page; page-break-before: always;"></div>

# Conclusiones

En AV2, OptiFlow pasa del diseño a un producto que se puede usar. El problema que atiende sigue siendo el mismo: la información de las ópticas, los pacientes y los pedidos está repartida en varios canales. Con el backend, la aplicación Kotlin y la Landing Page publicados, el paciente puede buscar una óptica, reservar una cita y seguir su pedido desde un solo lugar. Falta medir con usuarios reales si esto reduce el tiempo de atención.

Varios estudios tratan la asistencia a citas y la reserva en línea. Abbas et al. (2025) identifican características del paciente y de la cita asociadas con la inasistencia en una práctica de retina, y Kammrath Betancor et al. (2025) estudian la programación en línea en dos servicios de oftalmología. Estos trabajos ayudaron a elegir qué medir en OptiFlow (reservas, asistencia y seguimiento), pero sus resultados son de otros establecimientos y no se presentan como resultados del proyecto.

EventStorming, Domain Message Flows y Bounded Context Canvases permitieron separar las responsabilidades de Search & Booking, Clinical & Commercial, Production & Tracking, Store Management & Inventory y Notification & Loyalty. En el backend, los cinco contextos comparten una base PostgreSQL con 27 tablas creadas por las migraciones V1 a V9. El [Anexo F](Anexos.md#anexo-f-diagramas-de-diseño-táctico) separa los diagramas de diseño de las tablas reales. El backend también integra la pasarela de pagos y Firebase Cloud Messaging, y la aplicación usa OpenStreetMap para el mapa y ML Kit para el escáner y el probador virtual, que funcionan en el propio celular.

En el Sprint 2, el backend pasó a rutas `/api/v1` con tokens de sesión, permisos por rol y búsqueda por cercanía. El 11/11/2026, el commit `71ed60c` aprobó 133 pruebas automatizadas sin fallos, incluidos cuatro escenarios Cucumber de búsqueda y reserva, y GitHub Actions obtuvo el mismo resultado. Ese commit corre en Render con 70 operaciones documentadas en Swagger. La aplicación Kotlin 1.0 usa esos servicios y se distribuyó firmada por Firebase App Distribution, y la Landing Page se publicó en GitHub Pages. Al cliente Flutter todavía le falta adaptar las rutas, la respuesta del inicio de sesión y el envío del token.

Coppola et al. (2025) estudian la adopción de Kotlin y su relación con la mantenibilidad en Android, y Kuroishi et al. (2025) clasifican las formas de probar aplicaciones móviles y muestran lo distintos que pueden ser los dispositivos. Por eso la aplicación se organizó por capas y se probó en emulador y después en un celular real antes de distribuirla. Flutter necesitará sus propias pruebas de ejecución y validación.

Las entrevistas y la evaluación heurística anteriores encontraron problemas de navegación, mensajes, formatos locales, accesibilidad y separación de roles. Una observación solo se da por resuelta cuando se repite la tarea con la nueva versión. El registro de esas sesiones está en [4.3. Validation Interviews](Capitulo4.md#43-validation-interviews) y en el [Anexo H](Anexos.md#anexo-h-entrevistas-de-validación).

Las hipótesis de Lean UX siguen como metas: aumentar la conversión comercial en 20%, reducir los tiempos de entrega al menos en 25%, superar el 95% de cumplimiento de plazos y disminuir las consultas manuales en 80% en los primeros tres meses de uso. Para la hipótesis de inventario hay que medir tiempos de consulta y diferencias de stock. Las pruebas técnicas de AV2 todavía no permiten confirmar estas mejoras; para eso hay que usar el producto en una óptica durante un tiempo.

## Recomendaciones

1. Terminar la integración de Flutter: actualizar las rutas, el formato de sesión y el encabezado Bearer, y probar con cuentas separadas las funciones del paciente y del personal.
2. Correr las pruebas automatizadas en cada integración, guardar los resultados de Maven y Cucumber de cada commit y revisar que OpenAPI siga mostrando los códigos HTTP y permisos reales.
3. Entregar cada versión con su APK, su commit del backend y su entorno. Antes de distribuirla, probar la instalación, las migraciones de PostgreSQL y el flujo principal.
4. Repetir las tareas con entre tres y cinco participantes por segmento. Anotar el tiempo, la ayuda que necesitaron, los errores y sus comentarios, y compararlos con la evaluación heurística anterior.
5. Medir las hipótesis con una línea base y un periodo de observación: conversión, tiempos de entrega, cumplimiento de plazos, consultas manuales y diferencias de inventario. En el siguiente incremento, priorizar las funciones que guarden los datos necesarios para esas medidas.
6. Mantener al día el tablero, la matriz de responsabilidades y las evidencias de cada versión, y que cada dato del informe tenga el enlace al commit o al archivo de donde sale.

## Video App Validation

El video muestra qué tan fácil le resulta al paciente encontrar una óptica, reservar una cita y consultar su información. Con el personal de la óptica se revisa el acceso por rol y la consulta de los datos de la atención.

En cada sesión se mira cómo el participante entiende la navegación y los mensajes, y cómo resuelve las dificultades. Se anota el tiempo, la ayuda que necesitó y sus comentarios al final, junto con la versión de la aplicación y el dispositivo.

La Tabla CO1 registra los datos del video y el minuto en que empieza cada sesión de ambos segmentos.

<a id="tabla-co1"></a>

**Tabla CO1**

*Registro del Video App Validation de AV2*

| Dato | Registro |
|---|---|
| Versión de la aplicación / commit | |
| Dispositivo y sistema operativo | |
| Enlace de distribución | |
| Video en OneDrive / Microsoft Stream | |
| Duración total | |
| Inicio de las sesiones por segmento | |
| Captura representativa | |

## Video About the Product

El video presenta OptiFlow como una solución que reúne en un solo lugar la información y los procesos de la atención en ópticas. Muestra las funciones para el paciente —búsqueda de ópticas en un mapa, reserva de citas, pedidos, avisos y prueba virtual de monturas— y para el personal de la óptica —cotizaciones, ventas, inventario, taller y reportes—, además de la seguridad y los servicios en la nube. La captura muestra la búsqueda de ópticas cercanas y la opción de reservar una cita.

<a id="figura-209"></a>

**Figura 209**

*Búsqueda de ópticas cercanas y opción de reservar una cita en OptiFlow*

![Búsqueda de ópticas y reserva de cita mostradas en el video About the Product](assets/cap4/videos/OptiFlow_About_the_Product_captura.png)

*Fuente: Captura del video del equipo en 00:00:57.*

**Duración:** 00:02:03 minutos.

**Video:**

- [YouTube](https://www.youtube.com/watch?v=kp8q3Ojp2LI)
- [OneDrive](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202417405_upc_edu_pe/IQDkcvZ_f404Q7KTI0hx7GlBAcd_AJtuvGxw_VgAyL_fvk0?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D&e=pagewO)


## Video About the Team

El video empieza con una portada del equipo Logix y sigue con el testimonio de cada uno de los cinco integrantes.

<a id="figura-210"></a>

**Figura 210**

*Portada del video About the Team del equipo Logix*

![Portada del video About the Team](assets/cap4/videos/OptiFlow_About_the_Team_captura.png)

*Fuente: Captura del video del equipo en 00:00:01.*

**Duración:** 00:06:09 minutos.

**Video:**

- [YouTube](https://www.youtube.com/watch?v=_Kak03FkP5s)
- [OneDrive](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202417405_upc_edu_pe/IQB2eKOGMeJZQbxlasnPLsHIAQ7wSQyj9SjgZlo6ltTBmaA?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D&e=BPE4Eo)

| Sección visual | Inicio | Fin |
| :--- | :---: | :---: |
| Portada | 00:00:00 | 00:00:05 |
| Testimonio 1 Eslander Celis | 00:00:05 | 00:01:05 |
| Testimonio 2 Mariana Morocho | 00:01:05 | 00:02:15 |
| Testimonio 3 Cesar Augusto | 00:02:15 | 00:03:15 |
| Testimonio 4 Nicolas Fernando | 00:03:16 | 00:04:42 |
| Testimonio 5 Felix Orlando | 00:04:42 | 00:06:04 |
| Cierre | 00:06:04 | 00:06:09 |
| Fin del archivo | 00:06:09 | 00:06:09 |
