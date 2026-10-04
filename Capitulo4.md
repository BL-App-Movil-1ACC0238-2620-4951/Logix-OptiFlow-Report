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

#### 4.1.4. Software Deployment Configuration 