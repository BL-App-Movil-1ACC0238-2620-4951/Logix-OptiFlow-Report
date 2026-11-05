<div style="break-before: page; page-break-before: always;"></div>

# Anexos

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

En este anexo se resume la comunicación entre los Bounded Contexts de OptiFlow mediante eventos de dominio. Para cada evento se indica el comando que lo origina, los datos que transporta, el contexto que lo recibe y el comando que este ejecuta. Los diagramas de cada escenario se presentan en la sección [2.5.1.2](Capitulo2.md#2512-domain-message-flows-modeling).

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

Ningún contexto accede directamente a los datos de otro: cada uno reacciona a los eventos que recibe y actualiza solo su propio modelo.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo D: Context Mapping

En este anexo se presenta el context map final de OptiFlow, con las relaciones entre los Bounded Contexts, los sistemas externos (Pasarela de Pagos y Firebase Cloud Messaging) y los patrones de integración que aplica cada una (ver Figura D1). El proceso de elaboración, las alternativas evaluadas y el detalle de cada relación se presentan en la sección [2.5.2](Capitulo2.md#252-context-mapping).


<a id="figura-d1"></a>

**Figura D1**

*Context map final de OptiFlow*

![Context map final de OptiFlow](assets/cap2/context-mapping/context-map-final.png)

*Nota.* Elaboración propia.



<div style="break-before: page; page-break-before: always;"></div>

## Anexo E: Arquitectura de Software

Se presentan como evidencia complementaria los diagramas correspondientes a los diferentes niveles de la arquitectura de software de OptiFlow.

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

Las vistas conservadas documentan el diseño de componentes. Las bases documentales o adaptadores adicionales que aparezcan en esas imágenes no acreditan su implementación: la persistencia vigente es la única base PostgreSQL y los módulos con migraciones V1–V4. Inventory permanece como diseño propuesto.

#### Clinical & Commercial


El Clinical & Commercial Component Diagram se observa en la Figura E4.

<a id="figura-e4"></a>

**Figura E4**

*Clinical & Commercial Component Diagram*

![Clinical & Commercial Component Diagram](assets/cap2/C4/Clinical%20%26%20Commercial%20component.svg)


#### Notification & Loyalty


El Notification & Loyalty Component Diagram se muestra en la Figura E5.

<a id="figura-e5"></a>

**Figura E5**

*Notification & Loyalty Component Diagram*

![Notification & Loyalty Component Diagram](assets/cap2/C4/Notification%20%26%20Loyalty%20component.svg)


#### Production & Tracking


El Production & Tracking Component Diagram se presenta en la Figura E6.

<a id="figura-e6"></a>

**Figura E6**

*Production & Tracking Component Diagram*

![Production & Tracking Component Diagram](assets/cap2/C4/Production%20%26%20Tracking%20component.svg)


#### Search & Booking


El Search & Booking Component Diagram se observa en la Figura E7.

<a id="figura-e7"></a>

**Figura E7**

*Search & Booking Component Diagram*

![Search & Booking Component Diagram](assets/cap2/C4/Search%20%26%20Booking%20component.svg)


#### Store Management & Inventory


El Store Management & Inventory Component Diagram se muestra en la Figura E8.

<a id="figura-e8"></a>

**Figura E8**

*Store Management & Inventory Component Diagram*

![Store Management & Inventory Component Diagram](assets/cap2/C4/Store%20Management%20%26%20Inventory%20component.svg)



<div style="break-before: page; page-break-before: always;"></div>

## Anexo F: Diagramas de diseño táctico

La cardinalidad vigente de cotización–venta se especifica en [2.6.2.6.2](Capitulo2.md#26262-bounded-context-database-design-diagram): una cotización genera como máximo una venta, respaldada por la restricción de unicidad del backend.

Los diagramas de este anexo complementan el diseño táctico. Las secciones 2.6.1.6.2 a 2.6.5.6.2 describen el modelo físico actual: una base PostgreSQL compartida, con 27 tablas definidas en V1–V9. Los diagramas de base de datos de este anexo y del capítulo II se elaboraron a partir de esas migraciones.

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

La persistencia de Notification & Loyalty utiliza `notifications`, `loyalty_accounts` y `device_tokens` en PostgreSQL, según V4 y V7. La sección 2.6.5.6.2 detalla sus columnas y restricciones.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo G: Product Backlog

Como evidencia complementaria del levantamiento y priorización de requisitos, se presenta el Product Backlog desarrollado para OptiFlow.

Entre las funcionalidades priorizadas se encuentran el inicio de sesión, registro de pacientes, gestión de historias clínicas, consulta de recetas, búsqueda de ópticas, reserva de citas y consulta de inventario mediante escáner móvil.

<div style="break-before: page; page-break-before: always;"></div>

## Anexo H: Entrevistas de validación

Como evidencia de la validación de OptiFlow, se comparte el video con las entrevistas realizadas a usuarios de los segmentos objetivo, quienes interactuaron con la Landing Page y la aplicación móvil.

[Ver video de las entrevistas de validación en OneDrive](https://upcedupe-my.sharepoint.com/:v:/g/personal/u20241d317_upc_edu_pe/IQBEVy_3hrA9QZmTordSZKlaAYrAH0PSADXMEQfwdz9GFn8?e=eCtW3I&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0=)   



https://upcedupe-my.sharepoint.com/:v:/g/personal/u20241d317_upc_edu_pe/IQBEVy_3hrA9QZmTordSZKlaAYrAH0PSADXMEQfwdz9GFn8?e=eCtW3I&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0=
