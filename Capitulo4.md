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