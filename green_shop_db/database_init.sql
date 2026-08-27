-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`delivery_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`delivery_services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`delivery_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`delivery_methods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `delivery_services_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_delivery_methods_delivery_services1_idx` (`delivery_services_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_methods_delivery_services1`
    FOREIGN KEY (`delivery_services_id`)
    REFERENCES `mydb`.`delivery_services` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`addresses` (
  `id` BIGINT NOT NULL,
  `users_id` BIGINT NOT NULL,
  `city_name` VARCHAR(100) NULL,
  `delivery_data` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_adresses_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_adresses_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` DECIMAL NOT NULL,
  `stock_quantity` INT UNSIGNED NOT NULL DEFAULT 0,
  `product_type` VARCHAR(155) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`watering`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`watering` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`family`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`family` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `latin_name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sunlight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sunlight` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`colors` (
  `id` INT NOT NULL,
  `name` VARCHAR(155) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`manufacturer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `region` VARCHAR(255) NOT NULL,
  `country_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plants` (
  `products_id` BIGINT NOT NULL,
  `latin_name` VARCHAR(255) NOT NULL,
  `watering_id` INT NOT NULL,
  `family_id` INT NOT NULL,
  `sunlight_id` INT NOT NULL,
  `leaf_colors_id` INT NOT NULL,
  `origin_id` INT NOT NULL,
  `frost_resistance` TINYINT NOT NULL,
  `diameter` SMALLINT NOT NULL,
  `height` SMALLINT NOT NULL,
  INDEX `fk_plants_watering1_idx` (`watering_id` ASC) VISIBLE,
  INDEX `fk_plants_family1_idx` (`family_id` ASC) VISIBLE,
  INDEX `fk_plants_sunlight1_idx` (`sunlight_id` ASC) VISIBLE,
  INDEX `fk_plants_colors1_idx` (`leaf_colors_id` ASC) VISIBLE,
  INDEX `fk_plants_Manufacturer1_idx` (`origin_id` ASC) VISIBLE,
  INDEX `fk_plants_products1_idx` (`products_id` ASC) VISIBLE,
  PRIMARY KEY (`products_id`),
  CONSTRAINT `fk_plants_watering1`
    FOREIGN KEY (`watering_id`)
    REFERENCES `mydb`.`watering` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plants_family1`
    FOREIGN KEY (`family_id`)
    REFERENCES `mydb`.`family` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plants_sunlight1`
    FOREIGN KEY (`sunlight_id`)
    REFERENCES `mydb`.`sunlight` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plants_colors1`
    FOREIGN KEY (`leaf_colors_id`)
    REFERENCES `mydb`.`colors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plants_Manufacturer1`
    FOREIGN KEY (`origin_id`)
    REFERENCES `mydb`.`manufacturer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plants_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pots` (
  `products_id` BIGINT NOT NULL,
  `manufacturer_id` INT NOT NULL,
  `material` VARCHAR(100) NOT NULL,
  `diameter` SMALLINT NULL,
  PRIMARY KEY (`products_id`),
  INDEX `fk_pots_manufacturer1_idx` (`manufacturer_id` ASC) VISIBLE,
  INDEX `fk_pots_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_pots_manufacturer1`
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `mydb`.`manufacturer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pots_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`soil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`soil` (
  `products_id` BIGINT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`products_id`),
  CONSTRAINT `fk_soil_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fertilizers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fertilizers` (
  `products_id` BIGINT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`products_id`),
  CONSTRAINT `fk_table1_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_assembly`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product_assembly` (
  `plant_id` BIGINT NOT NULL,
  `add_item_id` BIGINT NOT NULL,
  INDEX `fk_product_assembly_products1_idx` (`plant_id` ASC) VISIBLE,
  PRIMARY KEY (`plant_id`, `add_item_id`),
  INDEX `fk_product_assembly_products2_idx` (`add_item_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_assembly_products1`
    FOREIGN KEY (`plant_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_assembly_products2`
    FOREIGN KEY (`add_item_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cart` (
  `id` BIGINT NOT NULL,
  `users_id` BIGINT NOT NULL,
  `cartcol` VARCHAR(45) NULL,
  INDEX `fk_carts_users1_idx` (`users_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_carts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cart_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cart_items` (
  `cart_id` BIGINT NOT NULL,
  `products_id` BIGINT NOT NULL,
  `quantity` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`cart_id`, `products_id`),
  INDEX `fk_cart_items_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_items_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `mydb`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_items_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `users_id` BIGINT NOT NULL,
  `addresses_id` BIGINT NOT NULL,
  `delivery_methods_id` INT NOT NULL,
  `total_price` DECIMAL(10,2) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `last_update` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_orders_addresses1_idx` (`addresses_id` ASC) VISIBLE,
  INDEX `fk_orders_delivery_methods1_idx` (`delivery_methods_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_addresses1`
    FOREIGN KEY (`addresses_id`)
    REFERENCES `mydb`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_delivery_methods1`
    FOREIGN KEY (`delivery_methods_id`)
    REFERENCES `mydb`.`delivery_methods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_items` (
  `products_id` BIGINT NOT NULL,
  `orders_id` BIGINT NOT NULL,
  `quantity` INT NOT NULL,
  `price_at_purchase` DECIMAL(10,2) NULL,
  PRIMARY KEY (`products_id`, `orders_id`),
  INDEX `fk_products_has_orders_orders1_idx` (`orders_id` ASC) VISIBLE,
  INDEX `fk_products_has_orders_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_orders_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_orders_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
