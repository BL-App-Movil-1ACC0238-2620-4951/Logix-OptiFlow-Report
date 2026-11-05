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

### Cuenta de Fidelización
Cuenta del paciente que acumula sus puntos de fidelización y registra el año del último beneficio de cumpleaños.

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
Conjunto de acciones orientadas a mantener la relación con los pacientes mediante beneficios, recordatorios, comunicaciones y encuestas.

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

### Modelo relacional
Organización de la persistencia mediante tablas, columnas, claves y restricciones. Es el modelo implementado en los cuatro contextos con migraciones V1–V4 de OptiFlow; una referencia UUID solo constituye una FK cuando su restricción está declarada en SQL.

### Montura
Producto físico utilizado como soporte para los lentes oftálmicos y que forma parte del catálogo comercial de la óptica.

### Movimiento de Stock
Registro de una entrada (reposición) o salida (venta) de un producto del inventario, con su cantidad, motivo, fecha y usuario. El conjunto de movimientos forma el historial de inventario.

### Notificación
Mensaje generado por OptiFlow para comunicar oportunamente al paciente o al personal autorizado información relacionada con citas, pedidos, recordatorios, promociones u otros eventos relevantes.

### Notificación de Avance
Notificación push enviada al dispositivo del paciente mediante Firebase Cloud Messaging cuando cambia el estado de su orden de trabajo.

### Notificación In-App
Mensaje mostrado directamente dentro de la aplicación móvil OptiFlow para informar al usuario sobre un evento o actualización relevante.

### Notification & Loyalty Context
Bounded Context encargado de gestionar las notificaciones, recordatorios, encuestas de satisfacción y beneficios de fidelización de los pacientes.

### Operación Offline
Capacidad de la aplicación para mostrar, sin conexión a internet, la última información consultada (citas, pedidos, avisos y catálogo). Las operaciones que modifican datos requieren conexión.

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

### Pasarela de Pagos
Servicio externo (Mercado Pago Checkout Pro) en el que el paciente paga sus ventas con tarjeta o Yape desde la aplicación; notifica a OptiFlow el resultado y la referencia de cada pago mediante un webhook.

### Permisos
Reglas que determinan las acciones y módulos que un usuario puede utilizar dentro de OptiFlow según el rol que tenga asignado.

### Personal autorizado
Empleado de la óptica al que se le asignan permisos para realizar determinadas actividades de gestión dentro de OptiFlow, como administrar citas, pacientes, inventario, ventas o notificaciones.

### PostgreSQL
Sistema de gestión relacional utilizado como una única base compartida por los contextos implementados del backend de OptiFlow. Las migraciones V1–V4 definen el esquema desplegado; H2 se utiliza en el perfil local y en pruebas.

### Precio
Valor monetario asociado a un producto o modelo de montura disponible para su comercialización.

### Probador Virtual
Funcionalidad de la aplicación móvil que muestra una montura del catálogo sobre el rostro del paciente, en tiempo real, mediante la cámara frontal y un servicio de filtros faciales de realidad aumentada.

### Production & Tracking Context
Bounded Context encargado de gestionar el ciclo de vida de las órdenes de trabajo, desde su generación y asignación hasta la fabricación y entrega de los lentes.

### Proveedor
Persona o empresa encargada de suministrar productos necesarios para mantener el inventario de la óptica.

### Receta
Registro que contiene los parámetros de la prescripción óptica indicada al paciente como resultado de una evaluación visual.

### Recordatorio de Cita
Notificación enviada al paciente para informar sobre una cita previamente reservada y próxima a realizarse.

### Recordatorio de Control Anual
Aviso que se envía al paciente 12 meses después de su cita para incentivar un nuevo control visual.

### Reporte
Documento generado a partir de la información registrada en OptiFlow para facilitar el análisis, seguimiento y toma de decisiones de la óptica.

### Reposición
Proceso mediante el cual se incrementa nuevamente la cantidad disponible de productos dentro del inventario de la óptica.

### Retraso de Entrega
Situación en la que una orden de trabajo presenta un retraso respecto a la fecha estimada de entrega establecida.

### Roles
Tipos de usuario definidos dentro de OptiFlow (`PATIENT`, `OPTOMETRIST`, `SALES_ADVISOR`, `TECHNICIAN` y `ADMIN`) que determinan las funcionalidades y la información a las que cada persona puede acceder. El rol viaja dentro del token JWT de la sesión.

### Search & Booking Context
Bounded Context encargado de la búsqueda de ópticas, consulta de disponibilidad, gestión de preferencias y reserva de citas.

### Seguimiento de Pedido
Funcionalidad que permite consultar el estado y avance de la elaboración de los lentes asociados a una orden de trabajo.

### Sincronización
Actualización de la copia local de la aplicación con la respuesta del backend cada vez que el usuario consulta información con conexión.

### SKU
Código único de cada modelo de montura, impreso como código de barras en la etiqueta; el escáner de la aplicación lo lee para consultar el producto.

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

### Android Studio
Entorno de desarrollo integrado para construir la aplicación móvil de OptiFlow en Kotlin, utilizando herramientas como Android SDK, Gradle, emulador y depuración USB para validar el comportamiento real de la solución.

### CameraX
Biblioteca de Android para acceder a la cámara del dispositivo. La aplicación móvil la utiliza en el escáner de monturas y en el probador virtual.

### Candidate Context Discovery
Técnica de análisis del dominio utilizada para identificar posibles Bounded Contexts a partir de eventos, entidades, actores y responsabilidades del negocio.

### Checkout Pro
Solución de pago de Mercado Pago en la que el backend crea una preferencia de pago y el paciente completa el pago en la página segura del proveedor, abierta desde la aplicación en una Chrome Custom Tab.

### Deep link
Enlace con un esquema propio de la aplicación (`optiflow://`) que abre una pantalla concreta de la app; se usa para volver a OptiFlow después de pagar en Mercado Pago Checkout Pro.

### Docker
Plataforma de contenedores que permite empaquetar los Web Services del proyecto en imágenes reproducibles y desplegables en distintos entornos sin depender de la configuración local del equipo.

### Domain Message Flow
Representación del intercambio de eventos y comandos entre los Bounded Contexts para coordinar procesos del negocio, como reservas, ventas, producción y notificaciones.

### Firebase App Distribution
Servicio de distribución de compilaciones de la aplicación móvil para pruebas internas, validación por parte del equipo y revisión de builds antes de su entrega.

### Firebase Cloud Messaging (FCM)
Servicio de Google para enviar notificaciones push a los dispositivos Android. El backend de OptiFlow lo utiliza para avisar al paciente sobre sus pedidos, citas y recordatorios.

### Figma
Herramienta de diseño colaborativo usada para crear wireframes, mock-ups y prototipos interactivos de la Landing Page y de la aplicación móvil.

### GitFlow
Modelo de ramificación que organiza el trabajo en ramas principales y temporales, como `main`, `develop`, `feature/*`, `release/*` y `hotfix/*`, para mantener un flujo ordenado de integración y entrega.

### GitHub Pages
Servicio de GitHub para publicar la Landing Page del proyecto de forma estática, permitiendo su acceso desde una URL pública.

### Google Maps Platform
Servicio de mapas de Google. La aplicación móvil utiliza Maps SDK for Android para mostrar las ópticas cercanas a partir de la latitud y longitud registradas en el backend.

### Jetpack Compose
Biblioteca de UI para Android basada en Kotlin que permite construir interfaces declarativas, reutilizables y adaptadas a pantallas móviles.

### JSON Web Token (JWT)
Token firmado que el backend entrega al iniciar sesión y que la aplicación envía en cada solicitud; contiene el identificador y el rol del usuario y permite validar la sesión sin guardarla en el servidor.

### Kotlin
Lenguaje de programación moderno utilizado para el desarrollo de la aplicación móvil de OptiFlow, reconocido por su sintaxis clara y su integración con Android.

### Landing Page
Sitio web promocional del proyecto que presenta la propuesta de valor de OptiFlow, su misión, sus objetivos y la solución orientada a pacientes y ópticas.

### Miro
Pizarra colaborativa empleada en sesiones de EventStorming para mapear eventos, actores, procesos y relaciones del dominio.

### Mock-up
Representación visual más detallada de una interfaz que muestra la distribución de elementos, contenido y estilos antes de la implementación final.

### Prototipo
Versión interactiva de la interfaz que simula la navegación entre pantallas y permite validar flujos de uso, contenido y experiencia del usuario.

### Render
Plataforma de despliegue utilizada para publicar los Web Services del backend en contenedores Docker y facilitar su acceso en entornos de prueba y producción.

### Realidad Aumentada (AR)
Tecnología que superpone elementos digitales sobre la imagen real captada por la cámara. En OptiFlow se emplea en el probador virtual de monturas.

### Room
Biblioteca de persistencia de Android sobre SQLite. La aplicación móvil la utiliza como caché local de solo lectura para mostrar la última información consultada cuando no hay conexión.

### Sprint 1
Primera iteración de desarrollo del proyecto, enfocada en priorizar el flujo de búsqueda de ópticas, consulta de disponibilidad y reserva de citas desde la perspectiva del paciente.

### Structurizr
Herramienta para modelar la arquitectura software con el enfoque C4 (Context, Container, Component y Deployment), útil para representar componentes y relaciones del sistema.

### User Story
Descripción de una necesidad del usuario expresada como una funcionalidad con valor para el negocio y la experiencia del cliente.

### Web Services
Backend del sistema encargado de exponer servicios y lógica de negocio para la gestión de pacientes, citas, pedidos, inventario y operaciones de la óptica.

### Webhook
Solicitud HTTP que un servicio externo envía al backend para avisar un acontecimiento; Mercado Pago lo usa para notificar el resultado de cada pago en `POST /payments/webhook`.

### Wireframe
Esquema básico de una pantalla o flujo que define la estructura, organización del contenido y navegación antes de refinarlos en mock-ups y prototipos.

### Venta
Transacción comercial cerrada mediante el pago del paciente que confirma la adquisición de los productos y servicios ópticos solicitados.
