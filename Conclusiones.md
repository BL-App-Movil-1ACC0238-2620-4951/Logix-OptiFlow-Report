<div style="break-before: page; page-break-before: always;"></div>

# Conclusiones

La entrega AV2 de OptiFlow reúne el diseño de la solución y dos incrementos de implementación orientados a la búsqueda y reserva de atención óptica. El problema identificado sigue siendo la dispersión de información entre establecimientos, pacientes y canales de coordinación. El flujo del primer incremento y los servicios del Sprint 2 muestran que es posible reunir la consulta de ópticas, los horarios y la reserva en una misma solución. Su efecto sobre el tiempo de atención y la continuidad del seguimiento requiere observar el uso del producto con ambos segmentos.

La literatura respalda la relevancia de estudiar la asistencia a citas y el acceso digital a la agenda. Abbas et al. (2025) identifican características del paciente y de la cita asociadas con la inasistencia en una práctica de retina; Kammrath Betancor et al. (2025) examinan la programación en línea en dos entornos de atención oftalmológica. Para OptiFlow, estos trabajos orientan la selección de indicadores de reserva, asistencia y seguimiento. Sus resultados pertenecen a otros establecimientos y no se trasladan como porcentajes de mejora obtenidos por el proyecto.

El trabajo con EventStorming, Domain Message Flows y Bounded Context Canvases permitió separar las responsabilidades de Search & Booking, Clinical & Commercial, Production & Tracking, Store Management & Inventory y Notification & Loyalty. Estos límites organizan el dominio, aunque la implementación del backend comparte una base relacional PostgreSQL. El [Anexo F](Anexos.md#anexo-f-diagramas-de-diseño-táctico) distingue los diagramas de diseño de las tablas identificadas en la revisión de AV2. Las integraciones de pagos, inventario, mensajería push y realidad aumentada conservan el alcance de diseño que les corresponde.

El Sprint 1 documenta la consulta de ópticas y la reserva desde el cliente Android/Kotlin. En el Sprint 2, el backend incorpora rutas `/api/v1`, tokens de sesión, autorización por roles y búsqueda por cercanía. También se publica la base del cliente Flutter y se actualiza la Landing Page. La publicación de esta última se comprobó mediante una ejecución exitosa de GitHub Pages y acceso público con HTTP 200. La integración de Flutter todavía requiere adaptar las rutas, la respuesta de autenticación y el envío del token.

La revisión técnica registró 17 solicitudes HTTP locales, entre ellas consulta pública, emisión de token, rechazo de acceso no autorizado, reserva y conflicto de horario. El resultado de la suite automatizada fue distinto: Maven se detuvo al compilar dos solicitudes de prueba. El JAR se generó en una ejecución separada con las pruebas omitidas. Estos resultados, conservados en el [Anexo I](Anexos.md#anexo-i-evidencias-técnicas-del-sprint-2), permiten identificar el siguiente trabajo de integración sin declarar aprobada una suite que no llegó a ejecutarse.

Las decisiones móviles también requieren una evaluación propia de cada cliente. Coppola et al. (2025) estudian la adopción de Kotlin y su relación con métricas de mantenibilidad en Android. Kuroishi et al. (2025) clasifican las infraestructuras de pruebas móviles y destacan la diversidad de dispositivos y entornos. En OptiFlow, estos aportes sustentan la atención a la organización del código, la comprobación en emulador y la prueba posterior del APK en un dispositivo físico. Las evidencias del cliente Kotlin se mantienen asociadas con su versión; Flutter necesita sus propios resultados de ejecución y validación.

Las entrevistas y la evaluación heurística anteriores identificaron problemas de navegación, retroalimentación, formatos locales, accesibilidad y separación de roles. Estos hallazgos aportan criterios concretos para revisar AV2. El cambio de tecnología o la incorporación de una pantalla no permite cerrar una observación sin repetir la tarea con la versión entregada. El registro de sesiones y su seguimiento se encuentran en [4.3. Validation Interviews](Capitulo4.md#43-validation-interviews) y en el [Anexo H](Anexos.md#anexo-h-entrevistas-de-validación).

Las hipótesis de Lean UX continúan como metas de evaluación: aumentar la conversión comercial en 20%, reducir los tiempos de entrega al menos en 25%, superar el 95% de cumplimiento de plazos y disminuir las consultas manuales en 80% durante los primeros tres meses de uso. La hipótesis de inventario requiere medir tiempos de consulta y diferencias de stock. Las comprobaciones técnicas de AV2 no aportan todavía una comparación operativa que permita confirmar esas mejoras. La conclusión de esta entrega es, por tanto, un avance verificable en servicios, publicación y definición de la experiencia, acompañado de trabajo pendiente de integración y medición del impacto en el negocio.

## Recomendaciones

1. Cerrar el contrato de integración: actualizar en Flutter las rutas, el formato de sesión y los encabezados Bearer; comprobar con cuentas separadas las funciones del paciente y del personal.
2. Corregir la compilación de las pruebas, adaptar los Steps BDD a la autenticación y ejecutar la regresión completa. La documentación OpenAPI debe reflejar los códigos HTTP y permisos observados.
3. Asociar la entrega con una versión del APK, un commit del backend y un entorno identificados. Comprobar la instalación, las migraciones de PostgreSQL y el flujo principal antes de distribuir la versión a los evaluadores.
4. Repetir las tareas con entre tres y cinco participantes por segmento. Registrar tiempo, ayuda requerida, errores y comentarios, y contrastar los hallazgos con la evaluación heurística anterior.
5. Medir las hipótesis con una línea base y un periodo de observación: conversión, tiempos de entrega, cumplimiento de plazos, consultas manuales y diferencias de inventario. Priorizar en el siguiente incremento las funciones que permitan obtener esas medidas con datos persistidos.
6. Mantener actualizados el tablero, la matriz de responsabilidades y las evidencias por versión. Los anexos deben conservar el vínculo entre cada afirmación del informe, el artefacto y la revisión de código que la sustenta.

## Video App Validation

El recorrido de validación comprende las tareas de búsqueda y reserva del paciente y las operaciones disponibles para el personal de la óptica. La evaluación se vincula con la versión distribuida mediante Firebase App Distribution, el dispositivo utilizado y los hallazgos de usabilidad. La Tabla CO1 reúne los datos de la grabación de AV2.

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

La presentación del producto se dirige a pacientes y ópticas: explica la propuesta de valor, muestra las funciones de la versión entregada y recoge el testimonio de un participante de la validación. La Tabla CO2 relaciona la grabación del curso con la versión pública destinada a la Landing Page.

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

La presentación del equipo comprende el proceso de trabajo, las decisiones de diseño e implementación y el aprendizaje de cada integrante. El contenido incluye escenas de trabajo y testimonios individuales sobre las actividades realizadas y el Student Outcome 7. La Tabla CO3 registra la publicación y la Tabla CO4, los tiempos de sus secciones.

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
| Presentación | Integrantes, producto y alcance de la entrega. | |
| Investigación y diseño | Problema, segmentos, decisiones del dominio y experiencia de usuario. | |
| Implementación y pruebas | Avances de los productos, integración y resultados técnicos. | |
| Trabajo colaborativo | Sesiones, revisión de cambios y organización del Sprint. | |
| Aprendizajes individuales | Testimonio de cada integrante y relación con el Student Outcome 7. | |
