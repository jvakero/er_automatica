SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `Synvent` ;
CREATE SCHEMA IF NOT EXISTS `Synvent` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci ;
USE `Synvent` ;

-- -----------------------------------------------------
-- Table `Synvent`.`CAT_CATEGORIA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`CAT_CATEGORIA` (
  `id_categoria` INT NOT NULL ,
  `desc_categoria` VARCHAR(45) NOT NULL ,
  `valido` TINYINT(1) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_categoria`) )
AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX `id_categoria_UNIQUE` ON `Synvent`.`CAT_CATEGORIA` (`id_categoria` ASC) ;

-- -----------------------------------------------------
-- Table `Synvent`.`CAT_ENT_FEDERATIVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`CAT_ENT_FEDERATIVA` (
  `id_ent_federativa` INT NOT NULL ,
  `desc_corta` VARCHAR(20) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `valido` TINYINT(1) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_ent_federativa`) )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `id_ent_federativa_UNIQUE` ON `Synvent`.`CAT_ENT_FEDERATIVA` (`id_ent_federativa` ASC) ;

-- -----------------------------------------------------
-- Table `Synvent`.`CAT_TIPO_PERSONA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`CAT_TIPO_PERSONA` (
  `id_tipo_persona` INT NOT NULL ,
  `desc_corta` VARCHAR(20) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `valido` TINYINT(1) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_tipo_persona`) )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `id_tipo_persona_UNIQUE` ON `Synvent`.`CAT_TIPO_PERSONA` (`id_tipo_persona` ASC) ;

-- -----------------------------------------------------
-- Table `Synvent`.`CAT_MEDIDA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`CAT_MEDIDA` (
  `id_medida` INT NOT NULL ,
  `desc_corta` VARCHAR(20) NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `valido` TINYINT(1) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NOT NULL ,
  PRIMARY KEY (`id_medida`) )
AUTO_INCREMENT = 1;
CREATE UNIQUE INDEX `id_medida_UNIQUE` ON `Synvent`.`CAT_MEDIDA` (`id_medida` ASC) ;


-- -----------------------------------------------------
-- Table `Synvent`.`CAT_MARCA_MERCANCIA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`CAT_MARCA_MERCANCIA` (
  `id_marca_merca` INT NOT NULL ,
  `desc_corta` VARCHAR(20) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `valido` TINYINT(1) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_marca_merca`) )
AUTO_INCREMENT = 1;
CREATE UNIQUE INDEX `id_marca_merca_UNIQUE` ON `Synvent`.`CAT_MARCA_MERCANCIA` (`id_marca_merca` ASC) ;


-- -----------------------------------------------------
-- Table `Synvent`.`CAT_TIPO_VENTA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`CAT_TIPO_VENTA` (
  `id_tipo_venta` INT NOT NULL ,
  `desc_corta` VARCHAR(20) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `valido` TINYINT(1) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_tipo_venta`) )
AUTO_INCREMENT = 1;
CREATE UNIQUE INDEX `id_tipo_venta_UNIQUE` ON `Synvent`.`CAT_TIPO_VENTA` (`id_tipo_venta` ASC) ;



-- -----------------------------------------------------
-- Table `Synvent`.`PERSONA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`PERSONA` (
  `id_persona` INT NOT NULL ,
  `nombre` VARCHAR(20) NOT NULL ,
  `apellido_pat` VARCHAR(45) NOT NULL ,
  `apellido_mat` VARCHAR(45) NULL ,
  `comentarios` VARCHAR(30) NULL ,
  `id_direccion` INT NULL ,
  `id_tipo_persona` INT NULL ,  
  `rfc` VARCHAR(30) NULL ,
  `email` VARCHAR(40) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_persona`) ,
  CONSTRAINT `id_direccion`
    FOREIGN KEY (`id_direccion` )
    REFERENCES `Synvent`.`DIRECCION` (`id_direccion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_persona`
    FOREIGN KEY (`id_tipo_persona` )
    REFERENCES `Synvent`.`CAT_TIPO_PERSONA` (`id_tipo_persona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `id_persona_UNIQUE` ON `Synvent`.`PERSONA` (`id_persona` ASC) ;
CREATE INDEX `id_direccion_idx` ON `Synvent`.`PERSONA` (`id_direccion` ASC) ;

-- -----------------------------------------------------
-- Table `Synvent`.`DIRECCION`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`DIRECCION` (
  `id_direccion` INT NOT NULL ,
  `calle` VARCHAR(45) NULL ,
  `num_interior` VARCHAR(10) NOT NULL ,
  `num_exterior` VARCHAR(10) NOT NULL ,
  `colonia_poblacion` VARCHAR(45) NOT NULL , 
  `municipio_deleg` VARCHAR(45) NOT NULL , 
  `id_entidad_fed` INT NOT NULL ,
  `cp` VARCHAR(45) NULL ,
   `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_direccion`),
   CONSTRAINT `id_entidad_fed`
    FOREIGN KEY (`id_entidad_fed` )
    REFERENCES `Synvent`.`CAT_ENT_FEDERATIVA` (`id_ent_federativa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION )
AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX `id_direccion_UNIQUE` ON `Synvent`.`DIRECCION` (`id_direccion` ASC) ;

-- -----------------------------------------------------
-- Table `Synvent`.`SUCURSAL`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`SUCURSAL` (
  `id_sucursal` INT NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `id_direccion` VARCHAR(45) NULL ,
  `responsable` INT NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_sucursal`) ,
   CONSTRAINT `responsable`
    FOREIGN KEY (`responsable` )
    REFERENCES `Synvent`.`PERSONA` (`id_persona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION -- ,
 --  CONSTRAINT `id_direccion`
 --    FOREIGN KEY (`id_direccion` )
 --   REFERENCES `Synvent`.`DIRECCION` (`id_direccion` )
  --  ON DELETE NO ACTION
  --  ON UPDATE NO ACTION
    )
ENGINE = InnoDB;
 CREATE UNIQUE INDEX `id_sucursal_UNIQUE` ON `Synvent`.`SUCURSAL` (`id_sucursal` ASC) ;
 CREATE INDEX `responsable_idx` ON `Synvent`.`SUCURSAL` (`responsable` ASC) ;
--  CREATE INDEX `id_direccion_idx` ON `Synvent`.`SUCURSAL` (`id_direccion` ASC) ;


-- -----------------------------------------------------
-- Table `Synvent`.`Vehiculo`
-- -----------------------------------------------------
 -- CREATE  TABLE IF NOT EXISTS `Synvent`.`Vehiculo` (
 -- `idVehiculo` INT NOT NULL ,
 -- `descripcion` VARCHAR(45) NOT NULL ,
 -- `valido` TINYINT(1) NULL ,
 -- PRIMARY KEY (`idVehiculo`) )
 -- AUTO_INCREMENT = 1;

-- CREATE UNIQUE INDEX `idVehiculo_UNIQUE` ON `Synvent`.`Vehiculo` (`idVehiculo` ASC) ;


-- -----------------------------------------------------
-- Table `Synvent`.`PRODUCTO`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`PRODUCTO` (
  `id_producto` INT NOT NULL ,
  `codigo_barra` VARCHAR(14) NULL ,
  `cve_producto` VARCHAR(25) NULL ,
  `descripcion_prod` VARCHAR(90) NULL ,
  `cantidad_prod` FLOAT NULL ,
  `modelo_vehiculo` INT NULL ,
  `id_marca_producto` INT NULL ,
  `id_medida` INT NULL ,
  `id_categoria` INT NULL ,
  `valido` TINYINT(1) NULL ,
  `stock` INT NULL ,-- posible sacarlo de aqui a una nueva tabla
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_producto`) ,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria` )
    REFERENCES `Synvent`.`CAT_CATEGORIA` (`id_categoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_medida`
    FOREIGN KEY (`id_medida` )
    REFERENCES `Synvent`.`CAT_MEDIDA` (`id_medida` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_marca_producto`
    FOREIGN KEY (`id_marca_producto` )
    REFERENCES `Synvent`.`CAT_MARCA_MERCANCIA` (`id_marca_merca` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION -- ,
 -- CONSTRAINT `modeloVehiculo` -- cambiar este constraitn con nueva tabla
 --   FOREIGN KEY (`modeloVehiculo` )
  --  REFERENCES `Synvent`.`Vehiculo` (`idVehiculo` )
  --  ON DELETE NO ACTION
 --   ON UPDATE NO ACTION
 )
ENGINE = InnoDB
COMMENT = 'CREATE TABLE [Medida] (\n	[cvemedida] [varchar] (25) NOT NULL /* comment truncated */ /* ,
	[medida] [varchar] (25) NOT NULL 
) ON [PRIMARY]*/';

CREATE INDEX `categoria_idx` ON `Synvent`.`PRODUCTO` (`id_categoria` ASC) ;
CREATE INDEX `medida_idx` ON `Synvent`.`PRODUCTO` (`id_medida` ASC) ;
CREATE INDEX `marcaProducto_idx` ON `Synvent`.`PRODUCTO` (`id_marca_producto` ASC) ;
-- CREATE INDEX `modeloVehiculo_idx` ON `Synvent`.`PRODUCTO` (`modeloVehiculo` ASC) ;
CREATE UNIQUE INDEX `id_producto_UNIQUE` ON `Synvent`.`PRODUCTO` (`id_producto` ASC) ;

-- ---------------------------------------------------
-- Table `Synvent`.`PRECIO_PRODUCTO`
-- -----------------------------------------------------
  CREATE  TABLE IF NOT EXISTS `Synvent`.`PRECIO_PRODUCTO` (
  `id_precio` INT NOT NULL ,
  `id_producto` INT NOT NULL ,
  `costo` DOUBLE NOT NULL ,
  `precio` DOUBLE NOT NULL ,
  `valido` TINYINT(1) NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_precio`,`id_producto`),
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto` )
    REFERENCES `Synvent`.`PRODUCTO` (`id_producto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION )
  AUTO_INCREMENT = 1;



-- -----------------------------------------------------
-- Table `Synvent`.`VENTA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`VENTA` (
  `id_venta` INT NOT NULL ,
  `numero_venta` VARCHAR(45) NULL ,
  `id_tipo_venta` INT NOT NULL ,
  -- `id_producto` INT NULL , -- cambiar por nueva tabla de productos_venta
  `porcentaje_descuento` FLOAT  NULL ,
  `piezas` DOUBLE NOT NULL ,
  `subtotal` DOUBLE NULL ,
  `total` DOUBLE NULL ,
  `fecha_compra` DATETIME NULL , 
  `realizo_factura` TINYINT(1) NULL ,
  `id_usuario` INT NULL ,
  `id_cliente` INT NULL ,
  `fecha_creacion` DATETIME NOT NULL ,
  `creado_by` VARCHAR(20) NOT NULL ,
  `fecha_ult_modific` DATETIME NULL ,
  PRIMARY KEY (`id_venta`) ,
  CONSTRAINT `id_tipo_venta`
    FOREIGN KEY (`id_tipo_venta` )
    REFERENCES `Synvent`.`CAT_TIPO_VENTA` (`id_tipo_venta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  -- CONSTRAINT `id_producto`
  --  FOREIGN KEY (`id_producto` )
  --  REFERENCES `Synvent`.`PRODUCTO` (`id_producto` )
  --  ON DELETE NO ACTION
  --  ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `Synvent`.`USUARIO` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente` )
    REFERENCES `Synvent`.`PERSONA` (`id_persona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
AUTO_INCREMENT = 1;

CREATE INDEX `tipoVenta_idx` ON `Synvent`.`VENTA` (`id_tipo_venta` ASC) ;
-- CREATE INDEX `id_producto_idx` ON `Synvent`.`VENTA` (`id_producto` ASC) ;
CREATE INDEX `numero_venta_idx` ON `Synvent`.`VENTA` (`numero_venta` ASC) ;


-- -----------------------------------------------------
-- Table `Synvent`.`USUARIO`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`USUARIO` (
  `id_usuario` INT NOT NULL ,
  `usuario` VARCHAR(45) NOT NULL ,
  `id_persona` INT NOT NULL , -- falta constrain con PERSONA
  `contrasena` VARCHAR(20) NOT NULL ,
  `valido` TINYINT(1) NULL ,
  PRIMARY KEY (`id_usuario`),
   CONSTRAINT `id_persona`
    FOREIGN KEY (`id_persona` )
    REFERENCES `Synvent`.`PERSONA` (`id_persona` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_usuario_UNIQUE` ON `Synvent`.`USUARIO` (`id_usuario` ASC) ;
CREATE INDEX `usuario_idx` ON `Synvent`.`USUARIO` (`usuario` ASC) ;





-- -----------------------------------------------------
-- Table `Synvent`.`COMPRA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Synvent`.`COMPRA` (
  `id_compra` INT NOT NULL ,
  `num_factura` VARCHAR(45) NULL ,
  `proveedor` VARCHAR(45) NOT NULL , -- posible nueva tabla
  `mes_registro` VARCHAR(45) NOT NULL ,
  `total` VARCHAR(45) NOT NULL , -- posible cambio de tipo de dato
  `subtotal` VARCHAR(45) NOT NULL , -- posible cambio de tipo de dato
  `fecha` VARCHAR(45) NOT NULL , -- por que varchar ?
  `cve_factura` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_compra`) )
AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX `id_compra_UNIQUE` ON `Synvent`.`COMPRA` (`id_compra` ASC) ;





USE `Synvent` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
