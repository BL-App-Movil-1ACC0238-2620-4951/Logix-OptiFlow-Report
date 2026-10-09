<div style="break-before: page; page-break-before: always;"></div>

# Glosario

### Aggregate
Conjunto de objetos del dominio que se mantienen bajo una única unidad de consistencia y cuyo acceso se controla mediante un Aggregate Root.

### Aggregate Root
Entidad principal responsable de controlar el acceso y las operaciones sobre un Aggregate.

### Alerta de Stock Crítico
Notificación automática generada cuando las unidades disponibles de una montura alcanzan o se encuentran por debajo del umbral mínimo configurado.

### Anti-Corruption Layer (ACL)
Patrón utilizado para evitar que los modelos o estructuras de un sistema o Bounded Context externo afecten directamente al modelo interno de otro contexto.

### Aplicación móvil
Aplicación de OptiFlow diseñada para dispositivos móviles, mediante la cual pacientes y personal de la óptica pueden acceder a las funcionalidades de la plataforma según su rol.

### Bounded Context
Límite explícito dentro del dominio de OptiFlow que define un modelo y lenguaje propio para un conjunto específico de funcionalidades y responsabilidades del sistema.

### Campaña de Reactivación
Recordatorio preventivo enviado periódicamente al paciente para incentivar un nuevo control de su graduación visual.

### Catálogo
Conjunto de modelos de monturas disponibles para consulta y comercialización dentro de una óptica.

### Cita óptica
Programación formal de una atención optométrica en una óptica, asociada a una fecha y horario disponibles para el paciente.

### Clinical & Commercial Context
Bounded Context encargado de la gestión de información clínica, evaluaciones, recetas, cotizaciones y ventas.

### Command
Solicitud que representa una acción que debe ser ejecutada dentro de un Bounded Context, como `BookAppointment`, `CloseSale` o `GenerateWorkOrder`.

### Context Mapping
Representación de las relaciones y dependencias existentes entre los Bounded Contexts de OptiFlow.

### Control visual
Evaluación periódica realizada para revisar el estado de la visión del paciente y determinar si requiere una nueva evaluación o actualización de su receta.

### Cotización
Presupuesto comercial detallado que calcula el costo de los productos y servicios requeridos por un paciente, considerando elementos como la montura, lentes y tratamientos específicos.

### Cumpleaños del Paciente
Fecha registrada del paciente que puede ser utilizada por OptiFlow para activar automáticamente acciones de comunicación y fidelización.

### Customer / Supplier
Patrón de Context Mapping en el que un Bounded Context actúa como proveedor de información o servicios y otro como consumidor de estos.

### Dashboard
Panel visual que presenta indicadores y métricas relevantes de la operación de una óptica para facilitar el seguimiento y la toma de decisiones.

### Descuento de Cumpleaños
Beneficio promocional enviado al paciente con motivo de su cumpleaños como parte de las acciones de fidelización.

### Disponibilidad de atención
Información sobre los horarios y espacios disponibles de una óptica que permite al paciente seleccionar un horario y reservar una cita.

### Domain Event
Evento que representa algo relevante que ocurrió dentro del dominio y que puede ser utilizado por otros componentes o Bounded Contexts para iniciar nuevas acciones.

### Encuesta de Satisfacción
Mecanismo utilizado para recopilar la percepción del paciente sobre la atención o experiencia recibida, especialmente después de la entrega de un pedido.

### Estado de la Orden de Trabajo
Fase en la que se encuentra una orden dentro del proceso de producción. En OptiFlow comprende los estados `Pendiente`, `En Taller`, `Control de Calidad` y `Listo para Entrega`.

### EventStorming
Técnica de modelado colaborativo utilizada para identificar eventos, comandos, actores, reglas y procesos relevantes del dominio de OptiFlow.

### Fecha Estimada de Entrega
Fecha calculada o establecida para indicar cuándo estará disponible el pedido de lentes para su entrega al paciente.

### Fidelización
Conjunto de acciones orientadas a mantener la relación con los pacientes mediante beneficios, comunicaciones, encuestas y campañas de reactivación.

### Frame Model (Modelo de Montura)
Artículo físico del catálogo que representa un modelo de montura con atributos como material, forma y color.

### Historia Clínica Electrónica (HCE)
Registro digital que almacena la información clínica y visual de un paciente, incluyendo evaluaciones, observaciones y antecedentes registrados durante su atención.

### Inventario
Conjunto de productos disponibles en la óptica cuya existencia puede ser consultada y gestionada mediante OptiFlow.

### Laboratorio
Entidad encargada de realizar procesos especializados relacionados con la fabricación, tallado o biselado de los lentes solicitados mediante una orden de trabajo.

### Métricas Operativas
Indicadores utilizados para evaluar el funcionamiento de la óptica, como cantidad de atenciones, citas, ventas, pedidos, inventario y otras operaciones registradas.

### MongoDB
Sistema de gestión de bases de datos orientado a documentos utilizado para la persistencia de información en determinados Bounded Contexts de OptiFlow.

### Montura
Producto físico utilizado como soporte para los lentes oftálmicos y que forma parte del catálogo comercial de la óptica.

### Notificación
Mensaje generado por OptiFlow para comunicar oportunamente al paciente o al personal autorizado información relacionada con citas, pedidos, recordatorios, promociones u otros eventos relevantes.

### Notificación de Avance
Mensaje automático enviado al paciente mediante canales como notificaciones push o WhatsApp cuando cambia el estado de su orden de trabajo.

### Notificación In-App
Mensaje mostrado directamente dentro de la aplicación móvil OptiFlow para informar al usuario sobre un evento o actualización relevante.

### Notification & Loyalty Context
Bounded Context encargado de gestionar las notificaciones, recordatorios, encuestas de satisfacción, beneficios y campañas de fidelización y reactivación de pacientes.

### Operación Offline
Capacidad de la aplicación para continuar realizando determinadas operaciones críticas cuando el dispositivo presenta una interrupción temporal de conexión a Internet.

### Óptica
Establecimiento especializado en servicios relacionados con la evaluación visual, atención optométrica y comercialización de productos ópticos.

### OptiFlow
Aplicación móvil orientada a centralizar la gestión de citas, pacientes, información clínica, operaciones comerciales, inventario, órdenes de trabajo, seguimiento de pedidos y notificaciones de una óptica.

### Optómetra
Profesional encargado de realizar evaluaciones visuales y gestionar la información clínica y las recetas ópticas del paciente dentro de OptiFlow.

### Orden de Trabajo
Registro operativo que contiene las especificaciones técnicas necesarias para la elaboración de los lentes de un paciente y permite controlar su proceso de fabricación hasta la entrega.

### Paciente
Persona que utiliza OptiFlow para buscar una óptica, reservar una cita, consultar su información clínica, adquirir productos ópticos y realizar seguimiento de sus pedidos.

### Permisos
Reglas que determinan las acciones y módulos que un usuario puede utilizar dentro de OptiFlow según el rol que tenga asignado.

### Personal autorizado
Empleado de la óptica al que se le asignan permisos para realizar determinadas actividades de gestión dentro de OptiFlow, como administrar citas, pacientes, inventario, ventas o notificaciones.

### PostgreSQL
Sistema de gestión de bases de datos relacional utilizado para la persistencia de información en determinados Bounded Contexts de OptiFlow.

### Precio
Valor monetario asociado a un producto o modelo de montura disponible para su comercialización.

### Preferencias de Notificación
Configuración que determina las preferencias del paciente respecto a la recepción de comunicaciones y notificaciones.

### Production & Tracking Context
Bounded Context encargado de gestionar el ciclo de vida de las órdenes de trabajo, desde su generación y asignación hasta la fabricación y entrega de los lentes.

### Proveedor
Persona o empresa encargada de suministrar productos necesarios para mantener el inventario de la óptica.

### Receta
Registro que contiene los parámetros de la prescripción óptica indicada al paciente como resultado de una evaluación visual.

### Recordatorio de Cita
Notificación enviada al paciente para informar sobre una cita previamente reservada y próxima a realizarse.

### Reporte
Documento generado a partir de la información registrada en OptiFlow para facilitar el análisis, seguimiento y toma de decisiones de la óptica.

### Reposición
Proceso mediante el cual se incrementa nuevamente la cantidad disponible de productos dentro del inventario de la óptica.

### Retraso de Entrega
Situación en la que una orden de trabajo presenta un retraso respecto a la fecha estimada de entrega establecida.

### Roles
Tipos de usuario definidos dentro de OptiFlow que determinan las funcionalidades y la información a las que cada persona puede acceder.

### Search & Booking Context
Bounded Context encargado de la búsqueda de ópticas, consulta de disponibilidad, gestión de preferencias y reserva de citas.

### Seguimiento de Pedido
Funcionalidad que permite consultar el estado y avance de la elaboración de los lentes asociados a una orden de trabajo.

### Sincronización
Proceso mediante el cual la información registrada en el dispositivo se actualiza y mantiene consistente con los datos almacenados en el sistema.

### Stock
Cantidad disponible de un determinado producto dentro del inventario de una óptica.

### Store Management & Inventory Context
Bounded Context encargado de administrar el catálogo de monturas, precios, stock, inventario, proveedores y procesos de reposición.

### Tablero Kanban
Herramienta visual utilizada para representar y gestionar el estado de las órdenes de trabajo mediante las diferentes etapas del proceso de producción.

### Técnico
Persona responsable de ejecutar actividades relacionadas con la elaboración y procesamiento de los lentes dentro del proceso de producción.

### Time Slot
Bloque de horario disponible para la atención de un paciente en una óptica.

### Ubiquitous Language
Lenguaje común utilizado por el equipo y los especialistas del dominio para representar los conceptos y procesos del sistema de manera consistente.

### Venta
Transacción comercial cerrada mediante el pago del paciente que confirma la adquisición de los productos y servicios ópticos solicitados.
