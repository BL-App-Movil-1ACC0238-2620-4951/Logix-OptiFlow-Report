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

En la fecha de corte de esta versión del informe, la principal evidencia de implementación disponible corresponde al Landing Page. Conforme avance el Sprint, esta sección será complementada con las evidencias correspondientes a los Web Services y a la aplicación móvil.
#### 4.2.1.1. Sprint Planning 1
El Sprint Planning 1 tuvo como finalidad establecer el objetivo de la primera iteración, seleccionar las User Stories que contribuyen directamente a dicho objetivo, determinar la capacidad inicial del equipo y distribuir las principales responsabilidades de implementación.

La reunión se realizó de manera virtual mediante Discord y fue preparada por Celis Berrospi, Eslander. Debido a que Sprint 1 representa la primera iteración de implementación de la solución, no existe un Sprint anterior sobre el cual realizar un Sprint Review o Sprint Retrospective formal.

| Sprint # | Sprint 1 |
| :--- | :--- |
| **Sprint Planning Background** | |
| **Date** | `[2026-09-28]` |
| **Time** | `[19:00]` |
| **Location** | Discord |
| **Prepared By** | Celis Berrospi, Eslander |
| **Attendees (to planning meeting)** | Atoche Gonzales, Nicolas Fernando / Becerra Ttito, Felix Orlando / Celis Berrospi, Eslander / Morocho Pinedo, Mariana / Quispe Llacsahuanga, César Agusto |
| **Sprint 0 Review Summary** | No aplica, debido a que Sprint 1 corresponde a la primera iteración de implementación de OptiFlow. Antes del inicio de este Sprint, el equipo desarrolló las actividades de investigación, análisis de los segmentos objetivo, especificación de requisitos, Domain-Driven Design, arquitectura de software y diseño UX/UI que sirven como base para la implementación del producto. |
| **Sprint 0 Retrospective Summary** | No se realizó una retrospectiva formal debido a que no existió un Sprint de implementación anterior. Sin embargo, a partir del trabajo realizado durante las etapas previas, el equipo identificó la necesidad de distribuir claramente las responsabilidades, dividir el trabajo en tareas de corta duración, mantener una comunicación constante mediante Discord y conservar la trazabilidad del desarrollo mediante GitHub. |
| **Sprint Goal & User Stories** | |
| **Sprint 1 Goal** | Durante Sprint 1, el equipo se enfocará en obtener el primer incremento funcional de OptiFlow. Para ello, se iniciará la implementación del Landing Page y se avanzará en el flujo principal orientado al paciente, relacionado con la búsqueda de ópticas y la reserva de citas. Este incremento busca facilitar al paciente una forma centralizada de encontrar establecimientos ópticos, consultar su disponibilidad y programar una atención. El objetivo se considerará alcanzado cuando el Landing Page pueda ejecutarse y visualizarse correctamente y los flujos asociados a US05 y US06 presenten un avance funcional demostrable. |
| **Sprint 1 Velocity** | 13 Story Points |
| **Sum of Story Points** | 13 Story Points |

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

La asignación permite que cada aspecto posea un responsable principal, manteniendo al mismo tiempo la participación colaborativa del resto de integrantes. En particular, el liderazgo inicial del Landing Page se relaciona con la evidencia disponible en el repositorio, donde las primeras contribuciones registradas fueron realizadas por César Agusto. Por otro lado, Celis Berrospi, Eslander asume la coordinación del Sprint y la integración de las actividades acordadas durante las reuniones de trabajo.
#### 4.2.1.3. Sprint Backlog 1
| Sprint # | User Story | User Story Title | Task ID | Task Title | Description | Estimation (Hours) | Assigned To | Status |
| :---: | :---: | :--- | :---: | :--- | :--- | :---: | :--- | :---: |
| 1 | US21 | Visualización del Landing Page de OptiFlow | T01 | Create initial project structure | Crear la estructura inicial del proyecto del Landing Page y organizar los archivos necesarios para iniciar su implementación. | 4 | Quispe Llacsahuanga, César Agusto | Done |
| 1 | US21 | Visualización del Landing Page de OptiFlow | T02 | Implement base styles | Implementar los estilos base y la identidad visual inicial del Landing Page de acuerdo con los lineamientos definidos para OptiFlow. | 6 | Quispe Llacsahuanga, César Agusto | Done |
| 1 | US21 | Visualización del Landing Page de OptiFlow | T03 | Configure Three.js environment | Configurar Three.js y los recursos necesarios para los elementos visuales e interactivos del Landing Page. | 4 | Quispe Llacsahuanga, César Agusto | Done |
| 1 | US21 | Visualización del Landing Page de OptiFlow | T04 | Implement Landing Page sections | Implementar las principales secciones informativas del Landing Page, incluyendo la presentación de OptiFlow, propuesta de valor y principales características. | 8 | Quispe Llacsahuanga, César Agusto | In-Process |
| 1 | US21 | Visualización del Landing Page de OptiFlow | T05 | Implement responsive navigation | Implementar la navegación del Landing Page y adaptar su visualización para dispositivos móviles y equipos de escritorio. | 6 | Quispe Llacsahuanga, César Agusto | To-do |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T06 | Implement optical store search screen | Implementar la interfaz móvil que permita al paciente iniciar la búsqueda de ópticas disponibles. | 6 | Atoche Gonzales, Nicolas Fernando | To-do |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T07 | Implement optical store results | Implementar la visualización de los establecimientos disponibles, incluyendo sucursales, direcciones y horarios de atención. | 6 | Atoche Gonzales, Nicolas Fernando | To-do |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T08 | Implement optical store search service | Implementar las operaciones del servicio RESTful necesarias para consultar ópticas y su disponibilidad. | 8 | Becerra Ttito, Felix Orlando | To-do |
| 1 | US05 | Búsqueda de ópticas y disponibilidad de atención | T09 | Integrate optical store search | Integrar la aplicación móvil con el servicio de búsqueda de ópticas y gestionar los estados de carga, resultados y ausencia de establecimientos. | 6 | Celis Berrospi, Eslander | To-do |
| 1 | US06 | Reserva de cita para atención optométrica | T10 | Implement appointment selection screen | Implementar la interfaz para seleccionar sucursal, fecha y horario disponible para una cita optométrica. | 6 | Morocho Pinedo, Mariana | To-do |
| 1 | US06 | Reserva de cita para atención optométrica | T11 | Implement appointment booking service | Implementar el servicio RESTful encargado de registrar las reservas de citas realizadas por los pacientes. | 8 | Becerra Ttito, Felix Orlando | To-do |
| 1 | US06 | Reserva de cita para atención optométrica | T12 | Implement availability validation | Implementar la validación de disponibilidad del horario antes de confirmar una reserva. | 4 | Becerra Ttito, Felix Orlando | To-do |
| 1 | US06 | Reserva de cita para atención optométrica | T13 | Integrate appointment confirmation | Integrar el flujo móvil de reserva con el servicio correspondiente y mostrar al paciente el resultado de la operación. | 6 | Celis Berrospi, Eslander | To-do |

#### 4.2.1.4. Development Evidence for Sprint Review
Durante Sprint 1, el equipo inició la implementación del Landing Page de OptiFlow. Hasta la fecha de corte de esta versión del informe, este producto cuenta con evidencia verificable en el repositorio de control de versiones del equipo.

**Repository:**  
[Logix-OptiFlow-lading-page](https://github.com/BL-App-Movil-1ACC0238-2620-4951/Logix-OptiFlow-lading-page)

Los commits registrados hasta el momento son los siguientes:

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `Logix-OptiFlow-lading-page` | `main` | `52a57c66` | `feat: add initial project structure, base styles, and Three.js setup` | `-` | `2026-10-03` |
| `Logix-OptiFlow-lading-page` | `main` | `4b6c3d8d` | `Initial commit` | `-` | `2026-09-29` |

#### 4.2.1.5. Testing Suite Evidence for Sprint Review

#### 4.2.1.6. Execution Evidence for Sprint Review
#### 4.2.1.7. Services Documentation Evidence for Sprint Review
#### 4.2.1.8. Software Deployment Evidence for Sprint Review
#### 4.2.1.9. Team Collaboration Insights during Sprint
## 4.3. Validation Interviews
### 4.3.1. Diseño de entrevistas
### 4.3.2. Registro de entrevistas
### 4.3.3. Evaluaciones según heurísticas