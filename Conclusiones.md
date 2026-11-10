<div style="break-before: page; page-break-before: always;"></div>

# Conclusiones

La entrega AV2 de OptiFlow reúne el diseño de la solución y dos incrementos de implementación orientados a la búsqueda y reserva de atención óptica. El problema identificado sigue siendo la dispersión de información entre establecimientos, pacientes y canales de coordinación. El flujo del primer incremento y los servicios del Sprint 2 muestran que es posible reunir la consulta de ópticas, los horarios y la reserva en una misma solución. Su efecto sobre el tiempo de atención y la continuidad del seguimiento requiere observar el uso del producto con ambos segmentos.

La literatura respalda la relevancia de estudiar la asistencia a citas y el acceso digital a la agenda. Abbas et al. (2025) identifican características del paciente y de la cita asociadas con la inasistencia en una práctica de retina; Kammrath Betancor et al. (2025) examinan la programación en línea en dos entornos de atención oftalmológica. Para OptiFlow, estos trabajos orientan la selección de indicadores de reserva, asistencia y seguimiento. Sus resultados pertenecen a otros establecimientos y no se trasladan como porcentajes de mejora obtenidos por el proyecto.

El trabajo con EventStorming, Domain Message Flows y Bounded Context Canvases permitió separar las responsabilidades de Search & Booking, Clinical & Commercial, Production & Tracking, Store Management & Inventory y Notification & Loyalty. Estos límites organizan el dominio, aunque la implementación del backend comparte una base relacional PostgreSQL. El [Anexo F](Anexos.md#anexo-f-diagramas-de-diseño-táctico) distingue los diagramas de diseño de las tablas identificadas en la revisión de AV2. La revisión `41bcb44` incorpora las tablas de inventario y dispositivos, además de adaptadores de pagos y mensajería. Las pruebas de estos adaptadores usan respuestas controladas; su operación con proveedores externos y la experiencia de realidad aumentada requieren evidencias propias.

El Sprint 1 documenta la consulta de ópticas y la reserva desde el cliente Android/Kotlin. En el Sprint 2, el backend incorpora rutas `/api/v1`, tokens de sesión, autorización por roles y búsqueda por cercanía. También se publica la base del cliente Flutter y se actualiza la Landing Page. La publicación de esta última se comprobó mediante una ejecución exitosa de GitHub Pages y acceso público con HTTP 200. La integración de Flutter todavía requiere adaptar las rutas, la respuesta de autenticación y el envío del token.

La revisión del 10/11/2026 aprobó 131 pruebas automatizadas, incluidos cuatro escenarios Cucumber de búsqueda y reserva, sin fallos, errores ni omisiones. GitHub Actions también completó la ejecución del backend `41bcb44`. Se registraron 28 solicitudes HTTP locales sobre H2 y un contrato de 67 operaciones; la base PostgreSQL compartida está definida por nueve migraciones y 27 tablas. Los resultados del [Anexo I](Anexos.md#anexo-i-evidencias-técnicas-del-sprint-2) permiten seguir la corrección de los problemas detectados el 08/11/2026. Su alcance es técnico y local: la validación del APK y del despliegue activo debe corresponder a la versión entregada.

Las decisiones móviles también requieren una evaluación propia de cada cliente. Coppola et al. (2025) estudian la adopción de Kotlin y su relación con métricas de mantenibilidad en Android. Kuroishi et al. (2025) clasifican las infraestructuras de pruebas móviles y destacan la diversidad de dispositivos y entornos. En OptiFlow, estos aportes sustentan la atención a la organización del código, la comprobación en emulador y la prueba posterior del APK en un dispositivo físico. Las evidencias del cliente Kotlin se mantienen asociadas con su versión; Flutter necesita sus propios resultados de ejecución y validación.

Las entrevistas y la evaluación heurística anteriores identificaron problemas de navegación, retroalimentación, formatos locales, accesibilidad y separación de roles. Estos hallazgos aportan criterios concretos para revisar AV2. El cambio de tecnología o la incorporación de una pantalla no permite cerrar una observación sin repetir la tarea con la versión entregada. El registro de sesiones y su seguimiento se encuentran en [4.3. Validation Interviews](Capitulo4.md#43-validation-interviews) y en el [Anexo H](Anexos.md#anexo-h-entrevistas-de-validación).

Las hipótesis de Lean UX continúan como metas de evaluación: aumentar la conversión comercial en 20%, reducir los tiempos de entrega al menos en 25%, superar el 95% de cumplimiento de plazos y disminuir las consultas manuales en 80% durante los primeros tres meses de uso. La hipótesis de inventario requiere medir tiempos de consulta y diferencias de stock. Las comprobaciones técnicas de AV2 no aportan todavía una comparación operativa que permita confirmar esas mejoras. La conclusión de esta entrega es, por tanto, un avance verificable en servicios, publicación y definición de la experiencia, acompañado de trabajo pendiente de integración y medición del impacto en el negocio.

## Recomendaciones

1. Cerrar el contrato de integración: actualizar en Flutter las rutas, el formato de sesión y los encabezados Bearer; comprobar con cuentas separadas las funciones del paciente y del personal.
2. Mantener la regresión automatizada en cada integración. Conservar los resultados de Maven y Cucumber por commit y comprobar que OpenAPI siga reflejando los códigos HTTP y permisos implementados.
3. Asociar la entrega con una versión del APK, un commit del backend y un entorno identificados. Comprobar la instalación, las migraciones de PostgreSQL y el flujo principal antes de distribuir la versión a los evaluadores.
4. Repetir las tareas con entre tres y cinco participantes por segmento. Registrar tiempo, ayuda requerida, errores y comentarios, y contrastar los hallazgos con la evaluación heurística anterior.
5. Medir las hipótesis con una línea base y un periodo de observación: conversión, tiempos de entrega, cumplimiento de plazos, consultas manuales y diferencias de inventario. Priorizar en el siguiente incremento las funciones que permitan obtener esas medidas con datos persistidos.
6. Mantener actualizados el tablero, la matriz de responsabilidades y las evidencias por versión. Los anexos deben conservar el vínculo entre cada afirmación del informe, el artefacto y la revisión de código que la sustenta.

## Video App Validation

La validación de OptiFlow se centra en la facilidad con la que el paciente encuentra atención, reserva una cita y consulta su información. Para el personal de la óptica, el recorrido comprende el acceso por rol y la consulta de los datos disponibles para la atención. Las tareas se relacionan con la búsqueda, la reserva y el seguimiento que motivaron el desarrollo del producto.

Durante cada sesión se observa cómo el participante interpreta la navegación, reconoce los mensajes y resuelve una dificultad. El registro considera el tiempo empleado, la ayuda requerida y sus comentarios al terminar. La versión de la aplicación y el dispositivo se identifican para relacionar cada observación con el producto evaluado.

La grabación de AV2 se vincula con la distribución del APK y con la evaluación heurística del capítulo IV. La Tabla CO1 reúne sus datos de publicación y los momentos de inicio de las sesiones de ambos segmentos.

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

## Video About-the-Product

OptiFlow busca facilitar la relación entre el paciente y la óptica mediante un recorrido que reúne la búsqueda del establecimiento, la consulta de horarios y la reserva de una cita. La presentación del producto parte de las dificultades de coordinar la atención por distintos canales y explica cómo una experiencia móvil puede organizar ese proceso.

El recorrido se concentra en las funciones de la versión entregada: acceso, búsqueda, disponibilidad y confirmación de la reserva. La consulta del historial y el seguimiento de pedidos se presentan con el alcance que tengan en esa versión, diferenciando los servicios conectados de las vistas de demostración. La Landing Page complementa la presentación con la propuesta de valor y el acceso a la aplicación.

El testimonio de un participante de la validación aporta la perspectiva del usuario sobre la experiencia de uso. Su intervención se relaciona con una tarea realizada y conserva el sentido de su comentario. La Tabla CO2 registra la versión del video destinada al curso, su publicación pública y la referencia del testimonio.

<a id="tabla-co2"></a>

**Tabla CO2**

*Registro del Video About-the-Product de AV2*

| Dato | Registro |
|---|---|
| Video en OneDrive / Microsoft Stream | |
| Versión pública en YouTube | |
| Enlace de la Landing que lo incorpora | |
| Duración total | |
| Participante del testimonio y momento de inicio | |
| Captura representativa | |

## Video About-the-Team

El trabajo en OptiFlow comprende la investigación del problema, la definición de los segmentos, el modelado del dominio, el diseño de la experiencia y la implementación de los productos. La presentación del equipo sigue ese recorrido y relaciona las decisiones con los avances de cada Sprint.

La organización del Sprint 2 distribuye los servicios y la seguridad a César; la integración de Flutter a Nicolas; las pruebas a Felix; la Landing Page y la validación a Mariana; y la coordinación y documentación a Eslander. La colaboración entre estos aspectos permite revisar el contrato de servicios, resolver dificultades de integración y conservar las evidencias de la entrega.

Cada integrante explica su participación, una dificultad técnica y el aprendizaje que le permitió abordarla. Estos testimonios se relacionan con el Student Outcome 7: adquirir y aplicar nuevos conocimientos mediante estrategias de aprendizaje apropiadas. Las escenas de trabajo y las revisiones del producto acompañan la explicación del proceso. La Tabla CO3 registra la publicación del video y la Tabla CO4 organiza sus secciones.

<a id="tabla-co3"></a>

**Tabla CO3**

*Registro del Video About-the-Team de AV2*

| Dato | Registro |
|---|---|
| Video en OneDrive / Microsoft Stream | |
| Versión pública en YouTube | |
| Duración total | |
| Captura representativa | |

<a id="tabla-co4"></a>

**Tabla CO4**

*Secuencias del Video About-the-Team*

| Sección | Contenido | Inicio (hh:mm:ss) |
|---|---|---|
| Presentación | Integrantes, producto y alcance de AV2. | |
| Investigación y diseño | Problema de atención óptica, segmentos, decisiones del dominio y experiencia móvil. | |
| Implementación del incremento | Backend versionado, seguridad, Flutter y publicación de la Landing Page. | |
| Organización del trabajo | Distribución de tareas, coordinación, revisión de cambios y evidencias del Sprint. | |
| Testimonio de César | Decisiones de servicios y seguridad; aprendizaje asociado con contratos y permisos. | |
| Testimonio de Nicolas | Integración del cliente Flutter; aprendizaje sobre navegación, estado y comunicación con servicios. | |
| Testimonio de Felix | Pruebas unitarias, integración y aceptación; aprendizaje sobre reproducción y análisis de resultados. | |
| Testimonio de Mariana | Landing Page y validación; aprendizaje sobre accesibilidad y observación de usuarios. | |
| Testimonio de Eslander | Coordinación y documentación; aprendizaje sobre trazabilidad entre tareas, versiones y evidencias. | |
| Cierre | Principales aprendizajes del equipo y siguientes pasos del producto. | |
