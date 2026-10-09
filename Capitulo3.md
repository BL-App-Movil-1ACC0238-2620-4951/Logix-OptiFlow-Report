# Capítulo III: Solution UI/UX Design

## 3.1. Product design

El diseño del producto se plantea considerando las necesidades identificadas durante el análisis del dominio y de los usuarios, como la búsqueda de ópticas, consulta de disponibilidad, reserva de citas, seguimiento de pedidos, gestión de recetas ópticas y administración de información clínica y comercial. Se busca mantener una experiencia visual uniforme en las diferentes funcionalidades de la solución, utilizando elementos gráficos, componentes y patrones de interacción consistentes.

### 3.1.1. Style Guidelines


Las principales características consideradas para el diseño son:

* **Claridad:** la información debe presentarse de manera organizada y comprensible.
* **Consistencia:** los mismos componentes y acciones deben mantener un comportamiento y apariencia similares en toda la aplicación.
* **Simplicidad:** se debe evitar la sobrecarga visual y mostrar únicamente la información necesaria para cada contexto.
* **Accesibilidad:** los elementos deben contar con tamaños, contrastes y estructuras que faciliten su utilización.
* **Retroalimentación:** las acciones realizadas por el usuario deben mostrar estados o mensajes que indiquen si la operación fue exitosa, está en proceso o requiere alguna corrección.


#### 3.1.1.1. General Style Guidelines

 **Tipografía**

<p align="center">
  <img src="assets/cap3/styles/Tipografia.png">
</p>

La tipografía debe facilitar la lectura de la información presentada en OptiFlow, especialmente en elementos relacionados con citas, recetas ópticas, pedidos, órdenes de trabajo y registros de pacientes.

Se propone utilizar una tipografía **sans-serif**, debido a que permite una lectura clara tanto en dispositivos móviles como en interfaces administrativas.


| Elemento                | Uso                                               |
| ----------------------- | ------------------------------------------------- |
| Título principal (32px) | Identificar las principales secciones o pantallas |
| Subtítulo        (20px) | Describir subsecciones o grupos de información    |
| Texto principal  (16px) | Mostrar información y descripciones               |
| Texto secundario (14px) | Presentar información complementaria              |
| Texto de apoyo   (12px) | Mostrar etiquetas, estados o información auxiliar |


**Colores**

<p align="center">
  <img src="assets/cap3/styles/colores.png">
</p>


La paleta de colores debe transmitir una apariencia relacionada con los conceptos de **salud visual, confianza, claridad y tecnología**.

Se considera una paleta compuesta por colores principales, secundarios y colores destinados a comunicar estados del sistema.

| Elemento | Color actual | Uso |
| :---: | :---: | :---: |
| Primary | #212B93 | Encabezados, botones principales, bloques destacados |
| Secondary | #107194 | Botones secundarios, enlaces, elementos informativos |
| Accent / Mint | #6FF4BB | Botones destacados, selección, estados positivos |
| Background | #DFFBFF | Fondo general de las pantallas |
| Surface | #FFFFFF | Tarjetas, formularios y contenedores |
| Text | #1E1E1E | Texto principal |
| Secondary Text | #6B7280 | Texto secundario |
| Success | #6FF4BB | Confirmaciones y estados positivos |
| Error | #DC2626 | Errores y acciones críticas |

**Botones**

<p align="center">
  <img src="assets/cap3/styles/botones.png">
</p>

Los botones deben diferenciar claramente las acciones principales de las acciones secundarias.


* **Acción primaria:** utilizada para las acciones principales, como `Reservar cita`, `Confirmar` o `Guardar`.
* **Acción secundaria:** utilizada para acciones complementarias, como `Cancelar`, `Volver` o `Editar`.
* **Acción crítica:** utilizada para operaciones que pueden generar consecuencias importantes, como eliminar información.
* **Acción contextual:** utilizada para operaciones específicas dentro de tarjetas, tablas o registros.


**Tarjetas**

<p align="center">
  <img src="assets/cap3/styles/tarjetas.png">
</p>

En el caso de los pacientes, podrán utilizarse para presentar:

* Información de una óptica.
* Modelos de monturas.
* Disponibilidad de horarios.
* Próximas citas.
* Estado de pedidos.
* Información de recetas ópticas.

Para el personal de la óptica, las tarjetas podrán presentar:

* Resumen de citas.
* Pacientes pendientes de atención.
* Alertas de inventario.
* Órdenes de trabajo.
* Estados de producción.
* Indicadores de gestión.

**Iconografía**

<p align="center">
  <img src="assets/cap3/styles/iconos.png">
</p>

Los iconos se utilizarán como elementos complementarios para facilitar el reconocimiento de acciones y funcionalidades.

| Icono / representación | Funcionalidad              |
| ---------------------- | -------------------------- |
| Calendario             | Citas y disponibilidad     |
| Lupa                   | Búsqueda                   |
| Corazón                | Favoritos                  |
| Campana                | Notificaciones             |
| Usuario                | Perfil y pacientes         |
| Documento              | Receta o historial clínico |
| Caja                   | Pedidos                    |
| Lentes                 | Productos ópticos          |
| Alerta                 | Advertencias o incidencias |
| Ubicación              | Localización de ópticas    |

Los iconos no deberán utilizarse como único medio para comunicar información importante. Cuando sea necesario, deberán acompañarse de un texto descriptivo.

**Formularios**

<p align="center">
  <img src="assets/cap3/styles/formularios.png">
</p>

* Etiqueta del campo.
* Campo de entrada.
* Texto de ayuda cuando sea necesario.
* Mensaje de validación.
* Indicador de campo obligatorio cuando corresponda.

Las validaciones deberán mostrarse cerca del campo correspondiente para facilitar la corrección de errores. Por ejemplo, al realizar una reserva de cita, el sistema deberá indicar claramente la óptica, fecha, horario seleccionado y cualquier información necesaria antes de permitir la confirmación.

**Estados de la interfaz**

<p align="center">
  <img src="assets/cap3/styles/estados.png">
</p>

Los componentes de OptiFlow deberán contemplar diferentes estados para proporcionar retroalimentación al usuario.

| Estado   | Descripción                                                  |
| -------- | ------------------------------------------------------------ |
| Default  | Estado normal del componente                                 |
| Hover    | Estado al posicionar el cursor sobre un elemento interactivo |
| Active   | Estado durante la interacción                                |
| Disabled | Elemento temporalmente no disponible                         |
| Loading  | Información o proceso en proceso de carga                    |
| Success  | Operación realizada correctamente                            |
| Warning  | Situación que requiere atención                              |
| Error    | Operación incorrecta o información inválida                  |
| Empty    | No existen datos disponibles                                 |

**Diseño responsivo**

<p align="center">
  <img src="assets/cap3/styles/Diseño_Responsivo.png">
</p>

La interfaz deberá adaptarse a los diferentes tamaños de pantalla en los que se utilice OptiFlow. En la aplicación orientada a pacientes, el diseño priorizará dispositivos móviles, considerando:

* Controles táctiles de tamaño adecuado.
* Navegación sencilla.
* Contenido organizado verticalmente.
* Formularios adaptados a pantallas pequeñas.
* Información importante visible sin necesidad de desplazamientos excesivos.

En las interfaces destinadas al personal de la óptica se podrá aprovechar un espacio de pantalla mayor para mostrar tablas, indicadores, filtros y diferentes bloques de información simultáneamente.

**Accesibilidad**
<p align="center">
  <img src="assets/cap3/styles/accesibilidad.png">
</p>


El diseño deberá considerar principios básicos de accesibilidad para facilitar el uso de la aplicación por diferentes usuarios.

Se considerarán los siguientes aspectos:

* Contraste suficiente entre texto y fondo.
* Tamaños de texto legibles.
* Elementos interactivos claramente identificables.
* Mensajes de error comprensibles.
* No depender únicamente del color para comunicar estados.
* Uso de etiquetas descriptivas.
* Estructura visual consistente.

### 3.1.2. Information Architecture

La arquitectura de información de **OptiFlow** establece la forma en que se organiza, estructura y presenta la información dentro de la solución. Su objetivo es facilitar que los usuarios puedan encontrar rápidamente las funcionalidades y datos que necesitan de acuerdo con su rol y actividad dentro del sistema.

La arquitectura se define considerando los dos principales tipos de usuarios identificados: **pacientes** y **personal de la óptica**. Cada perfil dispone de funcionalidades específicas, evitando presentar información que no corresponda a sus necesidades.

#### 3.1.2.1. Organization Systems

El sistema de organización de OptiFlow define cómo se agrupan las funcionalidades y contenidos de acuerdo con el tipo de usuario, las tareas que realiza y el contexto en el que se encuentra.

Para ello, se utilizan principalmente los siguientes esquemas de organización:

* **Organización jerárquica:** permite establecer niveles de información desde las funcionalidades principales hacia sus opciones específicas.
* **Organización por categorías:** agrupa funcionalidades relacionadas con una misma actividad o dominio.
* **Organización secuencial:** organiza determinadas funcionalidades de acuerdo con el orden lógico en que deben ejecutarse.

**Organización jerárquica**

La estructura general de OptiFlow parte de las funcionalidades principales y posteriormente se divide en opciones específicas.

Para el **paciente**, la organización principal se plantea de la siguiente manera:

<p align="center">
  <img src="assets/cap3/organization/organizacion_paciente.png">
</p>

```text
OptiFlow
├── Inicio
├── Buscar óptica
│   ├── Ópticas disponibles
│   ├── Información de la óptica
│   ├── Catálogo de monturas
│   └── Disponibilidad
├── Citas
│   ├── Próximas citas
│   ├── Historial de citas
│   └── Reservar cita
├── Pedidos
│   ├── Pedidos activos
│   ├── Estado del pedido
│   └── Historial de pedidos
├── Receta
│   ├── Receta actual
│   └── Historial de recetas
├── Notificaciones
└── Perfil
    ├── Datos personales
    └── Preferencias
```

Para el **personal de la óptica**, la organización se adapta a las actividades administrativas, clínicas y operativas:

<p align="center">
  <img src="assets/cap3/organization/organizacion_personal.png">
</p>


```text
OptiFlow
├── Inicio
│   ├── Resumen
│   ├── Citas del día
│   ├── Alertas
│   └── Indicadores
├── Agenda
│   ├── Citas
│   └── Disponibilidad
├── Pacientes
│   ├── Registro de pacientes
│   ├── Historia clínica
│   └── Recetas ópticas
├── Ventas
│   ├── Cotizaciones
│   ├── Ventas
│   └── Comprobantes
├── Inventario
│   ├── Monturas
│   ├── Stock
│   ├── Proveedores
│   └── Alertas de stock
├── Órdenes de trabajo
│   ├── Órdenes pendientes
│   ├── Producción
│   ├── Control de calidad
│   └── Entregas
├── Notificaciones
└── Perfil
```

Esta separación permite que cada usuario tenga acceso a las funcionalidades correspondientes a sus responsabilidades.

**Organización por categorías**

Las funcionalidades también se agrupan según la actividad que representan.

| Categoría                     | Funcionalidades principales                               | Usuario             |
| ----------------------------- | --------------------------------------------------------- | ------------------- |
| Búsqueda y reserva            | Buscar ópticas, consultar disponibilidad y reservar citas | Paciente            |
| Gestión clínica               | Historia clínica, recetas y seguimiento del paciente      | Paciente / Personal |
| Gestión comercial             | Cotizaciones, ventas, pagos y comprobantes                | Personal            |
| Producción y seguimiento      | Órdenes de trabajo, producción, estados y entregas        | Personal            |
| Notificaciones y fidelización | Recordatorios, alertas, promociones y encuestas           | Paciente / Personal |
| Inventario                    | Monturas, stock, proveedores y alertas                    | Personal            |

Esta clasificación permite relacionar las funcionalidades de la interfaz con los principales procesos identificados durante el análisis del dominio.

**Organización secuencial**

Algunas funcionalidades de OptiFlow requieren que el usuario complete una serie de pasos en un orden determinado. Para la **reserva de una cita**, el flujo de información se organiza de la siguiente manera:

<p align="center">
  <img src="assets/cap3/organization/Flujo_paciente.png">
</p>


Para el **seguimiento de una orden de trabajo**, la información se presenta de acuerdo con el avance del proceso:

<p align="center">
  <img src="assets/cap3/organization/Flujo_personal.png">
</p>

Esta organización permite que el usuario comprenda en qué etapa se encuentra una actividad y cuáles son los siguientes pasos disponibles.

**Diagrama de organización de la información**

La estructura anterior puede representarse mediante un **diagrama de arquitectura de información o sitemap**, mostrando la relación entre las funcionalidades principales y sus subfuncionalidades.

<p align="center">
  <img src="assets/cap3/organization/Diagrama_organizacion.png">
</p>

#### 3.1.2.2. Labeling Systems

El sistema de etiquetado establece los nombres utilizados para identificar las funcionalidades, secciones, acciones y estados dentro de OptiFlow. Los nombres seleccionados buscan utilizar un lenguaje claro y familiar para los usuarios, evitando términos técnicos que puedan dificultar la comprensión de las funcionalidades.


**Etiquetas principales**

| Etiqueta           | Descripción                                                | Usuario             |
| ------------------ | ---------------------------------------------------------- | ------------------- |
| Inicio             | Acceso a la información principal y resumen de actividades | Paciente / Personal |
| Buscar óptica      | Permite encontrar ópticas disponibles                      | Paciente            |
| Reservar cita      | Permite seleccionar y confirmar una cita                   | Paciente            |
| Mis citas          | Permite consultar las citas registradas                    | Paciente            |
| Mis pedidos        | Permite consultar el estado de los pedidos                 | Paciente            |
| Mi receta          | Permite consultar la receta óptica registrada              | Paciente            |
| Notificaciones     | Permite consultar avisos y actualizaciones                 | Paciente / Personal |
| Perfil             | Permite consultar y modificar información personal         | Paciente / Personal |
| Agenda             | Permite administrar las citas de la óptica                 | Personal            |
| Pacientes          | Permite gestionar la información de los pacientes          | Personal            |
| Historia clínica   | Permite consultar información clínica del paciente         | Personal            |
| Recetas ópticas    | Permite registrar y consultar recetas                      | Personal            |
| Ventas             | Permite gestionar las operaciones comerciales              | Personal            |
| Cotizaciones       | Permite gestionar cotizaciones para los pacientes          | Personal            |
| Inventario         | Permite administrar productos y existencias                | Personal            |
| Órdenes de trabajo | Permite gestionar el proceso de producción                 | Personal            |
| Alertas de stock   | Informa sobre productos con existencias bajas              | Personal            |

**Etiquetas para acciones**

Las acciones utilizarán verbos directos que indiquen claramente la operación que realizará el usuario.

| Acción       | Uso                                                 |
| ------------ | --------------------------------------------------- |
| Buscar       | Realizar una búsqueda                               |
| Filtrar      | Reducir los resultados según determinados criterios |
| Ver detalles | Consultar información adicional                     |
| Reservar     | Registrar una cita                                  |
| Confirmar    | Confirmar una operación                             |
| Cancelar     | Cancelar una operación                              |
| Guardar      | Registrar cambios                                   |
| Editar       | Modificar información                               |
| Eliminar     | Remover información                                 |
| Descargar    | Obtener un documento o información                  |
| Continuar    | Avanzar al siguiente paso                           |
| Volver       | Regresar al paso anterior                           |

**Etiquetas para estados**

Los estados de los procesos también deberán mantener una nomenclatura consistente.

| Estado             | Aplicación                                 |
| ------------------ | ------------------------------------------ |
| Pendiente          | Actividad que todavía no ha sido atendida  |
| Confirmada         | Cita u operación confirmada                |
| En proceso         | Actividad actualmente en ejecución         |
| En producción      | Orden que se encuentra en fabricación      |
| Lista para entrega | Pedido que puede ser entregado al paciente |
| Entregada          | Pedido completado y entregado              |
| Cancelada          | Operación cancelada                        |
| Retrasada          | Proceso que presenta un retraso            |
| Completada         | Actividad finalizada correctamente         |

El uso de etiquetas consistentes permite que los usuarios puedan reconocer rápidamente las funcionalidades y estados del sistema. Además, evita utilizar diferentes nombres para representar un mismo concepto dentro de las distintas pantallas.

##### 3.1.2.3. SEO Tags and Meta Tags

Las etiquetas SEO y meta etiquetas de OptiFlow se aplicarán principalmente a la **Landing Page**, debido a que esta constituye el principal punto de acceso público a la solución. Su finalidad es facilitar la identificación del producto por los motores de búsqueda y proporcionar información relevante sobre el contenido de la página.

Las etiquetas se plantean considerando el propósito de como una solución orientada a la gestión de citas, ópticas, pacientes y seguimiento de pedidos.

| Elemento | Propuesta |
|---|---|
| **Title** | OptiFlow - Gestión de citas y servicios ópticos |
| **Meta Description** | OptiFlow facilita la búsqueda de ópticas, reserva de citas y seguimiento de pedidos en un solo lugar. |
| **Keywords** | ópticas, citas ópticas, reserva de citas, gestión óptica, pacientes, recetas ópticas, seguimiento de pedidos |
| **Robots** | `index, follow` |
| **Open Graph Title** | OptiFlow - Gestión de citas y servicios ópticos |
| **Open Graph Description** | Encuentra ópticas, reserva citas y realiza el seguimiento de tus pedidos mediante OptiFlow. |
| **Open Graph Type** | `website` |

El **Title** permite identificar el propósito principal de la plataforma en los resultados de búsqueda, mientras que la **Meta Description** proporciona una descripción breve de los servicios ofrecidos. Las palabras clave propuestas se relacionan con las principales funcionalidades y conceptos del sistema, como la búsqueda de ópticas, reserva de citas, gestión de pacientes y seguimiento de pedidos.

Por otro lado, las etiquetas **Open Graph** permiten definir la información que se mostrará cuando la Landing Page sea compartida mediante plataformas y redes sociales. La configuración de `robots` mediante `index, follow` permitirá que los motores de búsqueda puedan redirigir la Landing Page y seguir los enlaces disponibles en ella.

##### 3.1.2.4. Searching Systems

El sistema de búsqueda de OptiFlow permite al paciente localizar ópticas de acuerdo con diferentes criterios y consultar rápidamente su disponibilidad. La interfaz está diseñada para facilitar la búsqueda desde un dispositivo móvil, mostrando los resultados de manera clara y priorizando la información necesaria para seleccionar una óptica.

La pantalla de búsqueda cuenta con una barra que permite ingresar diferentes criterios relacionados con la óptica, como el nombre, dirección o estilo. Además, se presentan accesos rápidos para facilitar la búsqueda según las necesidades del usuario.

Entre los principales elementos del sistema se encuentran:

- **Barra de búsqueda:** permite ingresar términos relacionados con la óptica que se desea encontrar.
- **Búsqueda por montura:** permite iniciar una búsqueda a partir del modelo de montura que desea encontrar el paciente.
- **Filtros rápidos:** permiten consultar ópticas cercanas, establecimientos abiertos o aquellos con disponibilidad en la primera hora.
- **Mapa:** presenta visualmente la ubicación de las ópticas disponibles.
- **Resultados cercanos:** muestra las ópticas encontradas junto con información relevante como horario disponible, distancia y servicios ofrecidos.
- **Acceso a detalles:** permite seleccionar una óptica para consultar información adicional y continuar con el proceso de reserva.

El flujo general de búsqueda se representa de la siguiente manera:

```text
Ingresar criterio de búsqueda
            ↓
Mostrar ópticas disponibles
            ↓
Aplicar filtro de búsqueda
            ↓
Consultar resultados cercanos
            ↓
Seleccionar óptica
            ↓
Consultar información y disponibilidad
```

Figura Buscar Optica. Interfaz del sistema de búsqueda de ópticas.

<p align="center">
  <img src="assets/cap3/organization/buscar_optica.png">
</p> 

##### 3.1.2.5. Navigation Systems

El sistema de navegación de OptiFlow permite que los usuarios accedan de manera rápida a las principales funcionalidades de la aplicación. La navegación se organiza de acuerdo con las necesidades del paciente, priorizando el acceso a las funcionalidades utilizadas con mayor frecuencia.

Para la aplicación móvil del paciente se utiliza una **barra de navegación inferior**, ubicada de manera permanente en la parte inferior de la pantalla. Este patrón permite acceder a las secciones principales sin necesidad de regresar constantemente a la pantalla de inicio.

La navegación principal está compuesta por las siguientes opciones:

| Opción | Funcionalidad |
|---|---|
| **Inicio** | Permite acceder a la pantalla principal y consultar información relevante para el paciente. |
| **Buscar** | Permite buscar ópticas, consultar resultados cercanos y utilizar filtros de búsqueda. |
| **Citas** | Permite consultar y gestionar las citas del paciente. |
| **Receta** | Permite consultar la receta óptica registrada y su información asociada. |
| **Perfil** | Permite consultar y administrar la información personal y preferencias del usuario. |

La navegación principal en nuestra app visualmente:

<p align="center">
  <img src="assets/cap3/navigation/pantalla_inicio.png">
</p> 


### 3.1.3. Landing Page UI Design

El landing page juega un papel esencial en atraer la atención de los propietarios de pequeñas y medianas ópticas (PYMEs ópticas) y sus pacientes. En este apartado, se muestra el diseño de la interfaz de usuario del landing page de Optiflow, enfocándose en los elementos clave que optimizan la experiencia del usuario y creando una página interactiva, intuitiva y fácil de usar.

#### 3.1.3.1. Landing Page Wireframe

En este conjunto de wireframes, se definen la jerarquía de contenido, la navegación y las áreas principales de interacción de la página, estructuradas para comunicar claramente la propuesta de valor dual de Optiflow.

Presentación inical de OptiFlow con datos de impacto y un lema.

![Landing page inicio.png](assets/cap3/wireframes/wireframe_landing_1.png)

Se muestra los objetivos y beneficios de OPiflow.

![Landing page mision.png](assets/cap3/wireframes/wireframe_landing_2.png)

Se muestra los precios y los integrantes.

![Landing page precios.png](assets/cap3/wireframes/wireframe_landing_3.png)

Se muestra las reseñas de las personas que interactuaron con la página y la vista final.

![Landing page reseñas.png](assets/cap3/wireframes/wireframe_landing_4.png)

#### 3.1.3.2. Landing Page Mock-up

Esta interfaz final consolida la identidad de la plataforma, transmitiendo profesionalismo, innovación y confianza hacia los administradores de PYMEs ópticas y los pacientes.

![Landing page mockup.png](assets/cap3/mockups/Landing%20page%20mockup.png)

### 3.1.4. Mobile Applications UX/UI Design

El diseño de la experiencia y la interfaz de usuario (UX/UI) de la aplicación móvil de Optiflow constituye el pilar fundamental para la interacción directa con los pacientes y clientes finales del sector de la salud visual.

#### 3.1.4.1. Mobile Applications Wireframes

Los wireframes móviles establecen la estructura esquelética, la distribución funcional de componentes y la jerarquía de contenidos en la interfaz del dispositivo móvil antes de la integración del sistema visual definitivo.

**Sección Autenticación y Selección de Rol**

![Wireframes del flujo de inicio de sesión y selección de rol.](assets/cap3/wireframe-movil/registro.png)

El contenedor central implementa un conmutador de navegación segmentada para alternar entre "Iniciar sesión" y "Registrarme". A continuación, se disponen tarjetas interactivas de selección de rol ("Paciente: Mis citas, receta y monturas" y "Personal clínico: Catálogo, agenda y pacientes"). La base del contenedor organiza los campos de entrada de datos para correo electrónico y contraseña (con botón de visibilidad y enlace de recuperación "¿Olvidaste tu contraseña?"), finalizando con el botón de acción principal de ancho completo ("Entrar a mi cuenta").

**Sección Inicio y Consulta de Receta Óptica (Paciente)**

![Wireframes de pantalla de inicio del paciente y ficha de receta óptica.](assets/cap3/wireframe-movil/receta.png)

La primera pantalla (dashboard inicial) muestra un banner de prueba virtual interactiva con cámara de Realidad Aumentada (AR), un widget de resumen con la próxima cita confirmada, botones de acceso rápido ("Mis recetas", "Mis pedidos", "Historial"). La segunda y tercera pantalla estructuran el visor y editor de la receta médica, organizando en una tabla clínica, diagnósticos asociados, cotas dimensionales de montura, observaciones del oftalmólogo tratante y botón para actualizar o guardar prescripción.

**Sección Búsqueda y Exploración de Monturas (Paciente)**

![Wireframes del módulo de búsqueda y catálogo de armazones.](assets/cap3/wireframe-movil/buscar.png)

Esta imagen muestra el flujo de localización de ópticas y descubrimiento de armazones en cuatro vistas. La pantalla inicial presenta una barra de búsqueda multifunción, accesos rápidos de filtrado y un bloque de mapa geolocalizado con lista de resultados cercanos que detallan distancias y horarios disponibles. Finalmente, las pantallas de detalle despliegan el carrusel de imágenes del producto, especificaciones técnicas (materiales, dimensiones, estilo unisex), disponibilidad de stock físico inmediato y el botón de acción para localizar las ópticas más cercanas con existencia en tienda.

**Sección Gestión y Reserva de Citas (Paciente)**

![Wireframes del flujo de gestión, reprogramación y reserva de citas.](assets/cap3/wireframe-movil/citas_paciente.png)

Esta imagen detalla el flujo integral de agendamiento y control de citas médicas en siete pantallas secuenciales. Inicia con la vista "Mis citas", seguida del detalle de cita con información del profesional tratante, sede y recordatorios. El proceso de nueva reserva se guía mediante un indicador de pasos superior (stepper del 1 al 4).

**Sección Seguimiento de Pedidos y Montaje (Paciente)**

![Wireframes del módulo de seguimiento de pedidos en taller y entrega.](assets/cap3/wireframe-movil/pedido.png)

La primera pantalla ofrece un selector de estado ("En curso" y "Entregados") y una tarjeta de pedido activo con barra de progreso segmentada y fecha estimada de entrega. La segunda pantalla expone el detalle del pedido mediante una línea de tiempo vertical (stepper de seguimiento) que refleja en tiempo real los hitos de fabricación.

**Sección Perfil de Usuario, Historial y Configuración (Paciente)**

![Wireframes del perfil de paciente, historial clínico y panel de ajustes.](assets/cap3/wireframe-movil/perfil.png)

Esta imagen ilustra la gestión de cuenta y antecedentes médicos del paciente distribuida en cuatro pantallas.

**Sección Directorio Clínico y Ficha del Paciente (Personal Óptico)**

![Wireframes del directorio de pacientes, ficha médica, refracción y orden de trabajo.](assets/cap3/wireframe-movil/paciente.png)

Esta imagen detalla el flujo de trabajo clínico del optómetra y asesor de óptica en seis pantallas. Inicia con el directorio clínico de expedientes con métricas de resumen (total de pacientes, nuevos del mes, fichas en taller), buscador y filtros por estado. Continúa con el formulario modal de registro rápido de nuevo cliente con datos demográficos y motivo de consulta. Las pantallas clínicas finales estructuran la evaluación visual y la pantalla de confirmación de venta y pago registrado.

**Sección Agenda y Control de Atención Clínica (Personal Óptico)**

![Wireframes de la agenda diaria, control de sala de espera y flujo de atención.](assets/cap3/wireframe-movil/citas_optica.png)

Esta imagen exhibe la interfaz operativa para la administración de turnos y consultas en cuatro vistas. Las dos primeras pantallas muestran la agenda diaria con métricas de pacientes citados, calendario de días hábiles, filtros de estado (En espera, Confirmadas, Retiros). La tercera pantalla estructura el formulario de agendamiento manual de citas. La cuarta pantalla presenta la herramienta de actualización del estado de consulta en tiempo real con campo para notas de transición.

**Sección Control de Stock e Inventario (Personal Óptico)**

![Wireframes de gestión de inventario, escáner de códigos y ajuste de existencias.](assets/cap3/wireframe-movil/inventario.png)

Esta imagen presenta la arquitectura de administración física de existencias en cinco pantallas interactivas. El panel principal resume las métricas de stock en vitrina y productos en taller/laboratorio. La segunda pantalla habilita el escáner de productos mediante cámara para lectura instantánea de códigos de barras o QR. La tercera pantalla desglosa la ficha de producto con galería fotográfica, precios y especificaciones. La cuarta pantalla detalla la distribución de stock multisede. La última pantalla proporciona el formulario para registrar nuevos movimientos.

**Sección Operaciones, Producción y Reportes (Personal Óptico)**

![Wireframes del centro de herramientas, cotizaciones, taller de producción y reportes.](assets/cap3/wireframe-movil/herramientas.png)

Esta imagen expone las herramientas operativas y analíticas de la óptica organizadas en seis pantallas. El flujo operativo incluye la pantalla de confirmación de venta con desglose económico y fecha estimada de entrega, la interfaz de creación de nuevas cotizaciones con vinculación a recetas vigentes, y el tablero Kanban de control de producción en taller con etapas segmentadas. Finalmente, se presenta el centro de alertas operativas el módulo de analítica y reportes con gráficas de barras de facturación mensual, volumen de atenciones e indicadores de rendimiento comercial.

#### 3.1.4.2. Mobile Applications Wireflow Diagrams

Un wireflow o flujo de pantalla es un diagrama donde se reúnen distintos wireframes realizados cuya finalidad es contar las metas del usuario con la aplicación y cómo las consiguen. Los pasos para la creación de cada diagrama empiezan por la definición de un objetivo que el usuario desea cumplir. Luego, se define el flujo de tareas que deben ser realizadas por el usuario en la aplicación para conseguir dicho objetivo. Y, finalmente, se traducen dichas tareas en pantallas de baja fidelidad (wireframes), trazando los conectores de navegación, puntos de decisión y disparadores de interacción entre los diferentes estados de la interfaz.

A continuación, se presentan los wireflow diagrams desarrollados para los flujos clave de la aplicación móvil de OptiFlow:

**User Goal 1: Usuario (Paciente o Personal Clínico) desea registrarse o iniciar sesión en su cuenta**

Primero, se definen las tareas típicas que realizaría el usuario para completar este objetivo:
- Abrir la aplicación móvil y seleccionar la modalidad de acceso (Iniciar sesión o Registrarse).
- Elegir el perfil correspondiente (Paciente o Personal Clínico).
- Introducir las credenciales requeridas (correo electrónico y contraseña) o completar los campos de registro.
- Validar la información ingresada y confirmar el acceso al dashboard principal de la cuenta.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow de ingreso o registro de usuario.](assets/cap3/wireflow/wireflow_INGRESO%20O%20REGISTRO.png)

A continuación, en este flujo se ilustra el proceso de autenticación y enrolamiento en la plataforma OptiFlow, permitiendo al usuario navegar entre las vistas de login y registro según su rol, gestionar la recuperación de credenciales y acceder a la experiencia personalizada de la aplicación.

**User Goal 2: Personal clínico u óptico desea registrar a un nuevo paciente en el sistema**

Primero, se definen las tareas típicas que realizaría el personal para completar este objetivo:
- Ingresar al módulo del directorio de pacientes desde la navegación principal.
- Seleccionar la acción para agregar un nuevo paciente.
- Completar el formulario clínico con datos personales, número de identificación, contacto y motivo de consulta inicial.
- Guardar la ficha del paciente y verificar su inclusión en la base de datos para futuras atenciones y refracciones.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow de registro de nuevo paciente.](assets/cap3/wireflow/wireflow_REGISTRO%20NUEVO%20PACIENTE.png)

A continuación, en este flujo se observa el recorrido del personal óptico para dar de alta a un paciente de manera ágil, validando los campos obligatorios del expediente clínico y dejando la ficha lista para asociarle citas o recetas.

**User Goal 3: Usuario desea agendar una nueva cita de evaluación visual u optometría**

Primero, se definen las tareas típicas que realizaría el usuario para completar este objetivo:
- Acceder a la sección de agendamiento o gestión de citas.
- Seleccionar el tipo de atención (examen visual, control de lentes, consulta oftalmológica) y la sede óptica de preferencia.
- Escoger al especialista disponible, así como la fecha y franja horaria idónea mediante el calendario interactivo.
- Revisar el resumen de la reserva y confirmar el agendamiento con emisión de comprobante y recordatorio.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow de registro de nueva cita.](assets/cap3/wireflow/wireflow_REGISTRO%20DE%20NUEVA%20CITA.png)

A continuación, en este flujo se detalla el proceso paso a paso (stepper) mediante el cual el usuario concreta una reserva de cita médica, visualizando la disponibilidad en tiempo real y asegurando el turno correspondiente.

**User Goal 4: Personal óptico desea programar una cita directamente desde la tarjeta de un paciente**

Primero, se definen las tareas típicas que realizaría el personal para completar este objetivo:
- Buscar y abrir el perfil o ficha médica del paciente en el directorio.
- Pulsar la acción rápida de agendar nueva cita vinculada al expediente activo.
- Seleccionar la sede, especialidad médica y horario sin necesidad de reingresar la información del paciente.
- Confirmar la reserva y verificar la actualización automática en el historial de citas del paciente.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow de nueva cita desde la tarjeta de un cliente.](assets/cap3/wireflow/wireflow_NUEVA%20CITA%20DESDE%20LA%20TARJETA%20DE%20UN%20CLIENTE.png)

A continuación, en este flujo se presenta la optimización del flujo de recepción y atención clínica, permitiendo al asesor agendar visitas recurrentes o controles posventa directamente desde la ficha activa del cliente.

**User Goal 5: Optómetra o especialista desea registrar la atención clínica y la prescripción óptica**

Primero, se definen las tareas típicas que realizaría el especialista para completar este objetivo:
- Seleccionar al paciente desde la lista de citas del día e iniciar la consulta médica.
- Registrar los datos del examen visual y refracción (esfera, cilindro, eje, adición, distancia pupilar para ambos ojos).
- Añadir observaciones de diagnóstico clínico, recomendaciones de uso y especificaciones técnicas de lentes/monturas.
- Guardar la prescripción y generar la orden de trabajo clínica correspondiente para su derivación a taller o venta.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow del proceso de atención a paciente.](assets/cap3/wireflow/wireflow_PROCESO%20DE%20ATENCION%20A%20PACIENTE.png)

A continuación, en este flujo se describe la interacción técnica del profesional de la salud visual en cabina, asegurando la captura integral de los parámetros refractivos y la emisión digital de la receta médica.

**User Goal 6: Personal de taller o asesor desea verificar y actualizar el estado de producción de los lentes**

Primero, se definen las tareas típicas que realizaría el usuario para completar este objetivo:
- Ingresar al módulo de taller o control de producción desde las herramientas operativas.
- Localizar la orden de trabajo mediante el número de pedido o los datos del paciente.
- Comprobar la etapa técnica actual del trabajo (corte de lunas, biselado, tratamiento antirreflejante, montaje, control de calidad).
- Actualizar el estado de la orden hacia "Listo para entrega" y notificar la disponibilidad del producto.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow de verificación del proceso de producción de los lentes del cliente.](assets/cap3/wireflow/wireflow_VERIFICACION%20DEL%20PROCESO%20DE%20PRODUCCION%20DE%20LOS%20LENTES%20DEL%20CLIENTE.png)

A continuación, en este flujo se expone el seguimiento técnico de fabricación y ensamblaje óptico en laboratorio, garantizando la trazabilidad de cada fase del pedido hasta su liberación final.

**User Goal 7: Paciente desea explorar el catálogo de monturas y reservar armazones en una óptica cercana**

Primero, se definen las tareas típicas que realizaría el paciente para completar este objetivo:
- Ingresar a la sección de catálogo y búsqueda de productos.
- Filtrar por marca, material, forma de armazón, rango de precio o sedes con disponibilidad.
- Visualizar el detalle técnico de la montura seleccionada (dimensiones, colores, stock en tiempo real).
- Seleccionar la opción de reserva física en tienda o vincular el armazón a su próxima cita presencial.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow de catálogo y reserva de monturas.](assets/cap3/wireflow/Wireflow%20%C2%B7%20Cat%C3%A1logo%20y%20reserva.png)

A continuación, en este flujo se muestra la experiencia omnicanal del paciente, quien explora el catálogo digital de armazones y concreta la reserva en la sede óptica más conveniente.

**User Goal 8: Paciente desea consultar el estado y avance de sus pedidos de lentes**

Primero, se definen las tareas típicas que realizaría el paciente para completar este objetivo:
- Acceder al apartado de "Mis Pedidos" desde el menú principal o su perfil de usuario.
- Seleccionar el pedido activo para revisar el resumen de compra y la fecha estimada de entrega.
- Visualizar la línea de tiempo de seguimiento (en laboratorio, biselado, control de calidad, disponible para retiro).
- Consultar los detalles de la sede de recojo o comunicarse con soporte ante dudas sobre su entrega.

Luego, se muestra el resultado de la traducción de las acciones a pantallas:

![Wireflow de consulta de pedidos.](assets/cap3/wireflow/Wireflow%20%C2%B7%20Consulta%20de%20pedidos.png)

A continuación, en este flujo se refleja la transparencia del servicio posventa, permitiendo al cliente conocer en todo momento el avance de confección de sus lentes y el momento exacto para su recojo.

#### 3.1.4.3. Mobile Applications Mock-ups



#### 3.1.4.4. Mobile Applications User Flow Diagrams



#### 3.1.4.5 Mobile Applications Prototyping



