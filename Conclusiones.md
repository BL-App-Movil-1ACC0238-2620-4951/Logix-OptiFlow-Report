<div style="break-before: page; page-break-before: always;"></div>

# Conclusiones

## Conclusiones y recomendaciones

Hasta TB1, el desarrollo de **OptiFlow** articula la investigación de necesidades, la especificación de requisitos, el modelado del dominio, el diseño UX/UI y un primer incremento funcional. Las entrevistas orientan la propuesta hacia dos segmentos: el personal de la óptica, que necesita organizar la atención y el seguimiento, y el paciente, que requiere información accesible para reservar citas y conocer el estado del servicio.

El diseño estratégico organiza la solución en cinco Bounded Contexts: **Search & Booking, Clinical & Commercial, Production & Tracking, Store Management & Inventory y Notification & Loyalty**. EventStorming y los mapas de contexto permiten delimitar responsabilidades y proponer intercambios de información mediante comandos y eventos. Por ejemplo, `AppointmentBooked` comunica una reserva y `SaleWasClosed` vincula el cierre comercial con procesos posteriores. Estas relaciones describen el diseño integral; su implementación debe comprobarse en cada incremento.

El diseño táctico distribuye las responsabilidades entre **Domain, Interface, Application e Infrastructure Layers**. La separación de reglas de negocio, coordinación de casos de uso y adaptadores de persistencia facilita la evolución de los contextos. Las capas anticorrupción propuestas para servicios externos buscan proteger el modelo interno frente a formatos ajenos, sin implicar que todas esas integraciones se encuentren operativas en TB1.

Los wireframes, mock-ups y recorridos de navegación traducen las necesidades de los usuarios en una experiencia móvil organizada por rol. La consistencia visual, la legibilidad y la retroalimentación guían las decisiones de interfaz. El alcance de los prototipos es mayor que el del Sprint 1; por ello, las funciones representadas en el diseño se distinguen de las funcionalidades implementadas y verificadas.

El Sprint 1 concentra el compromiso funcional en **US05 y US06**, correspondientes a la búsqueda de ópticas y la reserva de citas. El informe reúne evidencias de la Landing Page, la documentación de los Web Services y la ejecución del flujo móvil, incluida la comprobación de la reserva en el backend. Los escenarios Gherkin y su ejecución automatizada complementan las capturas al expresar condiciones y resultados verificables. Los resultados de las pruebas se mantienen asociados a la versión y fecha de ejecución documentadas, incluyendo las incidencias detectadas en la revisión posterior.

La entrega establece una base para continuar la implementación y evaluar la solución con usuarios de ambos segmentos. Las siguientes iteraciones deberán contrastar las hipótesis de mejora con medidas de uso y operación, completar los componentes priorizados y comprobar las integraciones previstas. La publicación de los productos y la evidencia del flujo inicial constituyen avances concretos, mientras que las metas de reducción de tiempos, errores y consultas requieren validación posterior.

La revisión del modelado de datos distingue los límites del dominio de la distribución física: los cinco contextos comparten una sola base PostgreSQL con 27 tablas definidas por V1–V9. Las claves, restricciones y referencias lógicas se documentan según las migraciones y los mapeos JPA. La arquitectura integra además la Pasarela de Pagos y Firebase Cloud Messaging en el backend, y OpenStreetMap y ML Kit (escáner y probador virtual, en el propio dispositivo) en la aplicación móvil.

## Video App Validation

pendiente.


## Video About the Product

Este video presenta la propuesta de OptiFlow como una solución para centralizar información y procesos relacionados con la atención en ópticas. En la revisión visual se identifican funciones dirigidas al paciente —búsqueda de ópticas en un mapa, reserva de citas, pedidos, avisos y prueba virtual de monturas— y al personal de la óptica —cotizaciones, ventas, inventario, taller y reportes—, además de referencias a seguridad y servicios en la nube. La captura muestra la búsqueda de ópticas cercanas y la opción de reservar una cita.

<a id="figura-181"></a>

**Figura 181**

*Búsqueda de ópticas cercanas y opción de reservar una cita en OptiFlow*

![Búsqueda de ópticas y reserva de cita mostradas en el video About the Product](assets/cap4/videos/OptiFlow_About_the_Product_captura.png)

*Fuente: Captura del video del equipo en 00:00:57.*

**Duración:** 00:02:03 minutos.

**Video:**

- [YouTube](https://www.youtube.com/watch?v=kp8q3Ojp2LI)
- [OneDrive](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202417405_upc_edu_pe/IQDkcvZ_f404Q7KTI0hx7GlBAcd_AJtuvGxw_VgAyL_fvk0?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D&e=pagewO)


## Video About the Team

El video presenta una portada del equipo Logix y, a continuación, cinco bloques visuales por orden como testimonios de cada uno de los participantes del proyecto.

<a id="figura-182"></a>

**Figura 182**

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
