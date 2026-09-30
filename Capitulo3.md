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

 ** foto ** 

#### 3.1.1.1. General Style Guidelines

 **Tipografía**

La tipografía debe facilitar la lectura de la información presentada en OptiFlow, especialmente en elementos relacionados con citas, recetas ópticas, pedidos, órdenes de trabajo y registros de pacientes.

Se propone utilizar una tipografía **sans-serif**, debido a que permite una lectura clara tanto en dispositivos móviles como en interfaces administrativas.

Los tamaños se organizarán jerárquicamente de acuerdo con el nivel de importancia del contenido:

| Elemento         | Uso                                               |
| ---------------- | ------------------------------------------------- |
| Título principal | Identificar las principales secciones o pantallas |
| Subtítulo        | Describir subsecciones o grupos de información    |
| Texto principal  | Mostrar información y descripciones               |
| Texto secundario | Presentar información complementaria              |
| Texto de apoyo   | Mostrar etiquetas, estados o información auxiliar |

La jerarquía tipográfica permitirá diferenciar rápidamente títulos, información principal, acciones y contenido secundario.

**Colores**

La paleta de colores debe transmitir una apariencia relacionada con los conceptos de **salud visual, confianza, claridad y tecnología**.

Se considera una paleta compuesta por colores principales, secundarios y colores destinados a comunicar estados del sistema.

| Elemento       | Color propuesto | Uso                                                 |
| -------------- | --------------- | --------------------------------------------------- |
| Primary        | `#2563EB`       | Botones principales, enlaces y elementos destacados |
| Secondary      | `#0EA5A4`       | Acciones secundarias y elementos complementarios    |
| Background     | `#F8FAFC`       | Fondo general de las interfaces                     |
| Surface        | `#FFFFFF`       | Tarjetas, formularios y contenedores                |
| Text           | `#1E293B`       | Texto principal                                     |
| Secondary Text | `#64748B`       | Texto secundario y descripciones                    |
| Success        | `#16A34A`       | Operaciones completadas y estados positivos         |
| Warning        | `#F59E0B`       | Advertencias y situaciones que requieren atención   |
| Error          | `#DC2626`       | Errores, validaciones y acciones críticas           |

Los colores de estado se utilizarán de manera consistente. Por ejemplo, un pedido listo para ser recogido podrá identificarse mediante un estado positivo, mientras que una orden retrasada podrá utilizar un estado de advertencia.

**Botones**

Los botones deben diferenciar claramente las acciones principales de las acciones secundarias.


* **Acción primaria:** utilizada para las acciones principales, como `Reservar cita`, `Confirmar` o `Guardar`.
* **Acción secundaria:** utilizada para acciones complementarias, como `Cancelar`, `Volver` o `Editar`.
* **Acción crítica:** utilizada para operaciones que pueden generar consecuencias importantes, como eliminar información.
* **Acción contextual:** utilizada para operaciones específicas dentro de tarjetas, tablas o registros.


**Tarjetas**

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

Cada tarjeta deberá presentar una jerarquía visual clara, priorizando la información más relevante y evitando incluir demasiados elementos en un mismo componente.

**Iconografía**

Los iconos se utilizarán como elementos complementarios para facilitar el reconocimiento de acciones y funcionalidades.

Algunos ejemplos de iconos que podrán utilizarse son:

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

**Espaciado y distribución**

Se considerarán espacios diferenciados para:

* Separación entre secciones.
* Separación entre títulos y contenido.
* Separación entre campos de formularios.
* Separación entre botones.
* Márgenes internos de tarjetas y contenedores.
* Márgenes generales de las pantallas.

La distribución deberá priorizar la información relevante y permitir que el usuario identifique rápidamente las acciones disponibles.

**Formularios**

Se considerarán los siguientes elementos:

* Etiqueta del campo.
* Campo de entrada.
* Texto de ayuda cuando sea necesario.
* Mensaje de validación.
* Indicador de campo obligatorio cuando corresponda.

Las validaciones deberán mostrarse cerca del campo correspondiente para facilitar la corrección de errores.

Por ejemplo, al realizar una reserva de cita, el sistema deberá indicar claramente la óptica, fecha, horario seleccionado y cualquier información necesaria antes de permitir la confirmación.

**Estados de la interfaz**

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

La interfaz deberá adaptarse a los diferentes tamaños de pantalla en los que se utilice OptiFlow.

En la aplicación orientada a pacientes, el diseño priorizará dispositivos móviles, considerando:

* Controles táctiles de tamaño adecuado.
* Navegación sencilla.
* Contenido organizado verticalmente.
* Formularios adaptados a pantallas pequeñas.
* Información importante visible sin necesidad de desplazamientos excesivos.

En las interfaces destinadas al personal de la óptica se podrá aprovechar un espacio de pantalla mayor para mostrar tablas, indicadores, filtros y diferentes bloques de información simultáneamente.

**Accesibilidad**

El diseño deberá considerar principios básicos de accesibilidad para facilitar el uso de la aplicación por diferentes usuarios.

Se considerarán los siguientes aspectos:

* Contraste suficiente entre texto y fondo.
* Tamaños de texto legibles.
* Elementos interactivos claramente identificables.
* Mensajes de error comprensibles.
* No depender únicamente del color para comunicar estados.
* Uso de etiquetas descriptivas.
* Estructura visual consistente.

Estas consideraciones permitirán que información como estados de pedidos, alertas de inventario y disponibilidad de citas pueda ser comprendida de manera adecuada.

**Comunicación visual**

OptiFlow utilizará elementos visuales para representar información relacionada con el proceso óptico y la gestión de las ópticas.

La comunicación visual estará orientada principalmente a:

* Facilitar la búsqueda de ópticas y productos.
* Mostrar disponibilidad de citas.
* Comunicar el estado de las órdenes de trabajo.
* Presentar alertas y notificaciones.
* Diferenciar estados de pedidos.
* Mostrar información clínica y comercial de manera organizada.

Los elementos visuales deberán complementar el contenido textual y no reemplazar información necesaria para que el usuario pueda tomar una acción.


### 3.1.2. Information Architecture

##### 3.1.2.1. Organization Systems

##### 3.1.2.2. Labeling Systems

##### 3.1.2.3. SEO Tags and Meta Tags

##### 3.1.2.4. Searching Systems

##### 3.1.2.5. Navigation Systems 
