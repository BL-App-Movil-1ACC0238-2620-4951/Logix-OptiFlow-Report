<div style="break-before: page; page-break-before: always;"></div>

# Anexos

<div style="break-before: page; page-break-before: always;"></div>

## Anexo A: EventStorming del dominio de OptiFlow

En este anexo se presenta la evidencia correspondiente al modelado del dominio mediante **EventStorming**, utilizado para identificar los principales eventos, comandos, actores y agrupaciones funcionales de la solución OptiFlow.


La evidencia de Anexo A: EventStorming del dominio de OptiFlow se presenta en [Figura A-001](#figura-a-001).

![EventStorming del dominio de OptiFlow](assets/cap2/DDD/Event-Storming%20pasos%201-3.jpg)

<a id="figura-a-001"></a>
**Figura A-001. EventStorming del dominio de OptiFlow.**


---

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

---

<div style="break-before: page; page-break-before: always;"></div>

## Anexo C: Domain Message Flows

Los diagramas por escenario y sus datos significativos se encuentran en [2.5.1.2](Capitulo2.md#2512-domain-message-flows-modeling). En la integración con inventario, consultar por escaneo no modifica el stock: el descuento de existencias corresponde a una actualización posterior al cierre de venta. La tabla siguiente conserva el resumen inicial y debe leerse con esa precisión.

En este anexo se presenta la evidencia del flujo de comunicación entre los Bounded Contexts mediante comandos y eventos de dominio.

Los principales flujos identificados incluyen:


<a id="tabla-a-001"></a>
La [Tabla A-001](#tabla-a-001) presenta detalle de Anexo C: Domain Message Flows y permite revisar los elementos documentados en esta sección.

**Tabla A-001. Detalle de Anexo C: Domain Message Flows.**

| Contexto emisor | Comando | Evento | Contexto receptor | Comando disparado |
|---|---|---|---|---|
| Search & Booking | `BookAppointment` | `AppointmentBooked` | Clinical & Commercial | `ExaminePatient` |
| Search & Booking | `BookAppointment` | `AppointmentBooked` | Notification & Loyalty | `SendAppointmentReminder` |
| Clinical & Commercial | `CloseSale` | `SaleWasClosed` | Production & Tracking | `GenerateWorkOrder` |
| Clinical & Commercial | `CloseSale` | `SaleWasClosed` | Store Management & Inventory | `ScanQRBarcodeToCheckStock` |
| Production & Tracking | `UpdateWorkOrderStatus` | `WorkOrderStatusUpdated` | Notification & Loyalty | `NotifyLensOrderProgress` |
| Production & Tracking | `DeliverLensesToPatient` | `OrderWasMarkedAsDelivered` | Notification & Loyalty | `SendSatisfactionSurvey` |

Estos flujos permiten evidenciar la comunicación entre los contextos sin necesidad de compartir directamente sus modelos de datos.

---

<div style="break-before: page; page-break-before: always;"></div>

## Anexo D: Context Mapping

En este anexo se presenta el **Context Map Final** de OptiFlow, donde se representan las relaciones entre los diferentes Bounded Contexts y sus mecanismos de integración.


La evidencia de Anexo D: Context Mapping se presenta en [Figura A-002](#figura-a-002).

<div align="center">
<img src="assets/cap2/ContextMappingFinal.png">
</div>

<a id="figura-a-002"></a>
**Figura A-002. Evidencia visual de Anexo D: Context Mapping.**


---

<div style="break-before: page; page-break-before: always;"></div>

## Anexo E: Arquitectura de Software

Se presentan como evidencia complementaria los diagramas correspondientes a los diferentes niveles de la arquitectura de software de OptiFlow.

### E.1. Context Level Diagram


La evidencia de E.1. Context Level Diagram se presenta en [Figura A-003](#figura-a-003).

![Context Level Diagram](assets/cap2/C4/context.svg)

<a id="figura-a-003"></a>
**Figura A-003. Context Level Diagram.**


### E.2. Container Level Diagram

Se reproduce el Container Level Diagram de la sección 2.5.3.2, con un único contenedor backend y persistencia relacional.


La evidencia de E.2. Container Level Diagram se presenta en [Figura A-004](#figura-a-004).

![Diagrama de contenedores de OptiFlow](assets/cap2/C4/containers-structurizr.svg)

<a id="figura-a-004"></a>
**Figura A-004. Container Level Diagram de OptiFlow elaborado en Structurizr.**


La leyenda de los elementos del diagrama se presenta a continuación.

**Figura A-901. Leyenda del Container Level Diagram.**

![Leyenda del diagrama de contenedores](assets/cap2/C4/containers-structurizr-key.svg)






### E.3. Component Diagrams

#### Clinical & Commercial


La evidencia de Clinical & Commercial se presenta en [Figura A-006](#figura-a-006).

![Clinical & Commercial Component Diagram](assets/cap2/C4/Clinical%20%26%20Commercial%20component.svg)

<a id="figura-a-006"></a>
**Figura A-006. Clinical & Commercial Component Diagram.**


#### Notification & Loyalty


La evidencia de Notification & Loyalty se presenta en [Figura A-007](#figura-a-007).

![Notification & Loyalty Component Diagram](assets/cap2/C4/Notification%20%26%20Loyalty%20component.svg)

<a id="figura-a-007"></a>
**Figura A-007. Notification & Loyalty Component Diagram.**


#### Production & Tracking


La evidencia de Production & Tracking se presenta en [Figura A-008](#figura-a-008).

![Production & Tracking Component Diagram](assets/cap2/C4/Production%20%26%20Tracking%20component.svg)

<a id="figura-a-008"></a>
**Figura A-008. Production & Tracking Component Diagram.**


#### Search & Booking


La evidencia de Search & Booking se presenta en [Figura A-009](#figura-a-009).

![Search & Booking Component Diagram](assets/cap2/C4/Search%20%26%20Booking%20component.svg)

<a id="figura-a-009"></a>
**Figura A-009. Search & Booking Component Diagram.**


#### Store Management & Inventory


La evidencia de Store Management & Inventory se presenta en [Figura A-010](#figura-a-010).

![Store Management & Inventory Component Diagram](assets/cap2/C4/Store%20Management%20%26%20Inventory%20component.svg)

<a id="figura-a-010"></a>
**Figura A-010. Store Management & Inventory Component Diagram.**


---

<div style="break-before: page; page-break-before: always;"></div>

## Anexo F: Diagramas de diseño táctico

La cardinalidad vigente de cotización–venta se especifica en [2.6.2.6.2](Capitulo2.md#26262-bounded-context-database-design-diagram): una cotización genera como máximo una venta, respaldada por la restricción de unicidad del backend.

En este anexo se presentan evidencias complementarias de los diagramas desarrollados para representar la estructura interna de los Bounded Contexts a nivel táctico.

### F.1. Production & Tracking

#### Domain Layer Class Diagram


La evidencia de Domain Layer Class Diagram se presenta en [Figura A-011](#figura-a-011).

![Production & Tracking Domain Layer Class Diagram](assets/cap2/ProductionTrackingDomainLayerClassDiagram.png)

<a id="figura-a-011"></a>
**Figura A-011. Production & Tracking Domain Layer Class Diagram.**


#### Database Design Diagram


La evidencia de Database Design Diagram se presenta en [Figura A-012](#figura-a-012).

![Production & Tracking Database Design Diagram](assets/cap2/ProductionTrackingDatabaseDesignDiagram.png)

<a id="figura-a-012"></a>
**Figura A-012. Production & Tracking Database Design Diagram.**


---

### F.2. Notification & Loyalty

El diseño táctico de este contexto contempla elementos como `NotificationPreferences`, `PatientBirthday`, `BirthdayDiscount`, `SatisfactionSurvey` y `ReactivationCampaign`, además de consumidores de eventos y adaptadores para servicios externos de mensajería.

---

<div style="break-before: page; page-break-before: always;"></div>

## Anexo G: Product Backlog

Como evidencia complementaria del levantamiento y priorización de requisitos, se presenta el Product Backlog desarrollado para OptiFlow.

Entre las funcionalidades priorizadas se encuentran el inicio de sesión, registro de pacientes, gestión de historias clínicas, consulta de recetas, búsqueda de ópticas, reserva de citas y consulta de inventario mediante escáner móvil.
