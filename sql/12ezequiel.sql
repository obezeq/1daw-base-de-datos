/*
-- Nombre: Ezequiel Ortega Bravo
-- Fecha: 11/12/2024
-- Clase: 1ºDAW B
*/

/*

-- Código para crear la base de datos

CREATE DATABASE cruceros
    WITH
    OWNER = usuariot
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

*/

/*
-- Manual basico para un usuario que no sabe de postgresql:

-- * PRIMARY KEY => el identificador único del campo.
-- * SERIAL => el campo va autoincrementando automaticamenta a medida que se van agregando valores a la tabla de la base de datos.
-- * NOT NULL => el campo no puede ser nulo.

*/

-- Borro la tabla de cruceros y utilizo cascade para borrar todas las restricciones que pueda haber.
DROP TABLE IF EXISTS CRUCEROS CASCADE;
-- Creamos la tabla de cruceros
CREATE TABLE CRUCEROS (
    id_crucero SERIAL PRIMARY KEY,
    nombre_barco VARCHAR(100) NOT NULL,
    num_pasajeros INT NOT NULL,
    fecha_llegada DATE NOT NULL,
    procedencia VARCHAR(100) NOT NULL
);

-- Borro la tabla de cruceros y utilizo cascade para borrar todas las restricciones que pueda haber.
DROP TABLE IF EXISTS MUELLES CASCADE;
-- Creamos la tabla de muelles
CREATE TABLE MUELLES (
    id_muelle SERIAL PRIMARY KEY,
    capacidad_max_toneladas NUMERIC(10,2) NOT NULL,
    estado VARCHAR(10) NOT NULL CHECK (estado IN ('ocupado', 'libre')),
    tipo_muelle VARCHAR(20) NOT NULL CHECK (tipo_muelle IN ('pasajeros', 'carga'))
);

-- Borro la tabla de cruceros y utilizo cascade para borrar todas las restricciones que pueda haber.
DROP TABLE IF EXISTS GUIAS_TURISTICOS CASCADE;
-- Creamos la tabla de guías turísticos
CREATE TABLE GUIAS_TURISTICOS (
    id_guia SERIAL PRIMARY KEY,
    nombre_guia VARCHAR(100) NOT NULL,
    idiomas VARCHAR(100) NOT NULL, -- El usuario tiene que dominar un idioma aunque sea el nativo
    num_licencia VARCHAR(20) UNIQUE NOT NULL,
    fecha_contratacion DATE NOT NULL
);


-- Borro la tabla de asignaciones a los cruceros y utilizo casacade para borrar todas las restricciones que pueda haber.
DROP TABLE IF EXISTS ASIGNACIONES_CRUCEROS CASCADE;
-- Creamos la tabla de asignaciones a los cruceros la cual RELACIONAMOS los cruceros con los muelles gracias al modelo SQL que es maravilloso.
CREATE TABLE ASIGNACIONES_CRUCEROS (
    id_crucero INT NOT NULL,
    id_muelle INT NOT NULL,
    fecha_asignacion DATE DEFAULT CURRENT_DATE NOT NULL, -- Le pongo que si no asigno un date, que ponga por defecto la que se tiene en el horario actual porque es una fecha de asignación y cuando se crea la relación de asignación se cogerá la fecha actual pues la acabas de asginar.
    hora_llegada TIME NOT NULL,
    CONSTRAINT fk_crucero FOREIGN KEY (id_crucero) REFERENCES CRUCEROS(id_crucero)
        ON DELETE CASCADE -- Si se elimina un crucero, se eliminan sus asignaciones
        ON UPDATE CASCADE, -- Si se actualiza el ID del crucero, se actualizan en las asignaciones
    CONSTRAINT fk_muelle FOREIGN KEY (id_muelle) REFERENCES MUELLES(id_muelle)
        ON DELETE RESTRICT -- Evita eliminar un muelle si tiene asignaciones
        ON UPDATE CASCADE, -- Si se actualiza el ID del muelle, se actualiza en las asignaciones
    CONSTRAINT pk_asignaciones_cruceros PRIMARY KEY (id_crucero, id_muelle)
);


-- Borro la tabla las excursiones y utilizo casacade para borrar todas las restricciones que pueda haber.
DROP TABLE IF EXISTS EXCURSIONES CASCADE;
-- Creamos la tabla de las excursiones
CREATE TABLE EXCURSIONES (
    id_excursion SERIAL PRIMARY KEY,
    nombre_excursion VARCHAR(100) NOT NULL,
    duracion_estim_horas INT NOT NULL 
    CHECK (duracion_estim_horas > 0), -- Duración en horas, debe ser positiva.
    capacidad_max_pasajeros INTEGER NOT NULL 
    CHECK (capacidad_max_pasajeros > 0 AND capacidad_max_pasajeros < 1000) -- Capacidad máxima de pasajeros, debe ser positiva. Y ademas añadimos la capacidad máxima que depende del contexto y los requisitos del usuario se asignara una capcaidad máxima determinada, pero por defelto introducimos 1000 por si acaso.
);


-- Borro la tabla las asignaciones a los guías y utilizo casacade para borrar todas las restricciones que pueda haber.
DROP TABLE IF EXISTS ASIGNACIONES_GUIAS CASCADE;
-- Creamos una tabla de las asignaciones a los guías que será una relación de las excursiones con los guías turísticos.
CREATE TABLE ASIGNACIONES_GUIAS (
    id_guia INT NOT NULL,
    id_excursion INT NOT NULL,
    fecha_excursion DATE NOT NULL,
    observaciones TEXT,
    CONSTRAINT fk_guia
        FOREIGN KEY (id_guia)
        REFERENCES GUIAS_TURISTICOS(id_guia)
        ON DELETE CASCADE -- Si se elimina un guía, se eliminan sus asignaciones
        ON UPDATE CASCADE, -- Si se actualiza el ID del guía, se actualiza en las asignaciones
    CONSTRAINT fk_excursion
        FOREIGN KEY (id_excursion)
        REFERENCES EXCURSIONES(id_excursion)
        ON DELETE RESTRICT -- Evita eliminar una excursión si tiene asignaciones
        ON UPDATE CASCADE, -- Si se actualiza el ID de la excursión, se actualiza en las asignaciones
    CONSTRAINT pk_asignaciones_guias PRIMARY KEY (id_guia, id_excursion)
);


-- Borro la tabla de la utilización de equipos y utilizo casacade para borrar todas las restricciones que pueda haber.
DROP TABLE IF EXISTS UTILIZACION_EQUIPOS CASCADE;
-- Creamos la tabla de la utilizacion de los equipos
CREATE TABLE UTILIZACION_EQUIPOS (
    id_equipo SERIAL PRIMARY KEY, -- Identificador único del equipo
    tipo_equipo VARCHAR(50) NOT NULL, -- Tipo de equipo, no puede ser nulo
    fecha_mantenimiento DATE NOT NULL, -- Fecha de mantenimiento, no puede ser nulo
    estado_operativo BOOLEAN NOT NULL, -- Estado operativo, no puede ser nulo
    responsable INTEGER, -- Responsable del equipo
    CONSTRAINT fk_responsable
        FOREIGN KEY (responsable)
        REFERENCES GUIAS_TURISTICOS(id_guia)
        ON DELETE SET NULL -- Si se elimina un guía, el responsable se establece en NULL
        ON UPDATE CASCADE -- Si se actualiza el ID del guía, se actualiza en los equipos
);