# Liferay 7.4 con PostgreSQL - Configuración con Docker

Este proyecto proporciona una forma sencilla de ejecutar una instancia de Liferay 7.4 con PostgreSQL utilizando Docker y Docker Compose.

## Requisitos previos

Antes de ejecutar la configuración de Docker Compose, asegúrate de tener lo siguiente instalado en tu máquina:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Mínimo 4GB de RAM disponible
- Al menos 10GB de espacio en disco

## Pasos para ejecutar el proyecto

### 1. Clonar el repositorio

Clona el repositorio a tu máquina local y navega a la carpeta del proyecto:

```bash
git clone https://github.com/jorgedual/liferay-7-4-docker.git
cd liferay-7-4-docker
```

### 2. Configuración del entorno

El proyecto incluye los siguientes archivos principales:

- `docker-compose.yml`: Configuración de los servicios de Liferay y PostgreSQL
- `Dockerfile`: Configuración de la imagen de Liferay
- `portal-ext.properties`: Propiedades de configuración de Liferay

Antes de iniciar, puedes modificar las siguientes variables en el archivo `docker-compose.yml` según tus necesidades:

- `POSTGRES_USER`: Usuario de la base de datos (por defecto: liferay)
- `POSTGRES_PASSWORD`: Contraseña de la base de datos (por defecto: liferay)
- `POSTGRES_DB`: Nombre de la base de datos (por defecto: liferay)

### 3. Construir y ejecutar los contenedores

Para construir y ejecutar los contenedores, ejecuta:

```bash
docker-compose up --build
```

Para ejecutar los contenedores en modo detached (background):

```bash
docker-compose up -d
```

### 4. Acceder a Liferay

Una vez que los contenedores estén en ejecución:

1. Abre tu navegador web
2. Accede a `http://localhost:8080`
3. La primera vez que accedas, Liferay realizará la configuración inicial.
4. En el primer inicio de sesión ingresa con las credenciales:

```
user: test@liferay.com
password: test
```

5. Una vez que hayas iniciado sesión, te solicitará realizar cambio de contraseña y agregar una respuesta a la pregunta de recuperación"

### 5. Gestión de los contenedores

Comandos útiles para gestionar los contenedores:

```bash
# Detener los contenedores
docker-compose down

# Ver los logs
docker-compose logs -f

# Ver los logs de un servicio específico
docker-compose logs -f liferay
docker-compose logs -f postgres

# Reiniciar los servicios
docker-compose restart
```

## Estructura de directorios

```
.
├── docker-compose.yml
├── Dockerfile
├── portal-ext.properties
└── README.md
```

## Volúmenes persistentes

Esta configuración crea dos volúmenes persistentes:

- `liferay_data`: Almacena los datos de Liferay
- `postgres_data`: Almacena los datos de PostgreSQL

Los datos persistirán incluso después de detener los contenedores.

## Solución de problemas comunes

### Error de memoria insuficiente

Si encuentras errores de memoria, asegúrate de que Docker tiene asignados al menos 4GB de RAM:

1. Abre Docker Desktop
2. Ve a Configuración > Recursos
3. Ajusta la memoria asignada

### Error de conexión a la base de datos

Si Liferay no puede conectarse a PostgreSQL:

1. Verifica que el servicio de PostgreSQL está en ejecución:

```bash
docker-compose ps
```

2. Comprueba los logs de PostgreSQL:

```bash
docker-compose logs postgres
```

### Problemas de rendimiento

Para mejorar el rendimiento:

1. Aumenta los recursos asignados a Docker
2. Utiliza volúmenes montados en lugar de bind mounts
3. Considera usar un SSD para los volúmenes persistentes

## Contribuir

Las contribuciones son bienvenidas. Por favor, abre un issue o pull request para sugerir cambios o mejoras.
