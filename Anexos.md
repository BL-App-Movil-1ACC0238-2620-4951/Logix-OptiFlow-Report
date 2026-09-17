# Anexos

## Anexo A: EventStorming del dominio de OptiFlow

En este anexo se presenta la evidencia correspondiente al modelado del dominio mediante **EventStorming**, utilizado para identificar los principales eventos, comandos, actores y agrupaciones funcionales de la solución OptiFlow.

![EventStorming del dominio de OptiFlow](assets/cap2/DDD/Event-Storming%20pasos%201-3.jpg)

---

## Anexo B: Bounded Contexts identificados

La siguiente evidencia corresponde a la identificación de los cinco Bounded Contexts que estructuran el dominio de OptiFlow:

- **Search & Booking Context**
- **Clinical & Commercial Context**
- **Production & Tracking Context**
- **Notification & Loyalty Context**
- **Store Management & Inventory Context**

Estos contextos fueron delimitados a partir de las agrupaciones funcionales identificadas durante el análisis del dominio.

---

## Anexo C: Domain Message Flows

En este anexo se presenta la evidencia del flujo de comunicación entre los Bounded Contexts mediante comandos y eventos de dominio.

Los principales flujos identificados incluyen:

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

## Anexo D: Context Mapping

En este anexo se presenta el **Context Map Final** de OptiFlow, donde se representan las relaciones entre los diferentes Bounded Contexts y sus mecanismos de integración.

<div align="center">
<img src="assets/cap2/ContextMappingFinal.png">
</div>

---

## Anexo E: Arquitectura de Software

Se presentan como evidencia complementaria los diagramas correspondientes a los diferentes niveles de la arquitectura de software de OptiFlow.

### E.1. Context Level Diagram

![Context Level Diagram](assets/cap2/C4/context.svg)

### E.2. Container Level Diagram

![Container Level Diagram](assets/cap2/C4/container.svg)

### E.3. Component Diagrams

#### Clinical & Commercial

![Clinical & Commercial Component Diagram](assets/cap2/C4/Clinical%20%26%20Commercial%20component.svg)

#### Notification & Loyalty

![Notification & Loyalty Component Diagram](assets/cap2/C4/Notification%20%26%20Loyalty%20component.svg)

#### Production & Tracking

![Production & Tracking Component Diagram](assets/cap2/C4/Production%20%26%20Tracking%20component.svg)

#### Search & Booking

![Search & Booking Component Diagram](assets/cap2/C4/Search%20%26%20Booking%20component.svg)

#### Store Management & Inventory

![Store Management & Inventory Component Diagram](assets/cap2/C4/Store%20Management%20%26%20Inventory%20component.svg)

---

## Anexo F: Diagramas de diseño táctico

En este anexo se presentan evidencias complementarias de los diagramas desarrollados para representar la estructura interna de los Bounded Contexts a nivel táctico.

### F.1. Production & Tracking

#### Domain Layer Class Diagram

![Production & Tracking Domain Layer Class Diagram](assets/cap2/ProductionTrackingDomainLayerClassDiagram.png)

#### Database Design Diagram

![Production & Tracking Database Design Diagram](assets/cap2/ProductionTrackingDatabaseDesignDiagram.png)

---

### F.2. Notification & Loyalty

El diseño táctico de este contexto contempla elementos como `NotificationPreferences`, `PatientBirthday`, `BirthdayDiscount`, `SatisfactionSurvey` y `ReactivationCampaign`, además de consumidores de eventos y adaptadores para servicios externos de mensajería.

---

## Anexo G: Product Backlog

Como evidencia complementaria del levantamiento y priorización de requisitos, se presenta el Product Backlog desarrollado para OptiFlow.

Entre las funcionalidades priorizadas se encuentran el inicio de sesión, registro de pacientes, gestión de historias clínicas, consulta de recetas, búsqueda de ópticas, reserva de citas y consulta de inventario mediante escáner móvil.