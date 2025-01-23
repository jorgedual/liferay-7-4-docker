# Liferay 7.4 Q4
FROM liferay/dxp:2024.q4.1

# Instalar herramientas adicionales (opcional)
USER root
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Configurar Java (usar Java 21 que viene por defecto en la imagen)
# No es necesario cambiar la versión de Java manualmente, ya que la imagen ya incluye Zulu 21.
# Por lo tanto, estas variables relacionadas con Java no son necesarias:
# ENV JAVA_VERSION=17
# ENV JAVA_HOME=/opt/java/openjdk
# ENV PATH "${JAVA_HOME}/bin:${PATH}"

# Variables de entorno necesarias para la base de datos
ENV LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.postgresql.Driver
ENV LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL=jdbc:postgresql://postgres:5432/liferay
ENV LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=liferay
ENV LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=liferay

# Cambiar al usuario de Liferay
USER liferay

# Configuración final (opcional)
# Descomenta las siguientes líneas si necesitas copiar configuraciones personalizadas:
# COPY ./custom-configs /opt/liferay/configs
# COPY portal-ext.properties /opt/liferay/portal-ext.properties

# Exponer el puerto 8080 para Liferay
EXPOSE 8080
