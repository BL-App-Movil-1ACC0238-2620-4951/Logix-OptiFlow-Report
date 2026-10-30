# Guía de actualización de los diagramas de datos de OptiFlow

## Fuente y alcance

Esta revisión corresponde al backend `develop`, commit [`706ada9`](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/706ada927d4fd49807035e79d4313fbe463e9e54). El informe diferencia el esquema físico implementado del diseño funcional ampliado. Las imágenes existentes no se modificaron: su actualización gráfica queda a cargo del equipo.

El archivo [postgresql-implemented.sql](postgresql-implemented.sql) consolida, en orden y sin modificar sus sentencias, las migraciones de `src/main/resources/db/migration`:

- `V1__search_booking_schema.sql`: seis tablas de Search & Booking.
- `V2__clinical_commercial_schema.sql`: siete tablas de Clinical & Commercial.
- `V3__production_tracking_schema.sql`: cinco tablas de Production & Tracking.
- `V4__notification_loyalty_schema.sql`: dos tablas de Notification & Loyalty.

Son **20 tablas en una sola base PostgreSQL**. No se incluyen registros, credenciales, cambios al backend ni tablas propuestas de inventario. El perfil local H2 no constituye una base NoSQL. Los objetos anidados de los DTO del móvil tampoco definen el almacenamiento físico del servidor.

## Cómo preparar el modelo en Vertabelo / Redgate Data Modeler

1. Crear un modelo físico, seleccionar PostgreSQL e importar el SQL consolidado mediante `From SQL`.
2. Revisar el resultado de la importación y organizar una vista por contexto dentro del mismo modelo. Las tablas de otros contextos que se muestren como referencia siguen perteneciendo a la base compartida.
3. Conservar exactamente nombres, tipos, longitudes, nulabilidad, PK y FK declaradas. Revisar también `UNIQUE`, `CHECK` e índices; documentarlos con notas si la herramienta no los representa gráficamente.
4. Si el importador no admite el índice parcial final de V4, conservar el SQL original como referencia y omitir únicamente esa sentencia de una copia para importación; anotar en el modelo la unicidad de (`patient_id`, `appointment_id`) cuando la cita no es nula. No eliminar la regla del modelo documentado ni modificar las migraciones del backend.
5. Una importación DDL crea relaciones a partir de FK declaradas: no agregar otras solo por encontrar columnas terminadas en `_id`. Las referencias lógicas, si se dibujan, deben usar una línea diferenciada y una leyenda que diga «referencia lógica, sin FK declarada».
6. Exportar cada vista legible y conservar el archivo editable o enlace del modelo. Importar el DDL en el modelador sirve para dibujar; no requiere ejecutarlo contra la base de producción.

## Diagramas que deben actualizarse

### Search & Booking — sección 2.6.1.6.2, Figura 40

Tablas: `patients`, `optical_stores`, `time_slots`, `appointments`, `favorite_stores`, `store_ratings`.

- Corregir `patients.name` a `full_name`; incluir `password_hash` y todas las columnas de V1.
- Incluir `favorite_stores.saved_at`; utilizar `store_ratings.score`, `comment` y `created_at`, no el antiguo `rating_value`.
- Corregir longitudes y tipos: `full_name VARCHAR(80)`, correo `VARCHAR(120)`, teléfono del paciente `VARCHAR(20)`, `optical_stores.rating NUMERIC(3,2)` y `store_ratings.score NUMERIC(3,2)`.
- Representar las dos PK compuestas de favoritos y valoraciones y todas las FK de V1. No inventar `UNIQUE` sobre `appointments.time_slot_id`.
- Mostrar `TIMESTAMP WITH TIME ZONE` para las fechas de V1 y las restricciones exactas del archivo.
- Actualizar `assets/cap2/Database Design Diagram.png`.

### Clinical & Commercial — sección 2.6.2.6.2, Figura 43

Tablas: `clinical_records`, `medical_histories`, `optical_prescriptions`, `quotations`, `quotation_items`, `sales`, `electronic_receipts`.

- Completar todas las columnas y tipos de V2. El diagrama resumido no sustituye el modelo físico completo.
- `medical_histories.clinical_record_id` y `optical_prescriptions.clinical_record_id` son PK y FK: un registro tiene cero o una historia y cero o una receta.
- Una cotización puede tener cero o una venta: `sales.quotation_id` es FK, obligatorio y único.
- Una venta puede tener cero o un comprobante: `electronic_receipts.sale_id` es FK, obligatorio y único; `receipt_number` también es único.
- Incluir `quotations.rejection_reason`, las columnas de descuento y todos los campos de los ítems; (`quotation_id`, `line_number`) es único.
- No declarar FK de `clinical_records.patient_id`, `clinical_records.appointment_id` o `sales.patient_id`: V2 no las define.
- Actualizar la imagen utilizada por el informe: `assets/cap2/revision-tb1/clinical-commercial-db-tb1.svg`. Si se cambia de formato, actualizar su referencia, manteniendo el número de figura.

### Production & Tracking — sección 2.6.3.6.2, Figura 46 y Anexo F / Figura F2

Tablas: `work_orders`, `work_order_lenses`, `work_order_status_history`, `technicians`, `laboratories`.

- Reemplazar completamente el diagrama documental de MongoDB por las tablas de V3.
- Las dos FK de V3 son `work_order_lenses.work_order_id → work_orders.id` y `work_order_status_history.work_order_id → work_orders.id`.
- La PK del historial es (`work_order_id`, `sequence_number`). En lentes, (`work_order_id`, `line_number`) es único.
- `work_orders.sale_id` es obligatorio y único, pero no tiene FK hacia `sales`.
- No inventar FK para `patient_id`, `optical_store_id`, `technician_id` ni `laboratory_id` de la orden. Los nombres de técnico y laboratorio se copian en columnas de la orden como datos de la asignación, aunque existan los dos catálogos.
- La demora son columnas `delay_reason`, `delay_reported_at` y `delay_new_estimated_date`. Las fechas estimadas son `DATE`; las marcas de tiempo son `TIMESTAMP WITH TIME ZONE`.
- Actualizar `assets/cap2/ProductionTrackingDatabaseDesignDiagram.png`, que también se utiliza en el Anexo F.

### Notification & Loyalty — sección 2.6.5.6.2, Figura 52

Tablas: `notifications`, `loyalty_accounts`. Mostrar `patients` de V1 como tabla referenciada de otro contexto, sin contarla como tercera tabla propia.

- Reemplazar el diagrama de colecciones MongoDB: no existen tablas implementadas de preferencias, encuestas, personal o campañas en V4.
- `loyalty_accounts.patient_id` es PK y FK hacia `patients.id`: un paciente tiene cero o una cuenta. Incluir saldo, año del último beneficio y fecha de actualización.
- `notifications.patient_id` es FK hacia `patients.id`: un paciente puede tener muchas notificaciones. Incluir las diez columnas exactas de la tabla.
- `notifications.appointment_id` y `work_order_id` son opcionales y no tienen FK declaradas. No dibujarlas como relaciones físicas con citas y órdenes.
- Anotar el índice único parcial de (`patient_id`, `appointment_id`) y los valores permitidos de `type` y `status` definidos en V4.
- Actualizar `assets/cap2/NotificationLoyaltyDatabaseDesignDiagram.png`.

### Store Management & Inventory — sección 2.6.4.6.2, Figura 49

Marcar la imagen como **«Diseño propuesto — no implementado»**. No incorporarla como parte del esquema V1–V4 ni afirmar que tiene migración o despliegue. No comprometer su implementación en Sprint 2 si el backlog no la asigna explícitamente.

Archivo: `assets/cap2/StoreManagementInventoryDatabaseDesignDiagram.png`.

## Coherencia de las demás vistas

Revisar las figuras de componentes de Production & Tracking y Notification & Loyalty y sus reproducciones en anexos: si dibujan MongoDB o bases independientes, alinearlas con JPA/PostgreSQL y un único backend. Los diagramas de clases pueden contener objetos del dominio que no son tablas: no crear tablas automáticamente por cada objeto de valor ni convertir claves JPA compuestas en documentos NoSQL. Los canvases de funcionalidades futuras deben conservar su carácter de diseño.

## Criterios de cierre

- El modelo implementado tiene 20 tablas propias en total y una sola base PostgreSQL.
- Las vistas de cada contexto conservan la correspondencia V1: 6, V2: 7, V3: 5 y V4: 2.
- Solo se dibujan como relaciones físicas las FK declaradas; las demás tienen una leyenda distinta.
- Las columnas, tipos, nulabilidad y restricciones corresponden al SQL suministrado.
- Se actualizan las imágenes utilizadas y sus apariciones en anexos sin romper su numeración, leyendas o enlaces.
- Se conserva el modelo editable o su enlace como evidencia del trabajo en la herramienta.
