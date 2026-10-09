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

Los cinco canvases completos de [2.5.1.3](Capitulo2.md#2513-bounded-context-canvases) especifican responsabilidades, reglas, contratos, supuestos y criterios de verificación para los contextos resumidos en este anexo.

La siguiente evidencia corresponde a la identificación de los cinco Bounded Contexts que estructuran el dominio de OptiFlow:

- **Search & Booking Context**
- **Clinical & Commercial Context**
- **Production & Tracking Context**
- **Notification & Loyalty Context**
- **Store Management & Inventory Context**

Estos contextos fueron delimitados a partir de las agrupaciones funcionales identificadas durante el análisis del dominio.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo C: Domain Message Flows

Los diagramas por escenario y sus datos significativos se encuentran en [2.5.1.2](Capitulo2.md#2512-domain-message-flows-modeling). En la integración con inventario, consultar por escaneo no modifica el stock: el descuento de existencias corresponde a una actualización posterior al cierre de venta. La tabla siguiente conserva el resumen inicial y debe leerse con esa precisión.

En este anexo se presenta la evidencia del flujo de comunicación entre los Bounded Contexts mediante comandos y eventos de dominio.

Los principales flujos identificados incluyen:


La relación entre eventos, contextos receptores y comandos se detalla en la Tabla C1.

<a id="tabla-c1"></a>

**Tabla C1**

*Relación entre eventos, contextos receptores y comandos*


| Contexto emisor | Comando | Evento | Contexto receptor | Comando disparado |
|---|---|---|---|---|
| Search & Booking | `BookAppointment` | `AppointmentBooked` | Clinical & Commercial | `ExaminePatient` |
| Search & Booking | `BookAppointment` | `AppointmentBooked` | Notification & Loyalty | `SendAppointmentReminder` |
| Clinical & Commercial | `CloseSale` | `SaleWasClosed` | Production & Tracking | `GenerateWorkOrder` |
| Clinical & Commercial | `CloseSale` | `SaleWasClosed` | Store Management & Inventory | `ScanQRBarcodeToCheckStock` |
| Production & Tracking | `UpdateWorkOrderStatus` | `WorkOrderStatusUpdated` | Notification & Loyalty | `NotifyLensOrderProgress` |
| Production & Tracking | `DeliverLensesToPatient` | `OrderWasMarkedAsDelivered` | Notification & Loyalty | `SendSatisfactionSurvey` |

Estos flujos permiten evidenciar la comunicación entre los contextos sin necesidad de compartir directamente sus modelos de datos.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo D: Context Mapping

En este anexo se presenta el **Context Map Final** de OptiFlow, donde se representan las relaciones entre los diferentes Bounded Contexts y sus mecanismos de integración (ver Figura D1).


<a id="figura-d1"></a>

**Figura D1**

*Context Map de OptiFlow*

<div align="center">
<img src="assets/cap2/ContextMappingFinal.png">
</div>



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

Se reproduce el Container Level Diagram de la sección 2.5.3.2, con un único contenedor backend y persistencia relacional (ver Figura E2).


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

En este anexo se presentan evidencias complementarias de los diagramas desarrollados para representar la estructura interna de los Bounded Contexts a nivel táctico.

### F.1. Production & Tracking

#### Domain Layer Class Diagram


El Production & Tracking Domain Layer Class Diagram se presenta en la Figura F1.

<a id="figura-f1"></a>

**Figura F1**

*Production & Tracking Domain Layer Class Diagram*

![Production & Tracking Domain Layer Class Diagram](assets/cap2/ProductionTrackingDomainLayerClassDiagram.png)


#### Database Design Diagram


El Production & Tracking Database Design Diagram se observa en la Figura F2.

<a id="figura-f2"></a>

**Figura F2**

*Production & Tracking Database Design Diagram*

![Production & Tracking Database Design Diagram](assets/cap2/ProductionTrackingDatabaseDesignDiagram.png)



### F.2. Notification & Loyalty

El diseño táctico de este contexto contempla elementos como `NotificationPreferences`, `PatientBirthday`, `BirthdayDiscount`, `SatisfactionSurvey` y `ReactivationCampaign`, además de consumidores de eventos y adaptadores para servicios externos de mensajería.


<div style="break-before: page; page-break-before: always;"></div>

## Anexo G: Product Backlog

Como evidencia complementaria del levantamiento y priorización de requisitos, se presenta el Product Backlog desarrollado para OptiFlow.

Entre las funcionalidades priorizadas se encuentran el inicio de sesión, registro de pacientes, gestión de historias clínicas, consulta de recetas, búsqueda de ópticas, reserva de citas y consulta de inventario mediante escáner móvil.
