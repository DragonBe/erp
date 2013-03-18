DROP   TABLE IF     EXISTS Configs;
CREATE TABLE IF NOT EXISTS Configs
( id                BIGINT				NOT NULL AUTO_INCREMENT
, created_at        DATETIME			DEFAULT NULL
, created_by        BIGINT				DEFAULT NULL
, updated_at        DATETIME			DEFAULT NULL
, updated_by        BIGINT				DEFAULT NULL
, status            VARCHAR(32)         DEFAULT 'Active'

, company_id		BIGINT				DEFAULT 1
, sequence			INTEGER				DEFAULT 0
, group_set			VARCHAR(32)			DEFAULT 'Root'
, name				VARCHAR(255)		DEFAULT NULL
, value				TEXT				DEFAULT NULL

, PRIMARY KEY(id)
, KEY sequence	(company_id	, sequence)
, KEY group_set	(group_set	, sequence)
, KEY name		(name		, sequence)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1
;