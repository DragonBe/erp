DROP   TABLE IF     EXISTS PurchaseLines;
CREATE TABLE IF NOT EXISTS PurchaseLines
( id                BIGINT				NOT NULL AUTO_INCREMENT
, created_at        DATETIME			DEFAULT NULL
, created_by        BIGINT				DEFAULT NULL
, updated_at        DATETIME			DEFAULT NULL
, updated_by        BIGINT				DEFAULT NULL
, status            VARCHAR(32)         DEFAULT 'Draft'

, purchase_id		BIGINT
, thread_id			BIGINT
, expected_dt		DATE				DEFAULT NULL
, scheduled_at		DATETIME			DEFAULT NULL
, expected_weight	DECIMAL(10,2)		DEFAULT 0
, received_weight	DECIMAL(10,2)		DEFAULT 0

, PRIMARY KEY(id)
, KEY purchase	(purchase_id)
, KEY thread	(thread_id	)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1
;