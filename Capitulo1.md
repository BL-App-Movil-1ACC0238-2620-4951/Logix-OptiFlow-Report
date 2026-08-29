# Capítulo I: Introducción

## 1.1. Startup Profile

### 1.1.1. Descripción de la Startup

OptiFlow nace para cerrar la brecha entre la gestión oftalmológica empírica y la innovación tecnológica. Somos una startup comprometida con la unificación de los procesos clínicos, comerciales y de producción en establecimientos ópticos, asegurando que la toma de decisiones basada en datos reemplace a la intuición, maximizando la conversión de ventas, la retención de clientes y la trazabilidad de los pedidos.

La misión de OptiFlow es ofrecer un sistema integral tipo ERP/CRM complementado con una solución móvil, optimizando los flujos de trabajo administrativos y la experiencia del usuario. Buscamos transformar la gestión manual de historiales médicos, inventarios comerciales y órdenes de laboratorio en datos accionables y centralizados en la nube, garantizando operaciones comerciales eficientes, transparentes y accesibles.

Nuestra visión es consolidarnos como la plataforma líder en gestión operativa y comercial para el sector oftalmológico, promoviendo una administración moderna y predictiva que elimine los silos de información entre el consultorio, el piso de ventas y el laboratorio, impulsando a las ópticas hacia una transformación digital absoluta centrada en la movilidad.

Alcance de la aplicación: El alcance de OptiFlow comprende un ecosistema que integra una plataforma administrativa para la creación de historias clínicas electrónicas, el control detallado de inventarios, las ventas y la trazabilidad de órdenes de trabajo mediante un tablero Kanban para los laboratorios, complementada estrechamente con una aplicación móvil nativa o híbrida. La aplicación móvil abarca el portal del paciente para la consulta de recetas digitales, notificaciones push en tiempo real sobre el estado de fabricación de las lunas, el seguimiento interactivo de órdenes y pagos, así como herramientas de consulta rápida de stock y catálogo para agilizar la atención en el piso de venta.

### 1.1.2. Perfiles de integrantes del equipo

|Foto|Apellido y Nombre| 
| --- | --- |
<img src="assets/members" alt="integrante"> | Descripcion

<img src="assets/members"> |


<img src="assets/members"> | Descripcion

<img src="assets/members/nicolas.png"> | 
Atoche Gonzales - Nicolas Fernando - u20241d317 Actualmente estoy en el sexto ciclo de la carrera de ingeniería de software. Poseo un conocimiento básico/intermedio en programación con C++, Lua, Luau, Python y Java. Además, cuento con conocimientos básicos en el desarrollo de videojuegos. Suelo orientarme por el conocimiento y el pensamiento lógico, con lo cual suelo buscar la solución más óptima y ágil dentro de un problema a través de pasos sencillos y definidos que construyan una base sólida donde pueda desarrollar respuestas claras y efectivas.

<img src="assets/members/cesar.jpeg"> | 
Quispe Llacsahuanga César Agusto - u202417405 Soy estudiante de Ingeniería de Software, interesado en el desarrollo de soluciones tecnológicas y el aprendizaje continuo en herramientas de programación. Cuento con conocimientos en lógica de programación, bases de datos y desarrollo de aplicaciones, lo que me permite contribuir en la construcción de sistemas eficientes. Me caracterizo por ser responsable, proactivo y con buena disposición para el trabajo en equipo, adaptándome a nuevos retos y aportando en el cumplimiento de los objetivos del proyecto.

## 1.2. Solution Profile

### 1.2.1. Antecedentes y problemática

El problema central radica en la deficiente administración del ecosistema comercial y operativo de las ópticas ante un alto volumen de demanda. Existe una desconexión crítica (silos de información) entre el consultorio, el área de ventas y el laboratorio de producción. A medida que aumenta la cantidad de pacientes, los sistemas manuales colapsan por sobrecarga cognitiva, generando una ineficiencia operativa severa. Según estudios, la entrada manual de datos en establecimientos de salud provoca errores de omisión y transposición que impactan la integridad del servicio (Flatworld Solutions, 2026). Por otro lado, la retención de historias clínicas y órdenes en papel ralentiza drásticamente el flujo de atención, exponiendo a la clínica a la pérdida de datos y mermas económicas (Glasson, 2025).

Esta desorganización empeora en la cadena de suministro. Las órdenes de trabajo enviadas al laboratorio, a menudo transcritas rápidamente en horas pico hacia hojas de cálculo o chats de WhatsApp, son un foco altísimo de errores de montaje. La falta de un sistema capaz de procesar concurrencia hace que el administrador opere a ciegas, perdiendo el control del inventario y la rentabilidad.

**What / ¿Qué?** 
La problemática central es la latencia sistémica y la fragmentación administrativa en las ópticas. Esto se agrava exponencialmente por el alto volumen de pacientes, lo que provoca que los procesos manuales y de memoria colapsen. Según Flatworld Solutions (2026), la gestión no automatizada genera errores transaccionales (duplicados u omisiones) que destruyen la eficiencia, resultando en pérdida de conversiones, descuadre de inventarios y errores de montaje en el laboratorio.

**When / ¿Cuándo?** 
Estos problemas se manifiestan en el día a día y explotan durante las horas pico. Al aumentar la rotación de clientes, el seguimiento manual es insostenible; el personal no tiene el ancho de banda mental para atender pacientes y rastrear pedidos físicos simultáneamente.

**Where / ¿Dónde?** 
Ocurre de forma transversal en cadenas de ópticas medianas que intentan procesar un alto volumen de transacciones diarias utilizando herramientas domésticas (papel, Excel) en lugar de un software de nivel corporativo (ERP).

**Who / ¿Quién?**
Afecta a tres grupos: Administradores (pierden control financiero y sufren mermas operativas), Staff/Optómetras (sufren sobrecarga laboral por tareas repetitivas y búsquedas manuales) y Pacientes (sufren demoras por trabajos rehechos y falta de información clara).

**Why / ¿Por qué?**
El problema persiste porque las clínicas no cuentan con una arquitectura de software que soporte el crecimiento a escala. Parseur (2026) señala que la dependencia de la entrada manual de datos en áreas de salud causa tiempos de respuesta inaceptables y requiere un esfuerzo insostenible durante picos de demanda. La información se queda atrapada en canales asíncronos y aislados.

**How / ¿Cómo?** 
La solución operará a través de un ERP/CRM centralizado. Los doctores registrarán la receta digitalmente; ventas tomará ese registro en tiempo real para generar una cotización cruzada con el inventario; y se emitirá una Orden de Trabajo digital que el laboratorio actualizará en un tablero Kanban, automatizando las notificaciones al paciente.

**How much (Cuánto)** 
La ineficiencia manual y la saturación de datos generan una fuga de capital masiva. Las fallas en la transcripción de datos en la industria cuestan a las empresas millones anuales en procesos de retrabajo y pérdida de clientes (Parseur, 2026). Por el contrario, la implementación de un software integrado y específico permite aumentar el volumen de atención de pacientes entre un 30% y 40% sin incrementar el agotamiento del personal, eliminando los cuellos de botella (Glasson, 2026). Además, las historias clínicas electrónicas (EHR) pueden reducir los retrasos y errores médicos en cerca del 30% (Kivicare, 2024). (faltaron graficas)

### 1.2.2. Lean UX Process

Nuestro servicio ofrece un ecosistema digital compuesto por una aplicación móvil centralizada para gestionar el ciclo comercial, el historial clínico y la logística de producción (órdenes de trabajo) en ópticas. Hemos observado que, ante un alto volumen de pacientes, la carencia de un sistema unificado ocasiona el colapso de los procesos manuales, generando silos de información, pérdida de trazabilidad en la fabricación de lentes, descuadre de inventarios y una deficiente gestión de cobranzas. Esto provoca retrasos que perjudican enormemente la experiencia del cliente y generan mermas económicas por trabajos rehechos. ¿De qué manera podemos digitalizar e integrar el flujo de ventas, producción y atención clínica mediante herramientas web y móviles para optimizar la toma de decisiones de la gerencia, eliminar errores de transcripción logística y garantizar entregas puntuales y rentables?

#### 1.2.2.1. Lean UX Problem Statements

#### A. Business Assumptions
* Creemos que nuestros clientes necesitan:
Unificar la gestión clínica, comercial y logística de sus ópticas en una única interfaz móvil para eliminar los procesos manuales y los silos de información entre el consultorio, las ventas y el laboratorio.
* Creemos que estas necesidades se resolverán mediante:
Una aplicación móvil especializada (OptiFlow) que integre historias clínicas electrónicas, control de inventarios, gestión de ventas y trazabilidad de órdenes de trabajo mediante un tablero Kanban móvil.
* Creemos que nuestros primeros clientes serán:
Ópticas medianas con un alto volumen de pacientes que buscan digitalizar sus operaciones sin depender de equipos de cómputo fijos o sistemas complejos.
* Creemos que el principal valor para nuestros clientes será:
La movilidad y el control en tiempo real del negocio desde la palma de la mano, mejorando la velocidad de atención y la precisión en las entregas.
* Creemos que los usuarios obtendrán beneficios adicionales como:
La reducción de errores de transcripción, la disminución de trabajos rehechos, un mejor control de inventarios, mayor retención de clientes y trazabilidad transparente de las órdenes.
* Creemos que adquiriremos nuestros primeros usuarios mediante:
Demostraciones directas en establecimientos ópticos, validación académica, difusión en redes especializadas y pruebas piloto con negocios locales.
* Creemos que nuestro modelo de ingresos será:
Un modelo de suscripción mensual (SaaS) basado en el volumen de usuarios activos o sucursales conectadas a la aplicación móvil.
* Creemos que nuestros principales competidores serán:
Sistemas ERP tradicionales de escritorio o plataformas web genéricas que no están optimizadas para la movilidad en el piso de venta de una óptica.
* Creemos que nuestra principal ventaja competitiva será:
Una aplicación móvil intuitiva y diseñada específicamente para el flujo de trabajo oftalmológico, permitiendo operar sin fricciones desde cualquier lugar del establecimiento.
* Creemos que el mayor riesgo del producto será:
La resistencia al cambio del personal tradicional y la complejidad de adaptar flujos clínicos y de laboratorio detallados a una interfaz móvil.
* Creemos que podremos mitigar este riesgo mediante:
Una interfaz móvil altamente simplificada, experiencia de usuario (UX) centrada en roles (optómetra, ventas, administración) y capacitación guiada dentro de la app.

#### B. User Assumptions
* Creemos que los usuarios serán:
Administradores, optómetras y asesores de ventas de ópticas que requieren coordinar operaciones de forma rápida y portátil.
* Creemos que el producto formará parte de:
Su jornada laboral diaria, utilizándose de forma constante en el piso de ventas, durante los exámenes visuales y al registrar el avance en el taller.
* Creemos que el principal problema que desean resolver es:
La desconexión entre áreas, la pérdida de recetas o estados de órdenes y la lentitud al consultar inventarios o precios frente al cliente.
* Creemos que el uso más frecuente del producto será:
Consultar y registrar historiales clínicos, escanear productos para verificar stock, registrar ventas y actualizar el estado de las órdenes en el tablero Kanban móvil.
* Creemos que las características más importantes para los usuarios serán:
Un dashboard móvil por roles, historias clínicas digitales de acceso rápido, notificaciones push de estado de laboratorio y herramientas de venta ágil.
* Creemos que los usuarios esperarán una interfaz:
Fluida, nativa o multiplataforma de alto rendimiento, con tiempos de respuesta inmediatos y muy fácil de usar sin necesidad de conocimientos técnicos avanzados.

#### C. User Outcome & Benefit Assumptions
* Creemos que los usuarios podrán consultar y actualizar información crítica del negocio en cualquier momento desde su dispositivo móvil.
* Creemos que los usuarios reducirán drásticamente los errores de transcripción logística y los reprocesos en el laboratorio.
* Creemos que los usuarios agilizarán la atención al paciente en el piso de ventas gracias a la portabilidad del sistema.
* Creemos que los usuarios experimentarán mayor control y tranquilidad frente al flujo diario de pedidos y entregas.
* Creemos que los usuarios disminuirán los tiempos de espera de los clientes mediante notificaciones y un seguimiento claro.

#### D. Business Outcome Assumptions
* Creemos que OptiFlow permitirá reducir los tiempos de entrega de las órdenes de trabajo en al menos un 25% durante los primeros meses de uso.
* Creemos que el uso de la aplicación móvil incrementará la conversión de ventas en el piso de atención en aproximadamente un 20%.
* Creemos que alcanzaremos al menos las primeras ópticas piloto operando de forma activa y continua en el primer año.
* Creemos que lograremos una alta retención operativa gracias a la mejora directa en la productividad diaria del personal.
* Creemos que nos diferenciaremos de softwares de escritorio rígidos mediante la agilidad, portabilidad y enfoque móvil de la solución.

#### E. Feature Assumptions
* Creemos que el Módulo de Historia Clínica Móvil permitirá consultar y registrar diagnósticos de manera inmediata desde el consultorio.
* Creemos que el Tablero Kanban Móvil optimizará la trazabilidad y el control de las órdenes en el área de laboratorio.
* Creemos que la herramienta de Consulta de Stock por Cámara (escaneo) agilizará las cotizaciones y ventas en el salón de exhibición.
* Creemos que las Notificaciones Push en tiempo real mantendrán informados tanto al personal como al cliente sobre el estado de sus lentes.
* Creemos que el Control de Accesos por Roles (Administrador, Optómetra, Ventas) garantizará la seguridad y la correcta segregación de funciones en la aplicación.

#### 1.2.2.2. Lean UX Assumptions

##### Preguntas sobre el Producto / Usuario (User Assumptions)

###### ¿Quién es el usuario?
Nuestros usuarios principales internos son los administradores/gerentes de la óptica, el personal clínico (optómetras), los asesores de ventas y los técnicos de laboratorio. De forma indirecta, impactamos a los pacientes (clientes finales).

- El administrador utilizará el sistema para auditar embudos de ventas, inventario y flujo de caja.
- El staff lo usará para registrar historias clínicas, cotizar cruzando datos con el inventario, cobrar adelantos y enviar/monitorear órdenes de trabajo al laboratorio.
- El paciente interactúa indirectamente al recibir notificaciones automatizadas de su pedido.

###### ¿Dónde encaja nuestro producto en su trabajo o vida?
Será el core operativo y la espina dorsal del negocio. Estará abierto constantemente en navegadores web o tablets desde la apertura hasta el cierre, reemplazando:
- Historias en papel
- Hojas de Excel aisladas para inventario
- Chats de WhatsApp para la comunicación con los laboratorios

###### ¿Qué problemas tiene nuestro producto que resolver?
La latencia y fragmentación de datos ante el alto volumen de atención. Específicamente:

- La fuga de conversiones (recetas emitidas que no terminan en ventas por falta de seguimiento).
- Los errores de montaje y mermas económicas por la transcripción manual de órdenes al laboratorio.
- El descuadre de inventario de monturas entre piso de ventas y almacén.
- La insatisfacción del cliente por retrasos y falta de comunicación proactiva sobre sus lentes.

###### ¿Cuándo y cómo es usado nuestro producto?
De forma concurrente durante toda la jornada comercial, intensificando su uso durante las horas pico.

- Los vendedores operarán el módulo POS en el mostrador
- Los doctores el módulo EHR en cabina
- Los laboratorios el tablero Kanban para actualizar estados
- Los administradores lo usarán para cortes de caja diarios y análisis de KPIs a fin de mes

###### ¿Qué características son importantes?
- Historias clínicas electrónicas (EHR) vinculadas directamente al Punto de Venta (POS) para auto-completar cotizaciones
- Control de inventario sincronizado en tiempo real
- Tablero Kanban para la trazabilidad visual de las Órdenes de Trabajo (Work Orders)
- Motor CRM para notificaciones automatizadas al paciente

###### ¿Cómo debe verse nuestro producto y cómo debe comportarse?
Debe ser comercial, impecable y con un diseño de interfaz (Lean UI) que reduzca la carga cognitiva en horas de alta demanda.

- El flujo de cotización debe ser rápido para evitar filas
- El tablero del laboratorio debe ser visualmente jerarquizado (semaforización de estados)
- Debe permitir actualizaciones de un solo clic

---

##### Business Assumptions

Creo que mis clientes necesitan un sistema integral que:

- Soporte el escalamiento de sus atenciones
- Elimine el desorden administrativo por sobrecarga de datos
- Erradique las mermas por errores de pedidos manuales
- Permita control financiero total

Estas necesidades se pueden resolver con:

> La implementación de nuestra plataforma web ERP/CRM que automatiza el viaje de la información, conectando sin fricción la receta del doctor, la venta en mostrador y la fabricación en el laboratorio.

###### Clientes iniciales
Cadenas de ópticas medianas y grandes en Lima Metropolitana que:

- Procesan altos volúmenes de órdenes diarias
- Sufren de cuellos de botella por dependencia al papel y métodos empíricos

###### Propuesta de valor

**Para el gerente:**
- Aumentar la rentabilidad neta
- Mejorar la conversión de ventas
- Reducir a cero errores de transcripción
- Mantener control exacto de cuentas por cobrar

**Para el paciente:**
- Recibir sus lentes con medida exacta
- Cumplimiento de fechas prometidas
- Información constante del proceso

###### Beneficios adicionales

**Administrativos:**
- Auditoría de eficiencia y conversión por empleado
- Digitalización y eliminación de archivos físicos
- Proyección de demanda de inventario

**Personal operativo:**
- Reducción de estrés
- Menos dependencia de WhatsApp
- Mejora del clima laboral
- Mejor trato al paciente

###### Estrategia de adquisición de clientes
- Ventas directas B2B
- Demostraciones de la plataforma
- Programas piloto gratuitos en sucursales

###### Modelo de ingresos
Modelo B2B tipo SaaS (Software as a Service):

- Suscripciones mensuales o anuales
- Escaladas según:
  - Número de sucursales
  - Usuarios administrativos
  - Volumen de transacciones

###### Competencia
- Sistemas POS genéricos sin soporte optométrico
- Uso combinado de Excel + WhatsApp

###### Ventaja competitiva
Proponemos una solución verticalizada que:

- Integra la complejidad clínica (receta médica)
- Conecta la venta retail (montura)
- Gestiona la logística de producción (laboratorio)

Todo en un solo ecosistema.

###### Riesgos principales
- Resistencia al cambio del personal
- Dependencia de laboratorios externos
- Preferencia por WhatsApp

###### Mitigación
- Diseño UX/UI altamente usable
- Autocompletado desde recetas para acelerar ventas
- Interfaces simplificadas para laboratorios

###### Suposiciones tecnológicas
Se asume que las ópticas cuentan con:

- Computadoras o tablets
- Red Wi-Fi estable

**Riesgo:**  
Si no hay internet confiable, el modelo SaaS en la nube podría fallar.

**Posible solución:**  
Evaluar una arquitectura *offline-first*.

#### 1.2.2.3. Lean UX Hypothesis Statements

#### Hipótesis y Métricas

##### Hipótesis 1
**Hipótesis:**  
Creemos que si integramos el historial clínico (EHR) directamente con el módulo de cotización y ventas (POS), se reducirá la fuga de pacientes que no compran sus lentes.

**Métrica:**  
Sabremos que funcionó cuando la tasa de conversión (recetas emitidas vs. ventas concretadas) aumente en un **15%** en el primer trimestre.

---

##### Hipótesis 2
**Hipótesis:**  
Creemos que si proporcionamos un tablero Kanban de Órdenes de Trabajo para el laboratorio, conectado a la base de datos central, se erradicarán los errores por transcripción manual.

**Métrica:**  
Sabremos que esto funcionó cuando los reportes demuestren una disminución del **90%** en los costos asumidos por refabricación de lentes (mermas) en los primeros tres meses.

---

##### Hipótesis 3
**Hipótesis:**  
Creemos que automatizar el envío de notificaciones (Email/SMS) sobre el estado del pedido reducirá la carga de atención al cliente y mejorará la percepción del servicio.

**Métrica:**  
Sabremos que funcionó cuando las llamadas o mensajes de pacientes consultando *"¿dónde están mis lentes?"* se reduzcan en un **80%**.

#### 1.2.2.4. Lean UX Canvas

![Lean UX Canvas.png](assets/cap1/Lean%20UX%20Canvas.png)

## 1.3. Segmentos objetivo

### Segmento 1: Usuarios internos del centro óptico (Administración y personal operativo)

El segmento primario de OptiFlow está compuesto por el personal que opera directamente dentro del establecimiento óptico: administradores de sede, gerentes de operaciones, optómetras, asesores de ventas y técnicos de laboratorio. Se trata de profesionales de entre 22 y 55 años, de nivel socioeconómico B y C, ubicados principalmente en zonas urbanas de Lima Metropolitana y otras ciudades con alta concentración comercial como Arequipa, Trujillo y Piura.
En cuanto al tamaño del mercado, el sector óptico en Perú alcanzó un volumen aproximado de USD 295,05 millones en 2025 y se proyecta que llegará a USD 403,93 millones en 2035, con una tasa de crecimiento anual compuesta del 3,60% (Informes de Expertos, 2026). Este crecimiento sostenido implica un aumento proporcional en el número de establecimientos ópticos que necesitan herramientas de gestión más sofisticadas. El mercado peruano se caracteriza por su alta fragmentación, con una marcada división entre un grupo de grandes cadenas que controla una sola compañía y un vasto sector de ópticos independientes, donde la gran mayoría opera entre una y diez tiendas (Infomercado, 2026). Este segundo grupo representa el principal mercado objetivo de OptiFlow, ya que son precisamente estos negocios los que carecen de estructura tecnológica para escalar sus operaciones.
En términos de comportamiento, el entorno es altamente atomizado con un crecimiento del consumo estimado en torno al 10% anual (Modaengafas, 2026). Esto genera una presión operativa creciente sobre el personal, que debe atender más pacientes con los mismos recursos humanos y herramientas deficientes. Los usuarios de este segmento experimentan frustración ante sistemas fragmentados que obligan a duplicar registros entre consultorio, ventas y laboratorio, y valoran herramientas que centralicen la información, reduzcan errores operativos y mejoren la trazabilidad de las órdenes de trabajo en tiempo real.

### Segmento 2: Clientes de la óptica (Pacientes)
El segmento secundario está conformado por los pacientes que reciben servicios en las ópticas donde se implemente OptiFlow. Son personas de entre 18 y 60 años o más, de nivel socioeconómico transversal (A, B, C y D), residentes en zonas urbanas con acceso a centros ópticos. Según datos de 2024, el 80,4% de la población peruana vive en áreas urbanas, con una edad media de 29,8 años (Informes de Expertos, 2026), lo que define un mercado potencial amplio y con creciente necesidad de corrección visual, impulsada por el uso intensivo de dispositivos digitales.
El comportamiento de este segmento está marcado por agendas ajustadas y altas expectativas de servicio. La prevalencia de problemas visuales va en aumento: el uso de lentes crece debido a la masificación de dispositivos tecnológicos que afectan la salud visual, y la demanda de lentes progresivos ha crecido significativamente, representando el 80% del mercado global (Gestión, 2025). Los pacientes de este segmento experimentan frustración ante demoras en la entrega, falta de comunicación sobre el estado de sus pedidos y errores en la fabricación. Aunque no interactúan directamente con el sistema, son los principales beneficiarios de la eficiencia operativa que OptiFlow genera: reciben notificaciones automatizadas, entregas puntuales y atención sin reprocesos.