# Capítulo IV: Product Implementation & Validation

## 4. Product Implementation & Validation

### 4.1. Software Configuration Management

#### 4.1.1. Software Development Environment Configuration

Esta sección presenta las herramientas que el equipo utiliza para colaborar durante el ciclo de vida de la solución, junto con el propósito de uso de cada una.

##### Figma

![Logo de Figma](assets/cap4/ExternalAppsForDesign/figma%20lockup.png)

Se utiliza para definir el diseño de la Landing Page y de la aplicación móvil: wireframes, mock-ups y prototipo interactivo con la simulación de navegación entre pantallas.

Ruta de referencia: https://www.figma.com

##### Android Studio

![android-studio-logo.png](assets/cap4/ExternalAppsForDesign/android-studio-logo.png)

Es el entorno de desarrollo integrado (IDE) para la programación de la aplicación móvil. Además, se emplean el Android SDK, Gradle para la gestión de dependencias y la compilación, el Android Emulator para pruebas durante el desarrollo y un dispositivo físico con depuración USB para validar el funcionamiento real de la aplicación.

Ruta de descarga: https://developer.android.com/studio

##### Docker

![docker logo.png](assets/cap4/ExternalAppsForDesign/docker%20logo.png)

Se utiliza para empaquetar en contenedores el backend (Web Services) y la Landing Page, de modo que el despliegue sea reproducible y no dependa de la configuración de cada equipo.

Ruta de descarga: https://www.docker.com/products/docker-desktop

##### Structurizr

![structurizr logo.png](assets/cap4/ExternalAppsForDesign/structurizr%20logo.png)

Se utiliza para elaborar los diagramas de arquitectura de software del Modelo C4 (Context, Container, Component y Deployment).

Ruta de referencia: https://structurizr.com

##### Miro

![miro logo.png](assets/cap4/ExternalAppsForDesign/miro%20logo.png)

Se utiliza como pizarra colaborativa para las sesiones de EventStorming: Big Picture, Candidate Context Discovery y modelado de Domain Message Flows.

Ruta de referencia: https://miro.com

#### 4.1.2. Source Code Management

El equipo utiliza **GitHub** como plataforma de alojamiento y sistema de control de versiones. Los repositorios del proyecto son públicos y están organizados dentro de la organización [nombre de la organización], lo que permite evidenciar mediante commits el aporte de cada integrante.

##### Repositorios del proyecto

| Producto | Repositorio |
|---|---|
| Informe del proyecto | [URL] |
| Landing Page | [URL] |
| Web Services | [URL] |
| Aplicación móvil | [URL] |

##### Flujo de trabajo con GitFlow

Se adoptó **GitFlow** como flujo de trabajo para organizar el desarrollo en ramas con responsabilidades definidas:

| Rama | Propósito | Convención de nombre |
|---|---|---|
| `main` | Contiene las versiones estables y publicadas del producto. | `main` |
| `develop` | Rama de integración donde se reúnen las funcionalidades terminadas. | `develop` |
| `feature/*` | Desarrollo de cada funcionalidad o User Story en su propia rama. | `feature/<descripcion-en-ingles>`, por ejemplo `feature/login-screen` |
| `release/*` | Preparación de una nueva versión antes de publicarla. | `release/<version>`, por ejemplo `release/1.0.0` |
| `hotfix/*` | Corrección urgente de errores detectados en `main`. | `hotfix/<descripcion-en-ingles>`, por ejemplo `hotfix/fix-token-validation` |

Los cambios se integran mediante **Pull Requests** hacia la rama `develop`, de modo que cada modificación sea revisada por otro integrante antes de incorporarse.

Los mensajes de commit siguen **Conventional Commits**, con el formato `<tipo>: <descripción en inglés>`. Los tipos utilizados son:

- `feat/feature`: nueva funcionalidad.
- `fix`: corrección de un error.
- `docs`: cambios en la documentación.

#### 4.1.3. Source Code Style Guide & Conventions

Para mantener un código consistente, legible y fácil de mantener por todos los integrantes, el equipo adopta guías de estilo estándar para cada lenguaje utilizado en la solución. Todos los nombres de clases, funciones, variables, archivos, ramas y mensajes de commit se escriben en **inglés**, independientemente del idioma de la documentación.

##### Guías de estilo por lenguaje

| Lenguaje | Producto | Guía adoptada |
|---|---|---|
| Kotlin | Aplicación móvil | [Kotlin Coding Conventions](https://kotlinlang.org/docs/coding-conventions.html) |
| Java | Web Services | [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html) |
| HTML, CSS y JavaScript | Landing Page | [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html) |
| Gherkin | Archivos `.feature` de pruebas de aceptación | [Gherkin Conventions for Readable Specifications](https://specflow.org/gherkin/gherkin-conventions-for-readablespecifications/) |

##### Convenciones de nomenclatura

| Elemento | Convención | Ejemplo |
|---|---|---|
| Clases, interfaces y enumeraciones | `PascalCase` | `AppointmentRepository` |
| Funciones, métodos y variables | `camelCase` | `getUpcomingAppointments` |
| Constantes | `UPPER_SNAKE_CASE` | `MAX_RETRY_COUNT` |
| Paquetes | minúsculas, sin guiones bajos | `com.optiflow.booking` |
| Archivos CSS y de la Landing Page | `kebab-case` | `main-header.css` |
| Archivos `.feature` | `snake_case` o `kebab-case` en inglés | `book-appointment.feature` |

##### Organización del código

El código se organiza siguiendo las capas de Domain-Driven Design definidas en el Capítulo II (Domain, Application, Interface e Infrastructure), de modo que cada clase se ubique en el paquete que corresponde a su responsabilidad.

#### 4.1.4. Software Deployment Configuration
[VERSION PRELIMINAR]

Esta sección describe la configuración necesaria para desplegar cada producto digital de la solución a partir de su repositorio de código fuente: la Landing Page, los Web Services y la aplicación móvil. El despliegue de la Landing Page y del backend se apoya en **Docker**, mientras que la aplicación móvil se distribuye mediante **Firebase App Distribution**.

##### Landing Page

1. Se parte de la rama `main` del repositorio de la Landing Page.
2. Se construye una imagen de Docker que sirve los archivos estáticos (HTML, CSS y JavaScript) mediante un servidor web [Nginx u otro].
3. La imagen se publica en [registro de imágenes, por ejemplo Docker Hub o GitHub Container Registry].
4. El contenedor se despliega en [proveedor de hosting] y queda accesible en [URL pública].

##### Web Services

1. Se parte de la rama `main` del repositorio de los Web Services.
2. Se compila el proyecto y se construye la imagen de Docker a partir del `Dockerfile` del repositorio.
3. La imagen se publica en [registro de imágenes].
4. Se despliega el contenedor en [proveedor cloud], configurando como variables de entorno los datos sensibles (credenciales de las bases de datos PostgreSQL y MongoDB, claves de servicios externos), sin incluirlos en el repositorio.
5. Se verifica el despliegue accediendo a la documentación OpenAPI/Swagger publicada en [URL de Swagger].

##### Aplicación móvil

1. Se parte de la rama `main` del repositorio de la aplicación.
2. En Android Studio se genera el archivo de instalación (APK o Android App Bundle) firmado.
3. El archivo se sube a **Firebase App Distribution** en el proyecto de Firebase del equipo.
4. Se invita por correo electrónico a los evaluadores, quienes reciben el enlace y pueden instalar la aplicación en sus dispositivos.
5. Para las demostraciones, la aplicación se instala previamente en un dispositivo físico.

##### Deployment Diagram

El siguiente Deployment Diagram del Modelo C4, elaborado en Structurizr, muestra cómo se distribuyen los contenedores de software sobre la infraestructura: [descripción breve de los nodos, por ejemplo el servidor del backend, las bases de datos, el hosting de la Landing Page y Firebase].

![Deployment Diagram](assets/cap4/deployment-diagram.svg)

## 4.2. Landing Page & Mobile Application Implementation
### 4.2.1. Sprint 1
Durante el Sprint 1, el equipo de OptiFlow inició la etapa de implementación de los productos digitales de la solución. El objetivo de esta primera iteración consiste en establecer una primera presencia funcional del producto mediante el Landing Page y avanzar en los primeros flujos orientados al paciente, específicamente la búsqueda de ópticas y la reserva de citas para atención optométrica.

El trabajo del Sprint se organiza mediante reuniones virtuales realizadas a través de Discord, seguimiento de actividades mediante el Sprint Backlog y control de versiones a través de los repositorios de GitHub de la organización del equipo.

Con fecha de revisión del 2026-10-07, los historiales locales contienen avances de implementación de la Landing Page, los Web Services y la aplicación móvil. El alcance funcional documentado en esta sección se concentra en US05 y US06; las funcionalidades adicionales presentes en los repositorios no se consideran automáticamente parte del compromiso del Sprint.
#### 4.2.1.1. Sprint Planning 1
El Sprint Planning 1 tuvo como finalidad establecer el objetivo de la primera iteración, seleccionar las User Stories que contribuyen directamente a dicho objetivo, determinar la capacidad inicial del equipo y distribuir las principales responsabilidades de implementación.

La reunión se realizó de manera virtual mediante Discord y fue preparada por Celis Berrospi, Eslander. Debido a que Sprint 1 representa la primera iteración de implementación de la solución, no existe un Sprint anterior sobre el cual realizar un Sprint Review o Sprint Retrospective formal.

| Sprint # | Sprint 1 |
| :--- | :--- |
| **Sprint Planning Background** | |
| **Date** | 2026-09-28 |
| **Time** | 07:00 PM |
| **Location** | Discord |
| **Prepared By** | Celis Berrospi, Eslander |
| **Attendees (to planning meeting)** | Atoche Gonzales, Nicolas Fernando / Becerra Ttito, Felix Orlando / Celis Berrospi, Eslander / Morocho Pinedo, Mariana / Quispe Llacsahuanga, César Agusto |
| **Sprint 0 Review Summary** | No aplica, debido a que Sprint 1 corresponde a la primera iteración de implementación de OptiFlow. Antes del inicio de este Sprint, el equipo desarrolló las actividades de investigación, análisis de los segmentos objetivo, especificación de requisitos, Domain-Driven Design, arquitectura de software y diseño UX/UI que sirven como base para la implementación del producto. |
| **Sprint 0 Retrospective Summary** | No se realizó una retrospectiva formal debido a que no existió un Sprint de implementación anterior. Sin embargo, a partir del trabajo realizado durante las etapas previas, el equipo identificó la necesidad de distribuir claramente las responsabilidades, dividir el trabajo en tareas de corta duración, mantener una comunicación constante mediante Discord y conservar la trazabilidad del desarrollo mediante GitHub. |
| **Sprint Goal & User Stories** | |
| **Sprint 1 Goal** | Nuestro enfoque consiste en ofrecer a los pacientes una primera experiencia integrada para encontrar ópticas y programar una atención optométrica, junto con una Landing Page que comunique la propuesta de valor de OptiFlow. Consideramos que este incremento facilitará la consulta de establecimientos y la organización de citas. El cumplimiento se verificará cuando un paciente pueda consultar ópticas, seleccionar un horario disponible y obtener la confirmación de su reserva desde la aplicación móvil; cuando el servicio rechace una segunda reserva del mismo horario; y cuando las secciones y la navegación de la Landing Page puedan demostrarse en escritorio y móvil. |
| **Sprint 1 Velocity** | 13 Story Points de capacidad planificada, según el registro inicial del equipo. |
| **Sum of Story Points** | 13 Story Points: US05 (5) y US06 (8), según el Product Backlog del Capítulo II. |

El alcance estimado en Story Points corresponde a US05 y US06. Las actividades de la Landing Page se incluyen como tareas adicionales. El registro e inicio de sesión del paciente permiten ejecutar la reserva; se documentan como soporte a este flujo y se distinguen de US01, cuyo actor en el Product Backlog es el personal de la óptica.

#### 4.2.1.2. Aspect Leaders and Collaborators
Para organizar las responsabilidades del Sprint se establece una Leadership-and-Collaboration Matrix (LACX). La matriz identifica al integrante responsable de liderar cada aspecto y a los integrantes que participan como colaboradores.

Los principales aspectos considerados durante Sprint 1 son la implementación del Landing Page, la experiencia móvil de búsqueda de ópticas, el flujo móvil de reserva de citas, los servicios asociados a Search & Booking y la integración y coordinación general del Sprint.

| Team Member | GitHub Username | Landing Page | Optical Store Search | Appointment Booking | Search & Booking Services | Integration & Sprint Coordination |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: |
| Atoche Gonzales, Nicolas Fernando | `THECOMAX` | C | **L** | C | C | C |
| Becerra Ttito, Felix Orlando | `Felixb14` | C | C | C | **L** | C |
| Celis Berrospi, Eslander | `Eslander-Celis` | C | C | C | C | **L** |
| Morocho Pinedo, Mariana | `Patto04` | C | C | **L** | C | C |
| Quispe Llacsahuanga, César Agusto | `user20-bit` | **L** | C | C | C | C |

**L:** Leader  
**C:** Collaborator

Cada aspecto cuenta con un líder y colaboradores. La matriz expresa la distribución de responsabilidades del Sprint; las contribuciones de implementación se presentan mediante los commits de la sección 4.2.1.4.

#### 4.2.1.3. Sprint Backlog 1

El Sprint Backlog reúne las tareas de búsqueda de ópticas y reserva de citas correspondientes a US05 y US06, junto con las actividades adicionales de la Landing Page. La tabla conserva las estimaciones y responsabilidades del registro de planificación. El estado To-Review identifica implementación disponible con evidencias de ejecución, preparada para la revisión del equipo; Done conserva las tareas iniciales registradas como terminadas.

**Board del Sprint:** [Tablero del Sprint 1 en GitHub](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Report/blob/develop/assets/cap4/sprint1/sprint-board.md) · [Vista del tablero local](assets/cap4/sprint1/sprint-board.html). El tablero adjunto se elaboró para esta revisión a partir de las tareas del informe y sus evidencias; no se presenta como un registro histórico de una herramienta externa.

![Tablero de revisión del Sprint 1](assets/cap4/sprint1/sprint-board.png)

| Sprint # | User Story | User Story Title | Task ID | Task Title | Description | Estimation (Hours) | Assigned To | Status |
| :---: | :---: | :--- | :---: | :--- | :--- | :---: | :--- | :---: |
| 1 | — | Actividad adicional: Landing Page | T01 | Create initial project structure | Crear la estructura inicial del proyecto del Landing Page y organizar los archivos necesarios para iniciar su implementación. | 4 | Quispe Llacsahuanga, César Agusto | Done |
| 1 | — | Actividad adicional: Landing Page | T02 | Implement base styles | Implementar los estilos base y la identidad visual inicial del Landing Page de acuerdo con los lineamientos definidos para OptiFlow. | 6 | Quispe Llacsahuanga, César Agusto | Done |
| 1 | — | Actividad adicional: Landing Page | T03 | Configure Three.js environment | Configurar Three.js y los recursos necesarios para los elementos visuales e interactivos del Landing Page. | 4 | Quispe Llacsahuanga, César Agusto | Done |
| 1 | — | Actividad adicional: Landing Page | T04 | Implement Landing Page sections | Implementar las principales secciones informativas del Landing Page, incluyendo la presentación de OptiFlow, propuesta de valor y principales características. | 8 | Quispe Llacsahuanga, César Agusto | To-Review |
| 1 | — | Actividad adicional: Landing Page | T05 | Implement responsive navigation | Implementar la navegación del Landing Page y adaptar su visualización para dispositivos móviles y equipos de escritorio. | 6 | Quispe Llacsahuanga, César Agusto | To-Review |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T06 | Implement optical store search screen | Implementar la interfaz móvil que permita al paciente iniciar la búsqueda de ópticas disponibles. | 6 | Atoche Gonzales, Nicolas Fernando | To-Review |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T07 | Implement optical store results | Implementar la visualización de los establecimientos disponibles, incluyendo sucursales, direcciones y horarios de atención. | 6 | Atoche Gonzales, Nicolas Fernando | To-Review |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T08 | Implement optical store search service | Implementar las operaciones del servicio RESTful necesarias para consultar ópticas y su disponibilidad. | 8 | Becerra Ttito, Felix Orlando | To-Review |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T09 | Integrate optical store search | Integrar la aplicación móvil con el servicio de búsqueda de ópticas y gestionar los estados de carga, resultados y ausencia de establecimientos. | 6 | Celis Berrospi, Eslander | To-Review |
| 1 | US06 | Reserva de cita para atención optométrica | T10 | Implement appointment selection screen | Implementar la interfaz para seleccionar sucursal, fecha y horario disponible para una cita optométrica. | 6 | Morocho Pinedo, Mariana | To-Review |
| 1 | US06 | Reserva de cita para atención optométrica | T11 | Implement appointment booking service | Implementar el servicio RESTful encargado de registrar las reservas de citas realizadas por los pacientes. | 8 | Becerra Ttito, Felix Orlando | To-Review |
| 1 | US06 | Reserva de cita para atención optométrica | T12 | Implement availability validation | Implementar la validación de disponibilidad del horario antes de confirmar una reserva. | 4 | Becerra Ttito, Felix Orlando | To-Review |
| 1 | US06 | Reserva de cita para atención optométrica | T13 | Integrate appointment confirmation | Integrar el flujo móvil de reserva con el servicio correspondiente y mostrar al paciente el resultado de la operación. | 6 | Celis Berrospi, Eslander | To-Review |

#### 4.2.1.4. Development Evidence for Sprint Review

Durante el Sprint 1 se registraron avances en los tres productos principales de OptiFlow. La Landing Page incorpora secciones informativas, ajustes visuales, navegación y validaciones del formulario. El backend incluye operaciones de búsqueda de ópticas, disponibilidad y reserva de citas, además de validaciones de entrada y manejo de errores. La aplicación móvil incorpora el cliente de comunicación con el backend, el registro e inicio de sesión del paciente, la consulta de establecimientos y la selección de horarios para realizar reservas.

La siguiente tabla presenta commits representativos del alcance documentado, obtenidos de los historiales de las clonaciones locales revisadas el 2026-10-07.

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
|---|---|---|---|---|---|
| `Logix-OptiFlow-lading-page` | `main` | [52a57c6](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/52a57c6) | `feat: add initial project structure, base styles, and Three.js setup` | Descripción en español: Crea la estructura inicial, los estilos base y la configuración de Three.js. | 2026-10-03 |
| `Logix-OptiFlow-lading-page` | `main` | [8091504](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/8091504) | `Refresh landing page visuals and intro animation` | Descripción en español: Actualiza la apariencia de la Landing Page y la animación introductoria. | 2026-10-06 |
| `Logix-OptiFlow-lading-page` | `main` | [8bf76ec](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/8bf76ec) | `fix: set footer` | Descripción en español: Ajusta el pie de página. | 2026-10-06 |
| `Logix-OptiFlow-lading-page` | `main` | [e5f8254](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/e5f8254) | `style: fix plans and avatars` | Descripción en español: Ajusta la presentación de planes y avatares. | 2026-10-06 |
| `Logix-OptiFlow-lading-page` | `main` | [5a9ff47](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/5a9ff47) | `fix: update navbar` | Descripción en español: Actualiza la barra de navegación. | 2026-10-06 |
| `Logix-OptiFlow-lading-page` | `main` | [774f144](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/774f144) | `style: fix benefits section` | Descripción en español: Ajusta los estilos de beneficios. | 2026-10-06 |
| `Logix-OptiFlow-lading-page` | `main` | [52716d7](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/52716d7) | `feat: highlight active navigation section and fix mobile menu state` | Descripción en español: Resalta la sección activa y corrige el estado del menú móvil. | 2026-10-07 |
| `Logix-OptiFlow-lading-page` | `main` | [1cd0a27](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/1cd0a27) | `feat: add demo form guidance and inline validation` | Descripción en español: Añade instrucciones y validaciones al formulario de demostración. | 2026-10-07 |
| `Logix-OptiFlow-lading-page` | `main` | [4c779f9](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page/commit/4c779f9) | `feat: improve active navigation style and smooth scroll tracking` | Descripción en español: Mejora el estilo de navegación activa y el seguimiento del desplazamiento. | 2026-10-07 |
| `Logix-OptiFlow-Back-End` | `develop` | [543aaf2](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/543aaf2) | `Add OptiFlow booking backend` | Descripción en español: Incorpora el backend de búsqueda y reserva de OptiFlow y sus pruebas iniciales. | 2026-10-06 |
| `Logix-OptiFlow-Back-End` | `develop` | [2f3f43f](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/2f3f43f) | `Add local/postgres Spring profiles` | Descripción en español: Añade perfiles de configuración local y PostgreSQL y modifica la configuración de pruebas. | 2026-10-06 |
| `Logix-OptiFlow-Back-End` | `develop` | [ac63183](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/ac63183) | `fix: reject invalid characters in patient phone numbers` | Descripción en español: Rechaza caracteres inválidos en teléfonos e incorpora pruebas de validación. | 2026-10-07 |
| `Logix-OptiFlow-Back-End` | `develop` | [25c3003](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/25c3003) | `feat: standardize malformed request error responses` | Descripción en español: Unifica respuestas a solicitudes mal formadas e incorpora pruebas de errores. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [067fd5d](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/067fd5d) | `chore(mobile): configure api base url for local and production` | Descripción en español: Configura las URL del backend para los entornos local y de producción. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [27fef3d](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/27fef3d) | `feat: add retrofit client with timeouts and logging` | Descripción en español: Añade el cliente Retrofit con tiempos de espera y registro de comunicaciones. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [484564d](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/484564d) | `feat: Add remote booking and search API layer` | Descripción en español: Añade la capa de API remota para búsqueda y reserva. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [8f950a3](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/8f950a3) | `feat: load optical stores from backend` | Descripción en español: Carga los establecimientos ópticos desde el backend. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [3e6f97c](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/3e6f97c) | `feat: register patient and login against api` | Descripción en español: Integra el registro y el inicio de sesión del paciente con la API. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [024cd92](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/024cd92) | `feat: fetch availability and book appointment` | Descripción en español: Consulta horarios disponibles y solicita reservas de citas. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [557a47c](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/557a47c) | `feat: wire sprint 1 screens to search booking repository` | Descripción en español: Conecta las pantallas del Sprint 1 con los repositorios de búsqueda y reserva. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [a5f5062](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/a5f5062) | `feat: add store search filter by minimum rating` | Descripción en español: Añade un filtro de búsqueda por valoración mínima. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [e097ffd](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/e097ffd) | `feat: Redesign auth flow and fix store rating types` | Descripción en español: Rediseña el flujo de acceso y corrige los tipos de las valoraciones. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [f09d228](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/f09d228) | `feat: Add home dashboard and patient appointment flow` | Descripción en español: Añade la pantalla de inicio y el flujo de citas del paciente. | 2026-10-07 |
| `Logix-OptiFlow-Movile` | `develop` | [861628c](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile/commit/861628c) | `feat: Add notifications and backend setup docs` | Descripción en español: Añade notificaciones y documentación para configurar el backend. | 2026-10-07 |

**Nota:** los commits seleccionados no contienen un cuerpo adicional en Git. La columna Commit Message Body presenta una descripción explicativa en español, no una transcripción de un cuerpo original. Branch identifica la rama revisada que contiene el commit, no necesariamente su rama de creación.

**Repositorios:** [Landing Page](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page), [Web Services](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End) y [aplicación móvil](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Movile).

#### 4.2.1.5. Testing Suite Evidence for Sprint Review

La verificación de Web Services comprende pruebas unitarias, pruebas de integración y pruebas de aceptación automatizadas bajo BDD. JUnit valida las reglas del dominio; Spring Boot Test y MockMvc comprueban las operaciones de la API; Cucumber ejecuta los escenarios Gherkin de US05 y US06 mediante Steps en Java.

| Test Suite | Tipo | Clases y comportamientos relacionados | Relación con el Sprint |
|---|---|---|---|
| `AppointmentBookingRulesTest` | Unit Tests | `AppointmentAvailabilityService`, `AppointmentFactory`, `TimeSlot` y `Appointment`: confirmación de una cita disponible y rechazo de un horario reservado. | US06 |
| `SearchAndBookingApiTest` | Integration Tests | Consulta de ópticas y disponibilidad, reserva confirmada, rechazo de doble reserva, búsqueda sin resultados, credenciales inválidas y validación de teléfonos. | US05, US06 y soporte al paciente |
| `PhoneNumberTest` | Unit Tests | `PhoneNumber`: normalización de formatos admitidos y rechazo de caracteres, formatos y longitudes inválidos. | Soporte al registro |
| `ApiRequestErrorsTest` | Integration Tests | Respuestas HTTP 400 ante UUID inválidos, cuerpos vacíos, JSON mal formado, tipos incorrectos y campos obligatorios ausentes. | Soporte a los servicios |
| `SearchBookingAcceptanceTest` | Acceptance Tests / BDD | Cuatro escenarios de consulta de establecimientos y disponibilidad, búsqueda sin coincidencias, reserva exitosa y rechazo de un horario reservado por otro paciente. | US05 y US06 |

##### Resultados de ejecución

El 2026-10-07 a las 23:09:57 (America/Lima) se ejecutó `mvn test` sobre el backend con la suite BDD incorporada localmente. Maven finalizó con **BUILD SUCCESS: 53 tests, 0 failures, 0 errors y 0 skipped**. Las suites relacionadas con Search & Booking y soporte suman 38 ejecuciones, incluidos cuatro escenarios de aceptación. Las 15 ejecuciones restantes corresponden a Clinical & Commercial y Production & Tracking.

| Test Suite | Tests | Failures | Errors | Skipped |
|---|---:|---:|---:|---:|
| `AppointmentBookingRulesTest` | 2 | 0 | 0 | 0 |
| `SearchAndBookingApiTest` | 4 | 0 | 0 | 0 |
| `PhoneNumberTest` | 20 | 0 | 0 | 0 |
| `ApiRequestErrorsTest` | 8 | 0 | 0 | 0 |
| `SearchBookingAcceptanceTest` | 4 | 0 | 0 | 0 |
| **Subtotal del alcance y soporte** | **38** | **0** | **0** | **0** |
| Clinical & Commercial y Production & Tracking | 15 | 0 | 0 | 0 |
| **Total ejecutado** | **53** | **0** | **0** | **0** |

Los casos parametrizados se contabilizan como ejecuciones individuales. La ejecución utilizó Java 25.0.3 con release 21 configurado en Maven. Las pruebas BDD emplean una base H2 independiente (`optiflow_bdd`), pacientes con correos únicos y horarios nuevos para los escenarios de reserva, sin acceder a datos de producción.

**Evidencias:** [resumen de Maven Surefire](assets/cap4/sprint1/test-results.txt), [reporte HTML de Cucumber](assets/cap4/sprint1/testing/cucumber.html) y [resultados JSON](assets/cap4/sprint1/testing/cucumber.json).

![Resultado de los escenarios de aceptación en Cucumber](assets/cap4/sprint1/cucumber-results.png)

##### Verificación posterior a la integración

Antes de publicar se integraron los tres commits nuevos de Notification & Loyalty existentes en develop remoto (`6c388bc`). Sobre esa base, los cuatro escenarios BDD se ejecutaron sin fallos. La suite general registró 61 ejecuciones con 2 fallos y 4 errores; la base remota sin BDD registró 57 ejecuciones con los mismos 2 fallos y 4 errores. Se reprodujeron los mismos problemas en una copia independiente del código remoto, sin las modificaciones de aceptación.

Los errores de contexto se deben al índice parcial con WHERE de la migración V4, que H2 no admite. Los otros dos fallos corresponden a expectativas de NotificationPersistenceIntegrationTest y SearchAndBookingApiTest. Esta verificación distingue el resultado exitoso de la ejecución inicial de 53 pruebas de los problemas incorporados por la revisión remota posterior. El detalle se conserva en [validación de publicación](assets/cap4/sprint1/publish-validation.txt).

##### Evidencia de control de versiones

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
|---|---|---|---|---|---|
| `Logix-OptiFlow-Back-End` | `develop` | [543aaf2](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/543aaf2) | `Add OptiFlow booking backend` | Descripción en español: Incorpora el backend de búsqueda y reserva de OptiFlow y sus pruebas iniciales. | 2026-10-06 |
| `Logix-OptiFlow-Back-End` | `develop` | [2f3f43f](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/2f3f43f) | `Add local/postgres Spring profiles` | Descripción en español: Añade perfiles de configuración local y PostgreSQL y modifica la configuración de pruebas. | 2026-10-06 |
| `Logix-OptiFlow-Back-End` | `develop` | [ac63183](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/ac63183) | `fix: reject invalid characters in patient phone numbers` | Descripción en español: Rechaza caracteres inválidos en teléfonos e incorpora pruebas de validación. | 2026-10-07 |
| `Logix-OptiFlow-Back-End` | `develop` | [25c3003](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/25c3003) | `feat: standardize malformed request error responses` | Descripción en español: Unifica respuestas a solicitudes mal formadas e incorpora pruebas de errores. | 2026-10-07 |
| `Logix-OptiFlow-Back-End` | `develop` | [706ada9](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/706ada927d4fd49807035e79d4313fbe463e9e54) | `test: add Gherkin acceptance suite for search and booking` | Descripción en español: Implementa cuatro escenarios Gherkin de US05 y US06, Steps con MockMvc y configuración de Cucumber y Surefire. | 2026-10-07 |

Los commits indicados incluyen cambios en `src/test`. Las suites y recursos pueden consultarse en [src/test del backend](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/tree/develop/src/test).

La suite BDD se encuentra registrada en el commit [706ada9](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-Back-End/commit/706ada927d4fd49807035e79d4313fbe463e9e54) del backend. Los archivos Gherkin, Steps y configuración de ejecución forman parte de ese commit.

##### Archivos de pruebas de aceptación

| Archivo en el backend | Responsabilidad | Copia de evidencia |
|---|---|---|
| `src/test/resources/features/optical-store-search.feature` | Escenarios de US05. | [Gherkin de búsqueda](assets/cap4/sprint1/testing/optical-store-search.feature) |
| `src/test/resources/features/appointment-booking.feature` | Escenarios de US06. | [Gherkin de reserva](assets/cap4/sprint1/testing/appointment-booking.feature) |
| `src/test/java/com/optiflow/platform/searchbooking/acceptance/SearchBookingSteps.java` | Steps que realizan solicitudes MockMvc y verifican códigos, datos, disponibilidad y persistencia de las citas. | [Steps en Java](assets/cap4/sprint1/testing/SearchBookingSteps.java) |
| `src/test/java/com/optiflow/platform/searchbooking/acceptance/CucumberSpringConfiguration.java` | Contexto Spring, MockMvc y base H2 de aceptación. | [Configuración Spring](assets/cap4/sprint1/testing/CucumberSpringConfiguration.java) |
| `src/test/java/com/optiflow/platform/searchbooking/acceptance/SearchBookingAcceptanceTest.java` | Suite JUnit Platform que descubre features, Steps y genera los reportes HTML y JSON. | [Suite de aceptación](assets/cap4/sprint1/testing/SearchBookingAcceptanceTest.java) |

##### Escenarios Gherkin ejecutados

```gherkin
# language: es
@US05
Característica: Búsqueda de ópticas y disponibilidad de atención
  Como paciente
  Quiero consultar las ópticas y sus horarios disponibles
  Para elegir dónde recibir atención optométrica

  Escenario: Consulta de establecimientos y disponibilidad
    Dado que existen ópticas y sucursales registradas
    Cuando el paciente consulta los establecimientos disponibles
    Entonces obtiene la información y las direcciones de los establecimientos
    Y puede consultar los horarios disponibles de una óptica

  Escenario: Búsqueda sin establecimientos coincidentes
    Dado que ninguna óptica coincide con los criterios de búsqueda
    Cuando el paciente realiza la búsqueda
    Entonces obtiene una lista vacía y un mensaje informativo
```

```gherkin
# language: es
@US06
Característica: Reserva de cita para atención optométrica
  Como paciente
  Quiero seleccionar un horario disponible y reservar una cita
  Para programar mi atención de manera organizada

  Escenario: Reserva exitosa de un horario disponible
    Dado que existe un paciente registrado
    Y existe un horario disponible en una óptica
    Cuando el paciente confirma la reserva de ese horario
    Entonces el servicio responde con código 201
    Y la cita queda en estado "CONFIRMED"
    Y la cita registrada puede consultarse
    Y el horario deja de estar disponible

  Escenario: Rechazo de un horario reservado por otro paciente
    Dado que existe un paciente registrado
    Y existe un horario reservado por otro paciente
    Cuando el paciente confirma la reserva de ese horario
    Entonces el servicio responde con código 409
    Y informa que el horario ya no está disponible
```

##### Reproducción

Desde la raíz del backend, ejecutar `mvn test`, o seleccionar Maven → Lifecycle → test en IntelliJ IDEA. Para ejecutar únicamente BDD, utilizar:

```powershell
mvn test "-Dtest=SearchBookingAcceptanceTest"
```

Los reportes se generan en `target/surefire-reports` y `target/cucumber`. La configuración incorpora Cucumber 7.23.0, el motor JUnit Platform, integración con Spring y Maven Surefire 3.5.4. El backend de producción no necesita estar iniciado para estas pruebas.

#### 4.2.1.6. Execution Evidence for Sprint Review

La ejecución del incremento permitió visualizar la Landing Page en escritorio y móvil, interactuar con los Web Services mediante Swagger y completar el flujo del paciente desde el inicio de sesión hasta la confirmación de una reserva. La demostración utilizó datos ficticios en el backend local con el perfil local y una base H2. La reserva creada desde la aplicación se consultó posteriormente en Swagger para verificar su persistencia y estado CONFIRMED.

##### Landing Page

La Landing Page presenta la propuesta de valor de OptiFlow y permite navegar entre sus secciones informativas. Las capturas se obtuvieron desde la clonación local en Chrome, con viewports de 1440 × 1000 píxeles para escritorio y 390 × 844 píxeles para móvil. Se utilizó el control Saltar para finalizar la introducción y acceder a la vista principal.

**Figura 4.2.1.6-1. Landing Page en escritorio.** Se visualizan la identidad de OptiFlow, la propuesta de valor y los accesos de navegación.

![Landing Page en escritorio](assets/cap4/sprint1/landing-desktop.png)

**Figura 4.2.1.6-2. Landing Page en móvil.** La presentación se adapta a una distribución vertical y la navegación utiliza un menú compacto.

<img src="assets/cap4/sprint1/landing-mobile.png" alt="Landing Page en móvil" width="390">

**Figura 4.2.1.6-3. Menú y navegación móvil.** Se abrió el menú y se seleccionó Beneficios para comprobar el acceso a la sección correspondiente.

<img src="assets/cap4/sprint1/landing-mobile-menu.png" alt="Menú móvil de la Landing Page" width="390">
<img src="assets/cap4/sprint1/landing-mobile-benefits.png" alt="Navegación móvil a Beneficios" width="390">

##### Web Services: Swagger UI

Los Web Services se ejecutaron en `http://127.0.0.1:8080` con el perfil local. La documentación OpenAPI se visualizó en [Swagger UI local](http://localhost:8080/swagger-ui/index.html), que permitió ejecutar consultas y solicitudes con datos de demostración. El README de la aplicación también referencia [Swagger del backend desplegado](https://logix-optiflow-back-end.onrender.com/swagger-ui/index.html); las evidencias de esta revisión corresponden al entorno local.

**Figura 4.2.1.6-4. Vista general de Swagger.** La documentación organiza las operaciones de pacientes, ópticas, disponibilidad y citas dentro de Search & Booking.

![Swagger UI de OptiFlow](assets/cap4/sprint1/swagger-overview.png)

**Figura 4.2.1.6-5. Consulta de ópticas.** La ejecución de GET /optical-stores devuelve HTTP 200 y la información de las sucursales de Miraflores y San Isidro, incluyendo dirección, teléfono, valoración y estado.

![Consulta de ópticas en Swagger](assets/cap4/sprint1/swagger-optical-stores.png)

**Figura 4.2.1.6-6. Reserva confirmada.** POST /appointments registra una cita con datos de prueba y devuelve HTTP 201 con estado CONFIRMED.

![Reserva confirmada en Swagger](assets/cap4/sprint1/swagger-booking-confirmed.png)

**Figura 4.2.1.6-7. Prevención de doble reserva.** Al repetir la solicitud sobre el mismo horario, el servicio devuelve HTTP 409 e informa que el horario seleccionado ya no está disponible.

![Rechazo de doble reserva en Swagger](assets/cap4/sprint1/swagger-booking-conflict.png)

##### Aplicación móvil

La aplicación se compiló desde la rama develop mediante assembleLocalDebug y Gradle finalizó con BUILD SUCCESSFUL. El APK generado se instaló en el emulador Pixel 10 Pro XL. Para conectar la demostración con el backend de la PC se utilizó `adb reverse tcp:8080 tcp:8080` y una URL temporal de compilación `http://127.0.0.1:8080/`, sin modificar el código de producción de la app.

El recorrido utilizó el paciente ficticio Paciente Demo Informe. Tras el inicio de sesión se consultaron las ópticas disponibles, se abrió la sucursal de Miraflores, se solicitaron sus horarios y se confirmó una reserva. Las fechas y horas visibles corresponden a la zona horaria del emulador, configurado en UTC durante esta demostración.

**Figura 4.2.1.6-8. Acceso del paciente.** Inicio de sesión con una cuenta ficticia del backend local.

<img src="assets/cap4/sprint1/mobile-access.png" alt="Acceso del paciente de demostración" width="390">

**Figura 4.2.1.6-9. Búsqueda de ópticas (US05).** La app muestra establecimientos obtenidos del backend, con sus direcciones, teléfonos, valoraciones y controles de búsqueda.

<img src="assets/cap4/sprint1/mobile-search.png" alt="Búsqueda de ópticas en la aplicación" width="390">

**Figura 4.2.1.6-10. Disponibilidad de atención.** Se consultan los horarios disponibles de la sucursal de Miraflores antes de solicitar la reserva.

<img src="assets/cap4/sprint1/mobile-availability.png" alt="Disponibilidad de horarios en la aplicación" width="390">

**Figura 4.2.1.6-11. Reserva confirmada (US06).** La app muestra el identificador de la cita creada y su estado CONFIRMED.

<img src="assets/cap4/sprint1/mobile-booking-confirmed.png" alt="Confirmación de la reserva desde la aplicación" width="390">

**Figura 4.2.1.6-12. Verificación de la cita móvil en el backend.** GET /appointments/{id} devuelve HTTP 200 para el mismo identificador mostrado en la app, confirmando que la operación se registró en el backend.

![Consulta en Swagger de la cita creada desde la app](assets/cap4/sprint1/swagger-mobile-booking.png)

La respuesta de esta consulta se conserva como [evidencia JSON de la reserva móvil](assets/cap4/sprint1/mobile-booking-response.json). El identificador verificado es `537787f8-d78f-4181-9d0e-e51c2266f02f`, con estado CONFIRMED. Al tratarse de una base de demostración en memoria, las capturas y la respuesta adjunta conservan la evidencia de esta ejecución.

##### Video explicativo

El video de navegación y explicación del incremento será grabado por el equipo. Su enlace se incorporará a esta sección junto con la demostración de la Landing Page, la aplicación móvil y los Web Services.

#### 4.2.1.7. Services Documentation Evidence for Sprint Review
#### 4.2.1.8. Software Deployment Evidence for Sprint Review
#### 4.2.1.9. Team Collaboration Insights during Sprint
## 4.3. Validation Interviews
### 4.3.1. Diseño de entrevistas
### 4.3.2. Registro de entrevistas
### 4.3.3. Evaluaciones según heurísticas