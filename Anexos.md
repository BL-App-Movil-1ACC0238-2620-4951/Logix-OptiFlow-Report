<div style="break-before: page; page-break-before: always;"></div>

# Anexos

Los anexos reúnen los artefactos de diseño y las evidencias que complementan los capítulos del informe. Cada registro conserva su alcance: modelado del dominio, arquitectura, implementación o validación.

**Contenido:** [A. EventStorming](#anexo-a-eventstorming-del-dominio-de-optiflow), [B. Bounded Contexts](#anexo-b-bounded-contexts-identificados), [C. Domain Message Flows](#anexo-c-domain-message-flows), [D. Context Mapping](#anexo-d-context-mapping), [E. Arquitectura](#anexo-e-arquitectura-de-software), [F. Diseño táctico y persistencia](#anexo-f-diagramas-de-diseño-táctico), [G. Product Backlog](#anexo-g-product-backlog), [H. Entrevistas](#anexo-h-entrevistas-de-validación), [I. Evidencias del Sprint 2](#anexo-i-evidencias-técnicas-del-sprint-2) y [J. Sustento académico](#anexo-j-relación-entre-investigación-y-decisiones-del-proyecto).

<div style="break-before: page; page-break-before: always;"></div>

## Anexo A: EventStorming del dominio de OptiFlow

En este anexo se presenta la evidencia correspondiente al modelado del dominio mediante **EventStorming**, utilizado para identificar los principales eventos, comandos, actores y agrupaciones funcionales de la solución OptiFlow (ver Figura A1).


<a id="figura-a1"></a>

**Figura A1**

*EventStorming del dominio de OptiFlow*

![EventStorming del dominio de OptiFlow](assets/cap2/DDD/Event-Storming%20pasos%201-3.jpg)



<div style="break-before: page; page-break-before: always;"></div>

## Anexo B: Bounded Contexts identificados

Los cinco canvases de [2.5.1.3](Capitulo2.md#2513-bounded-context-canvases) especifican responsabilidades, reglas, contratos, supuestos y criterios de verificación para los contextos resumidos en este anexo.

La siguiente evidencia corresponde a la identificación de los cinco Bounded Contexts que estructuran el dominio de OptiFlow:

- **Search & Booking Context**
- **Clinical & Commercial Context**
- **Production & Tracking Context**
- **Notification & Loyalty Context**
- **Store Management & Inventory Context**

Estos contextos fueron delimitados a partir de las agrupaciones funcionales identificadas durante el análisis del dominio.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo C: Domain Message Flows

En este anexo se resume el diseño de comunicación entre los Bounded Contexts de OptiFlow mediante eventos de dominio. Para cada evento se indica el comando que lo origina, los datos que transporta, el contexto que lo recibe y el comando que este ejecuta. Los diagramas de cada escenario se presentan en la sección [2.5.1.2](Capitulo2.md#2512-domain-message-flows-modeling).

La relación entre eventos, contextos receptores y comandos se detalla en la Tabla C1.

<a id="tabla-c1"></a>

**Tabla C1**

*Relación entre eventos, contextos receptores y comandos*

| Contexto emisor | Comando de origen | Evento | Datos del evento | Contexto receptor | Comando ejecutado |
|---|---|---|---|---|---|
| Search & Booking | `BookAppointment` | `AppointmentBooked` | appointmentId, patientId, opticalStoreId, timeSlotId | Clinical & Commercial | `ExaminePatient` |
| Search & Booking | `BookAppointment` | `AppointmentBooked` | appointmentId, patientId, opticalStoreId, timeSlotId | Notification & Loyalty | `ScheduleAppointmentReminder` |
| Clinical & Commercial | `CloseSale` | `SaleWasClosed` | saleId, quotationId, clinicalRecordId, patientId, totalAmount, items (productSku, quantity) | Production & Tracking | `GenerateWorkOrder` |
| Clinical & Commercial | `CloseSale` | `SaleWasClosed` | saleId, quotationId, clinicalRecordId, patientId, totalAmount, items (productSku, quantity) | Store Management & Inventory | `UpdateInventory` |
| Production & Tracking | `UpdateWorkOrderStatus` | `WorkOrderStatusUpdated` | workOrderId, patientId, previousStatus, status | Notification & Loyalty | `NotifyLensOrderProgress` |
| Production & Tracking | `NotifyDeliveryDelay` | `DeliveryDelayNotified` | workOrderId, patientId, delay | Notification & Loyalty | `SendDeliveryDelayNotification` |
| Production & Tracking | `MarkOrderAsDelivered` | `OrderWasMarkedAsDelivered` | workOrderId, saleId, patientId | Notification & Loyalty | `SendSatisfactionSurvey` |

El diseño asigna a cada contexto la propiedad de su modelo y define contratos para comunicar los cambios. La presencia de un flujo en la Tabla C1 expresa esa decisión de diseño; su implementación se contrasta con la revisión de código y las evidencias del Anexo I.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo D: Context Mapping

En este anexo se presenta el context map de diseño de OptiFlow, con las relaciones entre los Bounded Contexts, los sistemas externos previstos (Pasarela de Pagos y Firebase Cloud Messaging) y sus patrones de integración (ver Figura D1). El proceso de elaboración, las alternativas evaluadas y el detalle de cada relación se presentan en la sección [2.5.2](Capitulo2.md#252-context-mapping).


<a id="figura-d1"></a>

**Figura D1**

*Context map final de OptiFlow*

![Context map final de OptiFlow](assets/cap2/context-mapping/context-map-final.png)

*Nota.* Elaboración propia.



<div style="break-before: page; page-break-before: always;"></div>

## Anexo E: Arquitectura de Software

Se presentan como evidencia complementaria los diagramas de arquitectura de OptiFlow. Estas vistas incluyen el alcance previsto de la solución. El corte de implementación de AV2 se identifica por repositorio y commit en el Anexo I.

### E.1. Context Level Diagram


El Context Level Diagram se presenta en la Figura E1.

<a id="figura-e1"></a>

**Figura E1**

*Context Level Diagram*

![Context Level Diagram](assets/cap2/C4/context.svg)


### E.2. Container Level Diagram

Se reproduce el Container Level Diagram de la sección 2.5.3.2, con un único contenedor backend, la base de datos local de la aplicación móvil, la persistencia relacional y los sistemas externos (ver Figura E2).


<a id="figura-e2"></a>

**Figura E2**

*Container Level Diagram de OptiFlow elaborado en Structurizr*

![Diagrama de contenedores de OptiFlow](assets/cap2/C4/containers-structurizr.svg)


La leyenda de los elementos del diagrama se presenta a continuación (ver Figura E3).


<a id="figura-e3"></a>

**Figura E3**

*Leyenda del Container Level Diagram*

![Leyenda del diagrama de contenedores](assets/cap2/C4/containers-structurizr-key.svg)


### E.3. Component Diagrams

Los Component Diagrams representan los componentes propuestos de cada módulo, incluidos los adaptadores hacia la Pasarela de Pagos (`PaymentGatewayAdapter`) y Firebase Cloud Messaging (`FirebaseMessagingAdapter`). El backend utiliza una base PostgreSQL compartida. Los adaptadores externos y el módulo de inventario se mantienen identificados como parte del diseño; su aparición en el diagrama no se toma como evidencia de integración en AV2.

#### Clinical & Commercial


El Clinical & Commercial Component Diagram se observa en la Figura E4.

<a id="figura-e4"></a>

**Figura E4**

*Clinical & Commercial Component Diagram*

![Clinical & Commercial Component Diagram](assets/cap2/C4/components/clinical-commercial.svg)


#### Notification & Loyalty


El Notification & Loyalty Component Diagram se muestra en la Figura E5.

<a id="figura-e5"></a>

**Figura E5**

*Notification & Loyalty Component Diagram*

![Notification & Loyalty Component Diagram](assets/cap2/C4/components/notification-loyalty.svg)


#### Production & Tracking


El Production & Tracking Component Diagram se presenta en la Figura E6.

<a id="figura-e6"></a>

**Figura E6**

*Production & Tracking Component Diagram*

![Production & Tracking Component Diagram](assets/cap2/C4/components/production-tracking.svg)


#### Search & Booking


El Search & Booking Component Diagram se observa en la Figura E7.

<a id="figura-e7"></a>

**Figura E7**

*Search & Booking Component Diagram*

![Search & Booking Component Diagram](assets/cap2/C4/components/search-booking.svg)


#### Store Management & Inventory


El Store Management & Inventory Component Diagram se muestra en la Figura E8.

<a id="figura-e8"></a>

**Figura E8**

*Store Management & Inventory Component Diagram*

![Store Management & Inventory Component Diagram](assets/cap2/C4/components/store-inventory.svg)



<div style="break-before: page; page-break-before: always;"></div>

## Anexo F: Diagramas de diseño táctico

La cardinalidad vigente de cotización–venta se especifica en [2.6.2.6.2](Capitulo2.md#26262-bounded-context-database-design-diagram): una cotización genera como máximo una venta, respaldada por la restricción de unicidad del backend.

Los diagramas de este anexo complementan el diseño táctico del capítulo II. La revisión del backend `41bcb44`, consultada el 10/11/2026 para AV2, contiene las migraciones V1 a V9, que definen 27 tablas en una base PostgreSQL compartida. V5 añade coordenadas, V6 incorpora inventario, V7 registra dispositivos, V8 amplía pacientes y personal, y V9 incorpora datos de checkout y pago. El modelo ampliado de diseño se distingue de este corte de implementación mediante la Tabla F1.


<a id="tabla-f1"></a>

**Tabla F1**

*Persistencia identificada en el backend 41bcb44*

| Bounded Context | Migraciones | Tablas identificadas | Cantidad |
|---|---|---|:---:|
| Search & Booking | V1, V5 y V8 | `patients`, `optical_stores`, `time_slots`, `appointments`, `favorite_stores`, `store_ratings`, `staff_members`. | 7 |
| Clinical & Commercial | V2 y V9 | `clinical_records`, `medical_histories`, `optical_prescriptions`, `quotations`, `quotation_items`, `sales`, `electronic_receipts`. | 7 |
| Production & Tracking | V3 | `technicians`, `laboratories`, `work_orders`, `work_order_lenses`, `work_order_status_history`. | 5 |
| Notification & Loyalty | V4 y V7 | `loyalty_accounts`, `notifications`, `device_tokens`. | 3 |
| Store Management & Inventory | V6 | `frame_models`, `inventories`, `suppliers`, `inventory_stocks`, `stock_movements`. | 5 |
| **Total** | | | **27** |

Fuente: [migraciones del commit 41bcb44](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/tree/41bcb448a06abe9aeaf32be9cef46ce2965e30e0/src/main/resources/db/migration). La correspondencia de claves y restricciones se revisa sobre esos archivos. La relación `sales.quotation_id UNIQUE` respalda que una cotización genere como máximo una venta.

### F.1. Production & Tracking

#### Domain Layer Class Diagram


El Production & Tracking Domain Layer Class Diagram se presenta en la Figura F1.

<a id="figura-f1"></a>

**Figura F1**

*Production & Tracking Domain Layer Class Diagram*

![Production & Tracking Domain Layer Class Diagram](assets/cap2/class-diagram/domain/production-tracking.png)


#### Database Design Diagram


La Figura F2 reproduce el modelo físico relacional de la migración V3: `work_orders`, `work_order_lenses`, `work_order_status_history`, `technicians` y `laboratories`. La sección 2.6.3.6.2 especifica las claves físicas y las referencias lógicas.

<a id="figura-f2"></a>

**Figura F2**

*Production & Tracking Database Design Diagram*

![Production & Tracking Database Design Diagram](assets/cap2/db/production-tracking-v3.png)



### F.2. Notification & Loyalty

En la revisión `41bcb44`, Notification & Loyalty persiste en `notifications`, `loyalty_accounts` y `device_tokens`, definidas por V4 y V7. El backend incorpora registro de dispositivos, respuesta a encuestas y un adaptador de Firebase con pruebas automatizadas. El diagrama de V4 conserva su alcance original de dos tablas; V7 amplía ese modelo con los dispositivos. La entrega de mensajes a un dispositivo real se comprueba con las credenciales y el entorno de distribución correspondientes.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo G: Product Backlog

El [Product Backlog del capítulo II](Capitulo2.md#243-product-backlog) reúne las historias, sus títulos y estimaciones. Para la ejecución se utilizan el [Sprint Backlog 1](Capitulo4.md#4213-sprint-backlog-1) y el [Sprint Backlog 2](Capitulo4.md#4223-sprint-backlog-2), que descomponen las historias en tareas y registran responsables y estados.

Entre las funcionalidades priorizadas se encuentran el inicio de sesión, registro de pacientes, gestión de historias clínicas, consulta de recetas, búsqueda de ópticas, reserva de citas y consulta de inventario mediante escáner móvil.

<div style="break-before: page; page-break-before: always;"></div>

## Anexo H: Entrevistas de validación

Se conserva el video de las entrevistas anteriores, en el que participaron usuarios de ambos segmentos y se recorrieron la Landing Page y la aplicación móvil. La Figura H1 muestra un cuadro de esa grabación. El diseño de tareas, el registro por participante y el seguimiento de AV2 se encuentran en [4.3. Validation Interviews](Capitulo4.md#43-validation-interviews).

[Ver video de las entrevistas de validación en OneDrive](https://upcedupe-my.sharepoint.com/:v:/g/personal/u20241d317_upc_edu_pe/IQBEVy_3hrA9QZmTordSZKlaAYrAH0PSADXMEQfwdz9GFn8?e=eCtW3I&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0=)

<a id="figura-h1"></a>

**Figura H1**

*Cuadro del video histórico de entrevistas de validación*

![Cuadro del video de entrevistas de validación](assets/cap3/entrevistas/captura%20entrevistas.png)

Las sesiones de AV2 se asocian con la versión efectivamente probada. La grabación anterior conserva su fecha y alcance, sin trasladar automáticamente sus resultados al cliente Flutter.

<div style="break-before: page; page-break-before: always;"></div>

## Anexo I: Evidencias técnicas del Sprint 2

La Tabla I1 identifica las revisiones utilizadas en el capítulo IV. La Tabla I2 reúne sus artefactos de construcción, contrato, ejecución y publicación.

<a id="tabla-i1"></a>

**Tabla I1**

*Revisiones de código del Sprint 2*

| Producto | Repositorio y rama | Commit revisado | Alcance |
|---|---|---|---|
| Backend | [Logix-OptiFlow-Back-End](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End), `develop`. | [41bcb44](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/41bcb448a06abe9aeaf32be9cef46ce2965e30e0) | Servicios, seguridad, inventario, pagos, notificaciones y reportes; revisión local con H2. |
| Flutter | [Logix-OptiFlow-Flutter](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Flutter), `main`. | [0344413](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Flutter/commit/03444133bb4889773dda3b250c708e315bb545b6) | Código de la versión `1.0.0+1`; revisión del contrato y de los datos de demostración. |
| Landing Page | [Logix-OptiFlow-landing-page](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-landing-page), `main`. | [ef1c032](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-landing-page/commit/ef1c03205352fb20a22bbd7fcd54a41f90ef6dca) | Código y publicación en GitHub Pages comprobada el 08/11/2026. |

<a id="tabla-i2"></a>

**Tabla I2**

*Artefactos y alcance de las evidencias de AV2*

| Evidencia | Archivo o enlace | Relación con el informe |
|---|---|---|
| Pruebas del backend | [Resumen de Maven](assets/cap4/sprint2/revision-20261110/test-summary.json) y [captura](assets/cap4/sprint2/revision-20261110/tests-current.png) | 131 pruebas aprobadas en 27 suites el 10/11/2026; cuatro escenarios Cucumber incluidos. Sección 4.2.2.5. |
| Integración continua | [Workflow 42771709596](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/actions/runs/42771709596) y [captura](assets/cap4/sprint2/revision-20261110/backend-ci.png) | `mvn -B test` completado para `41bcb44` con Java 21. |
| Aceptación del Sprint 2 | [Reporte Cucumber](assets/cap4/sprint2/revision-20261110/cucumber.html) y [JSON](assets/cap4/sprint2/revision-20261110/cucumber.json) | Cuatro escenarios de búsqueda y reserva aprobados en la revisión actual. |
| Solicitudes HTTP locales | [Resultados JSON](assets/cap4/sprint2/revision-20261110/service-results.json) | 28 solicitudes registradas; 25 con código esperado comprobado y tres respuestas de rutas antiguas. Tokens omitidos. Sección 4.2.2.5. |
| Contrato versionado | [OpenAPI local](assets/cap4/sprint2/revision-20261110/openapi-local.json) | 67 operaciones sobre 58 rutas del backend `41bcb44`. Sección 4.2.2.7. |
| Interacción con Swagger | [Vista general](assets/cap4/sprint2/revision-20261110/swagger-current.png), [cercanía](assets/cap4/sprint2/revision-20261110/nearby-current.png), [reserva](assets/cap4/sprint2/revision-20261110/booking-current.png) y [permisos](assets/cap4/sprint2/revision-20261110/forbidden-current.png) | Capturas de ejecución local del 10/11/2026. Sección 4.2.2.6. |
| Colaboración | [Backend](assets/cap4/sprint2/revision-20261110/backend-contributors.png), [Flutter](assets/cap4/sprint2/revision-20261110/flutter-contributors.png) y [Landing](assets/cap4/sprint2/revision-20261110/landing-contributors.png) | Gráficos públicos de GitHub Insights. Sección 4.2.2.9. |
| Revisión anterior del Sprint 2 | [Registro Maven del 08/11/2026](assets/cap4/sprint2/build-results.txt) y [HTTP anterior](assets/cap4/sprint2/service-results.json) | Antecedentes del backend `4a1364e`, preservados con sus resultados originales. |
| Publicación de Pages | [Workflow 42338220243](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-landing-page/actions/runs/42338220243) y [captura](assets/cap4/sprint2/workflow-pages.png) | Ejecución exitosa para el commit `ef1c032`, documentada en 4.2.2.8. |
| Landing publicada | [Sitio público](https://bl-app-movil-1acc0238-2620-4951.github.io/Logix-OptiFlow-landing-page/) y [captura](assets/cap4/sprint2/landing-publica.png) | Acceso público con HTTP 200 comprobado el 08/11/2026. |
| Aceptación del primer incremento | [Reporte Cucumber](assets/cap4/sprint1/testing/cucumber.html) y [JSON](assets/cap4/sprint1/testing/cucumber.json) | Evidencia histórica del Sprint 1, con su versión y resultado en 4.2.1.5. |

Las revisiones de código y los resultados se conservan por separado de la publicación del APK y de la validación con participantes. Los videos de App Validation, About-the-Product y About-the-Team se registran en [Conclusiones](Conclusiones.md#video-app-validation).

<div style="break-before: page; page-break-before: always;"></div>

## Anexo J: Relación entre investigación y decisiones del proyecto

La Tabla J1 relaciona cuatro publicaciones de 2025 con el dominio del problema y las técnicas de desarrollo móvil. Las referencias completas se encuentran en [Bibliografía](Bibliografia.md#bibliografía).

<a id="tabla-j1"></a>

**Tabla J1**

*Publicaciones recientes y aplicación en OptiFlow*

| Categoría | Publicación | Revista y año | Relación con el proyecto |
|---|---|---|---|
| Dominio de negocio | [Abbas et al.](https://doi.org/10.1016/j.jcjo.2025.04.012) | *Canadian Journal of Ophthalmology*, 2025. | Factores asociados con la inasistencia; sustenta la selección de variables para evaluar reserva y seguimiento. |
| Dominio de negocio | [Kammrath Betancor et al.](https://doi.org/10.3389/fdgth.2025.1567397) | *Frontiers in Digital Health*, 2025. | Programación en línea en entornos oftalmológicos; orienta el análisis de asistencia y eficiencia sin trasladar sus resultados al proyecto. |
| Desarrollo móvil | [Coppola et al.](https://doi.org/10.1016/j.jss.2025.112346) | *Journal of Systems and Software*, 2025. | Adopción de Kotlin y mantenibilidad, vinculadas con la organización del cliente Android del Sprint 1. |
| Desarrollo móvil | [Kuroishi et al.](https://doi.org/10.1016/j.infsof.2024.107573) | *Information and Software Technology*, 2025. | Infraestructuras de pruebas móviles y diversidad de entornos; sustenta la comprobación en emulador y dispositivo físico. |

Los estudios aportan evidencia externa para las decisiones del proyecto. La medición de sus resultados en OptiFlow se realiza mediante los indicadores y sesiones propios, descritos en los capítulos I y IV.
