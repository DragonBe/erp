DROP   TABLE IF     EXISTS Products;
CREATE TABLE IF NOT EXISTS Products
( id				BIGINT				NOT NULL AUTO_INCREMENT
, created_by		BIGINT				DEFAULT NULL
, created_at		DATETIME			DEFAULT NULL
, updated_by		BIGINT				DEFAULT NULL
, updated_at		DATETIME			DEFAULT NULL
, status			VARCHAR(32)			DEFAULT 'Active'

, product_name		VARCHAR(255)		DEFAULT NULL
, product_type		VARCHAR(32)			DEFAULT 'Tubular'
, start_date		DATE				DEFAULT NULL
, photo				VARCHAR(255)		DEFAULT NULL

, PRIMARY KEY(id)
, UNIQUE(product_name)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1
;
ALTER TABLE Products		ADD COLUMN photo			VARCHAR(255)		DEFAULT NULL	AFTER start_date;
ALTER TABLE Products		CHANGE name product_name	VARCHAR(255)		DEFAULT NULL	;
