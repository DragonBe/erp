DROP   TABLE IF     EXISTS Incomings;
CREATE TABLE IF NOT EXISTS Incomings
( id				BIGINT				NOT NULL AUTO_INCREMENT
, created_by		BIGINT				DEFAULT NULL
, created_at		DATETIME			DEFAULT NULL
, updated_by		BIGINT				DEFAULT NULL
, updated_at		DATETIME			DEFAULT NULL
, status			VARCHAR(32)			DEFAULT 'Active'

, number			VARCHAR(32)			DEFAULT NULL
, received_at		DATETIME			DEFAULT NULL
, supplier_id		BIGINT				DEFAULT NULL
, invoice_number	VARCHAR(32)			DEFAULT NULL
, invoice_date		DATE				DEFAULT NULL
, invoice_weight	DECIMAL(10,2)		DEFAULT 0
, invoice_amount	DECIMAL(10,2)		DEFAULT 0
, real_weight		DECIMAL(10,2)		DEFAULT 0
, real_amount		DECIMAL(10,2)		DEFAULT 0

, PRIMARY KEY(id)
, UNIQUE(number)
, KEY supplier	(supplier_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=100001
;