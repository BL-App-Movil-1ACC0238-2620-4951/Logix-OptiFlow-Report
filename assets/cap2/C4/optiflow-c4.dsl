/*
 * OptiFlow – C4 Model (Structurizr DSL)
 * Vistas: SystemContext, Containers, Deployment y un Component por Bounded Context.
 * Uso: pegar en https://structurizr.com/dsl, abrir cada vista y exportarla como PNG o SVG.
 */
workspace "OptiFlow" "Plataforma móvil para la búsqueda de ópticas, la reserva de citas y la gestión de la atención en ópticas." {

    !identifiers hierarchical

    model {
        patient = person "Paciente" "Busca ópticas, reserva citas, paga sus ventas y da seguimiento a sus pedidos."
        staff = person "Personal de la óptica" "Optómetra, asesor de ventas, técnico de laboratorio y administrador."

        mercadoPago = softwareSystem "Pasarela de Pagos (Mercado Pago Checkout Pro)" "Cobra con tarjeta o Yape y notifica el resultado de cada pago." "External"
        fcm = softwareSystem "Firebase Cloud Messaging" "Entrega las notificaciones push a los dispositivos Android." "External"
        maps = softwareSystem "Google Maps Platform" "Muestra las ópticas cercanas en un mapa." "External"
        arFilters = softwareSystem "Servicio de filtros faciales AR" "Superpone las monturas sobre el rostro en el probador virtual." "External"

        optiflow = softwareSystem "OptiFlow" "Búsqueda de ópticas, reserva de citas, atención clínica y comercial, producción de lentes, inventario y fidelización." {
            landing = container "Landing Page" "Sitio estático que presenta la propuesta de valor e incluye el enlace de descarga de la aplicación." "HTML5, CSS3, JavaScript" "Web Browser"
            mobile = container "Aplicación móvil" "Interfaz por rol para pacientes y personal de la óptica." "Kotlin, Jetpack Compose" "Mobile App"
            localDb = container "Base de datos local" "Copia de solo lectura de la última información consultada (citas, pedidos, avisos y catálogo)." "Room, SQLite" "Database"

            backend = container "Backend OptiFlow" "Único contenedor de la API REST; organiza los Bounded Contexts como módulos internos." "Java 21, Spring Boot" {

                group "Shared / Security" {
                    jwtFilter = component "JwtAuthenticationFilter" "Valida el token JWT de cada solicitud y carga el rol del usuario." "Spring Security"
                    eventPublisher = component "EventPublisherAdapter" "Publica los eventos de dominio entre módulos." "Spring ApplicationEventPublisher"
                }

                group "Search & Booking" {
                    sbControllers = component "Controllers de Search & Booking" "PatientController, AuthenticationController, StaffMemberController, OpticalStoreController, TimeSlotController, AppointmentController, FavoriteStoreController y StoreRatingController." "Spring MVC"
                    sbApp = component "Application Services de Search & Booking" "Command Handlers (login, registro, personal, horarios, citas, favoritos, calificación) y Query Services (búsqueda, cercanía, horarios, citas, agenda, personal, cumpleaños)." "Spring"
                    sbDomain = component "Domain de Search & Booking" "Appointment, Patient, StaffMember, OpticalStore, TimeSlot y sus repositorios." "Java"
                    sbInfra = component "Infrastructure de Search & Booking" "Repositorios JPA, JwtTokenService y AuthenticationAdapter (BCrypt)." "Spring Data JPA"
                }

                group "Clinical & Commercial" {
                    ccControllers = component "Controllers de Clinical & Commercial" "ClinicalRecordController, QuotationController, SaleController y SalesReportController." "Spring MVC"
                    ccWebhook = component "PaymentWebhookController" "Ruta pública POST /api/v1/payment-notifications que recibe las notificaciones de pago." "Spring MVC"
                    ccApp = component "Application Services de Clinical & Commercial" "Command Handlers (atención, cotización, venta, preferencia de pago, pago y cierre) y Query Services (ventas y métricas)." "Spring"
                    ccDomain = component "Domain de Clinical & Commercial" "ClinicalRecord, Quotation, Sale, Payment y sus repositorios." "Java"
                    ccInfra = component "Infrastructure de Clinical & Commercial" "Repositorios JPA." "Spring Data JPA"
                    paymentAdapter = component "PaymentGatewayAdapter" "ACL hacia Mercado Pago: crea la preferencia, valida la firma del webhook y consulta el pago." "Mercado Pago SDK"
                }

                group "Production & Tracking" {
                    ptControllers = component "Controllers de Production & Tracking" "WorkOrderController, ProductionCatalogController y ProductionReportController." "Spring MVC"
                    ptApp = component "Application Services de Production & Tracking" "Command Handlers de la orden de trabajo, SaleWasClosedEventHandler y Query Services (tablero, seguimiento y métricas)." "Spring"
                    ptDomain = component "Domain de Production & Tracking" "WorkOrder, Lenses, Technician, Laboratory y sus repositorios." "Java"
                    ptInfra = component "Infrastructure de Production & Tracking" "Repositorios JPA." "Spring Data JPA"
                }

                group "Store Management & Inventory" {
                    invControllers = component "Controllers de Inventory" "FrameModelController, InventoryController, SupplierController e InventoryReportController." "Spring MVC"
                    invApp = component "Application Services de Inventory" "Command Handlers (catálogo, precio, reposición, salida por venta, proveedores), SaleWasClosedEventHandler y Query Services (escaneo, catálogo, movimientos, alertas y métricas)." "Spring"
                    invDomain = component "Domain de Inventory" "Inventory, Stock, FrameModel, Supplier, StockMovement y sus repositorios." "Java"
                    invInfra = component "Infrastructure de Inventory" "Repositorios JPA." "Spring Data JPA"
                }

                group "Notification & Loyalty" {
                    nlControllers = component "Controllers de Notification & Loyalty" "NotificationController, DeviceTokenController y LoyaltyAccountController." "Spring MVC"
                    nlApp = component "Application Services de Notification & Loyalty" "Command Handlers, Event Handlers de reservas y producción y tareas programadas (ScheduledNotificationDispatcher, BirthdayDiscountScheduler)." "Spring, @Scheduled"
                    nlDomain = component "Domain de Notification & Loyalty" "Notification, LoyaltyAccount, DeviceToken y sus repositorios." "Java"
                    nlInfra = component "Infrastructure de Notification & Loyalty" "Repositorios JPA y PatientDirectoryAdapter." "Spring Data JPA"
                    fcmAdapter = component "FirebaseMessagingAdapter" "ACL hacia Firebase Cloud Messaging." "Firebase Admin SDK"
                }
            }

            database = container "Base de datos" "Persistencia relacional de los cinco módulos del backend (27 tablas, migraciones Flyway V1–V9)." "PostgreSQL 16" "Database"
        }

        # Contexto
        patient -> optiflow.landing "Conoce la propuesta de OptiFlow" "HTTPS"
        patient -> optiflow.mobile "Busca ópticas, reserva citas, paga y consulta sus pedidos"
        staff -> optiflow.mobile "Gestiona la atención, las ventas, la producción y el inventario"
        patient -> mercadoPago "Paga sus ventas con tarjeta o Yape" "Chrome Custom Tab"

        # Contenedores
        optiflow.mobile -> optiflow.localDb "Guarda y lee la última información consultada" "Room"
        optiflow.mobile -> optiflow.backend.jwtFilter "Consume la API REST con token JWT" "HTTPS/JSON"
        optiflow.mobile -> maps "Muestra el mapa de ópticas" "Maps SDK for Android"
        optiflow.mobile -> arFilters "Aplica el probador virtual" "SDK"
        optiflow.mobile -> mercadoPago "Abre la página de pago de la preferencia" "HTTPS"
        fcm -> optiflow.mobile "Entrega las notificaciones push" "FCM"
        mercadoPago -> optiflow.backend.ccWebhook "Notifica el resultado de cada pago (webhook)" "HTTPS/JSON"

        # Componentes
        optiflow.backend.jwtFilter -> optiflow.backend.sbControllers "Deriva las solicitudes autenticadas"
        optiflow.backend.jwtFilter -> optiflow.backend.ccControllers "Deriva las solicitudes autenticadas"
        optiflow.backend.jwtFilter -> optiflow.backend.ptControllers "Deriva las solicitudes autenticadas"
        optiflow.backend.jwtFilter -> optiflow.backend.invControllers "Deriva las solicitudes autenticadas"
        optiflow.backend.jwtFilter -> optiflow.backend.nlControllers "Deriva las solicitudes autenticadas"

        optiflow.backend.sbControllers -> optiflow.backend.sbApp "Invoca comandos y consultas"
        optiflow.backend.sbApp -> optiflow.backend.sbDomain "Usa el modelo"
        optiflow.backend.sbApp -> optiflow.backend.sbInfra "Persiste y emite tokens"
        optiflow.backend.sbInfra -> optiflow.database "Lee y escribe" "JPA/JDBC"
        optiflow.backend.sbApp -> optiflow.backend.eventPublisher "Publica AppointmentBooked"

        optiflow.backend.ccControllers -> optiflow.backend.ccApp "Invoca comandos y consultas"
        optiflow.backend.ccWebhook -> optiflow.backend.paymentAdapter "Valida y traduce la notificación"
        optiflow.backend.ccWebhook -> optiflow.backend.ccApp "Ejecuta RecordPayment"
        optiflow.backend.ccApp -> optiflow.backend.ccDomain "Usa el modelo"
        optiflow.backend.ccApp -> optiflow.backend.ccInfra "Persiste"
        optiflow.backend.ccApp -> optiflow.backend.paymentAdapter "Crea la preferencia de pago"
        optiflow.backend.ccApp -> optiflow.backend.sbApp "Consulta la cita (GetAppointment)"
        optiflow.backend.paymentAdapter -> mercadoPago "Crea preferencias y consulta pagos" "HTTPS/JSON"
        optiflow.backend.ccInfra -> optiflow.database "Lee y escribe" "JPA/JDBC"
        optiflow.backend.ccApp -> optiflow.backend.eventPublisher "Publica SaleWasClosed"

        optiflow.backend.ptControllers -> optiflow.backend.ptApp "Invoca comandos y consultas"
        optiflow.backend.ptApp -> optiflow.backend.ptDomain "Usa el modelo"
        optiflow.backend.ptApp -> optiflow.backend.ptInfra "Persiste"
        optiflow.backend.ptApp -> optiflow.backend.ccApp "Consulta la venta cerrada (GetClosedSale)"
        optiflow.backend.ptInfra -> optiflow.database "Lee y escribe" "JPA/JDBC"
        optiflow.backend.eventPublisher -> optiflow.backend.ptApp "Entrega SaleWasClosed"
        optiflow.backend.ptApp -> optiflow.backend.eventPublisher "Publica WorkOrderStatusUpdated, DeliveryDelayNotified y OrderWasMarkedAsDelivered"

        optiflow.backend.invControllers -> optiflow.backend.invApp "Invoca comandos y consultas"
        optiflow.backend.invApp -> optiflow.backend.invDomain "Usa el modelo"
        optiflow.backend.invApp -> optiflow.backend.invInfra "Persiste"
        optiflow.backend.invInfra -> optiflow.database "Lee y escribe" "JPA/JDBC"
        optiflow.backend.eventPublisher -> optiflow.backend.invApp "Entrega SaleWasClosed"

        optiflow.backend.nlControllers -> optiflow.backend.nlApp "Invoca comandos y consultas"
        optiflow.backend.nlApp -> optiflow.backend.nlDomain "Usa el modelo"
        optiflow.backend.nlApp -> optiflow.backend.nlInfra "Persiste y consulta cumpleaños"
        optiflow.backend.nlInfra -> optiflow.backend.sbApp "Consulta GetPatientsByBirthday"
        optiflow.backend.nlApp -> optiflow.backend.fcmAdapter "Envía la notificación push"
        optiflow.backend.fcmAdapter -> fcm "Envía mensajes" "HTTPS"
        optiflow.backend.nlInfra -> optiflow.database "Lee y escribe" "JPA/JDBC"
        optiflow.backend.eventPublisher -> optiflow.backend.nlApp "Entrega AppointmentBooked y los eventos de producción"

        validation = deploymentEnvironment "Academic Validation Environment" {
            deploymentNode "Dispositivo del visitante" "Computadora o celular." "Navegador web" {
                deploymentNode "GitHub Pages" "Hosting de sitios estáticos publicado desde la rama main." "GitHub" {
                    landingInstance = containerInstance optiflow.landing
                }
            }
            deploymentNode "Render" "Plataforma en la nube, región Frankfurt." "Render" {
                deploymentNode "Web Service Logix-OptiFlow-Back-End" "Desplegado desde la rama develop; expone la API REST en /api/v1 y el webhook público /api/v1/payment-notifications." "Docker, eclipse-temurin:21-jre" {
                    backendInstance = containerInstance optiflow.backend
                }
                deploymentNode "Render PostgreSQL" "Base de datos administrada por Render." "PostgreSQL 16" {
                    databaseInstance = containerInstance optiflow.database
                }
            }
            firebase = deploymentNode "Firebase" "Proyecto Optiflow." "Google Firebase" {
                appDistribution = infrastructureNode "Firebase App Distribution" "Distribuye el APK a los evaluadores del grupo optiflow-testers." "Firebase App Distribution"
            }
            androidDevice = deploymentNode "Dispositivo Android de prueba" "Dispositivo del paciente o del personal." "Android 8.0 o superior" {
                mobileInstance = containerInstance optiflow.mobile
                localDbInstance = containerInstance optiflow.localDb
                camera = infrastructureNode "Cámara del dispositivo" "Escáner de monturas y probador virtual." "CameraX"
            }
            deploymentNode "Servicios externos" "" "Internet" {
                mercadoPagoInstance = softwareSystemInstance mercadoPago
                fcmInstance = softwareSystemInstance fcm
                mapsInstance = softwareSystemInstance maps
                arInstance = softwareSystemInstance arFilters
            }
            validation.firebase.appDistribution -> validation.androidDevice.mobileInstance "Distribuye e instala el APK" "HTTPS"
            validation.androidDevice.mobileInstance -> validation.androidDevice.camera "Usa la cámara" "CameraX"
        }
    }

    views {
        systemContext optiflow "SystemContext" "Diagrama de contexto C4 de OptiFlow." {
            include *
            autoLayout lr
        }

        container optiflow "Containers" "Diagrama de contenedores C4 de OptiFlow con un único backend." {
            include *
            autoLayout lr
        }

        component optiflow.backend "Components-SearchBooking" "Componentes del Search & Booking Context." {
            include optiflow.mobile optiflow.database optiflow.backend.jwtFilter optiflow.backend.eventPublisher
            include optiflow.backend.sbControllers optiflow.backend.sbApp optiflow.backend.sbDomain optiflow.backend.sbInfra optiflow.backend.nlInfra optiflow.backend.ccApp
            autoLayout lr
        }

        component optiflow.backend "Components-ClinicalCommercial" "Componentes del Clinical & Commercial Context." {
            include optiflow.mobile optiflow.database mercadoPago optiflow.backend.jwtFilter optiflow.backend.eventPublisher optiflow.backend.sbApp
            include optiflow.backend.ccControllers optiflow.backend.ccWebhook optiflow.backend.ccApp optiflow.backend.ccDomain optiflow.backend.ccInfra optiflow.backend.paymentAdapter
            autoLayout lr
        }

        component optiflow.backend "Components-ProductionTracking" "Componentes del Production & Tracking Context." {
            include optiflow.mobile optiflow.database optiflow.backend.jwtFilter optiflow.backend.eventPublisher optiflow.backend.ccApp
            include optiflow.backend.ptControllers optiflow.backend.ptApp optiflow.backend.ptDomain optiflow.backend.ptInfra
            autoLayout lr
        }

        component optiflow.backend "Components-Inventory" "Componentes del Store Management & Inventory Context." {
            include optiflow.mobile optiflow.database optiflow.backend.jwtFilter optiflow.backend.eventPublisher
            include optiflow.backend.invControllers optiflow.backend.invApp optiflow.backend.invDomain optiflow.backend.invInfra
            autoLayout lr
        }

        component optiflow.backend "Components-NotificationLoyalty" "Componentes del Notification & Loyalty Context." {
            include optiflow.mobile optiflow.database fcm optiflow.backend.jwtFilter optiflow.backend.eventPublisher optiflow.backend.sbApp
            include optiflow.backend.nlControllers optiflow.backend.nlApp optiflow.backend.nlDomain optiflow.backend.nlInfra optiflow.backend.fcmAdapter
            autoLayout lr
        }

        deployment optiflow validation "Deployment" "Deployment Diagram de OptiFlow." {
            include *
            autoLayout lr
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                shape Person
                background #08427b
            }
            element "Software System" {
                background #1168bd
            }
            element "External" {
                background #999999
            }
            element "Container" {
                background #438dd5
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Database" {
                shape Cylinder
            }
            element "Mobile App" {
                shape MobileDevicePortrait
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Infrastructure Node" {
                background #ffffff
                color #000000
            }
        }
    }
}
