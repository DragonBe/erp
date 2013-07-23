"use strict";

/**
 * threads.html
 */

/**
 * start program
 */
JKY.start_program = function() {
	JKY.App = JKY.Application;
	JKY.App.set(
		{ object_name	: 'JKY.App'
		, program_name	: 'ThreadForecast'
		, table_name	: 'ThreadForecast'
		, specific		: ''
		, select		: 'All'
		, filter		: ''
		, sort_by		: 'thread_sequence ASC, thread_name'
		, sort_seq		: 'ASC'
		, focus			: 'jky-thread-name'
		});
	JKY.App.init();
};

/**
 *	set initial values (run only once per load)
 */
JKY.set_initial_values = function() {
	JKY.set_side_active('jky-planning-threads');
	JKY.set_side_active('jky-threads-threads');
	JKY.set_side_active('jky-production-threads');
	JKY.set_html('jky-compositions'		, JKY.set_configs('Thread Compositions', '', ''));
	JKY.set_html('jky-thread-groups'	, JKY.set_configs('Thread Groups', '', ''));
	JKY.set_html('jky-app-select'		, JKY.set_configs('Thread Groups', JKY.App.get('select'), 'All'));
	JKY.set_html('jky-app-select-label', JKY.t('Group'));
	JKY.show('jky-app-select-line');
};

/**
 *	set table row
 */
JKY.set_table_row = function(the_row) {
	var my_html = ''
		+  '<td class="jky-thread-group"	>' + the_row.thread_group		+ '</td>'
		+  '<td class="jky-thread-name"		>' + the_row.thread_name		+ '</td>'
		+  '<td class="jky-supplier-name"	>' + the_row.supplier_name		+ '</td>'
		+  '<td class="jky-current-balance"	>' + the_row.current_balance	+ '</td>'
		+  '<td class="jky-forecast-past"	>' + the_row.forecast_past		+ '</td>'
		+  '<td class="jky-forecast-month-1">' + the_row.forecast_month_1	+ '</td>'
		+  '<td class="jky-forecast-month-2">' + the_row.forecast_month_2	+ '</td>'
		+  '<td class="jky-forecast-month-3">' + the_row.forecast_month_3	+ '</td>'
		+  '<td class="jky-forecast-future"	>' + the_row.forecast_future	+ '</td>'
		;
	return my_html;
};

/**
 *	set form row
 */
JKY.set_form_row = function(the_row) {
	JKY.set_value	('jky-ncm'				, the_row.ncm			);
	JKY.set_value	('jky-thread-name'		, the_row.name			);
	JKY.set_option	('jky-thread-groups'	, the_row.thread_group	);
//	JKY.set_value	('jky-thread-color'		, the_row.thread_color	);
	JKY.set_option	('jky-compositions'		, the_row.composition	);
};

/**
 *	set add new row
 */
JKY.set_add_new_row = function() {
	JKY.set_value	('jky-ncm'				, '' );
	JKY.set_value	('jky-thread-name'		, '' );
	JKY.set_option	('jky-thread-groups'	, '' );
//	JKY.set_value	('jky-thread-color'		, '0');
	JKY.set_option	('jky-compositions'		, '0');
};

/**
 *	get form set
 */
JKY.get_form_set = function() {
	var my_set = ''
		+            'ncm=\'' + JKY.get_value	('jky-ncm'				) + '\''
		+          ', name=\'' + JKY.get_value	('jky-thread-name'		) + '\''
		+  ', thread_group=\'' + JKY.get_value	('jky-thread-groups'	) + '\''
//		+  ', thread_color=\'' + JKY.get_value	('jky-thread-color'		) + '\''
		+   ', composition=\'' + JKY.get_value	('jky-compositions'		) + '\''
		;
	return my_set;
};