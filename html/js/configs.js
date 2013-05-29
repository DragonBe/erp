"use strict";

/**
 * controls.html
 */
var jky_program		= 'Configs';
var jky_table		= 'Configs';
var jky_select		= 'Root';
var jky_focus		= 'jky-name';
var jky_filter		= '';
var jky_specific	= '';
var jky_sort_by		= 'sequence, name';
var jky_sort_seq	=  0;				//	0=ASC, -1=DESC

var jky_count		=  0;
var jky_index		=  0;				//	0=Add New

JKY.rows		= [];
JKY.row 		= null;

/**
 * start program
 */
JKY.start_program = function(action) {
	JKY.display_trace('start_program - ' + jky_program);
	JKY.set_all_events(jky_program);
	JKY.set_initial_values(jky_program);
}

/**
 *	set all events (run only once per load)
 */
JKY.set_all_events = function(jky_program) {
	JKY.display_trace('set_all_events');
	if (JKY.is_loaded('jky-body')) {
		$('#jky-app-select'			).change(function() {JKY.Changes.can_leave(function() {JKY.change_select	();})});
		$('#jky-app-filter'			).change(function() {JKY.Changes.can_leave(function() {JKY.change_filter	();})});
		$('#jky-action-add-new'		).click (function() {JKY.Changes.can_leave(function() {JKY.process_add_new	();})});
		$('#jky-action-print'		).click (function() {JKY.Changes.can_leave(function() {JKY.process_print	();})});
		$('#jky-action-export'		).click (function() {JKY.Changes.can_leave(function() {JKY.process_export	();})});
		$('#jky-action-publish'		).click (function() {JKY.Changes.can_leave(function() {JKY.process_publish	();})});
		$('#jky-action-prev'		).click (function() {JKY.Changes.can_leave(function() {JKY.display_prev		();})});
		$('#jky-action-next'		).click (function() {JKY.Changes.can_leave(function() {JKY.display_next		();})});
		$('#jky-action-list'		).click (function() {JKY.Changes.can_leave(function() {JKY.display_list		();})});
		$('#jky-action-form'		).click (function() {JKY.Changes.can_leave(function() {JKY.display_form	   (1);})});
		$('#jky-action-save'		).click (function() {JKY.process_save();});
		$('#jky-action-reset'		).click (function() {JKY.Changes.can_leave(function() {JKY.reset_user		();})});
		$('#jky-action-delete'		).click (function() {JKY.Changes.can_leave(function() {JKY.process_delete	();})});
		$('#jky-action-cancel'		).click (function() {JKY.process_cancel();});
		$('#jky-check-all'			).click (function() {JKY.set_all_check(this);});

		$('#jky-form-data input[id]').each(function() {
			$(this).change(function() {JKY.process_change_input	(this);});
		});
		$('#jky-form-data select[id]').each(function() {
			$(this).change(function() {JKY.process_change_input	(this);});
		});
	}else{
		setTimeout(function() {JKY.set_all_events();}, 100);
	}
}

/**
 *	set initial values (run only once per load)
 */
JKY.set_initial_values = function(jky_program) {
	JKY.display_trace('set_initial_values');
	if (JKY.is_loaded('jky-body')) {
		JKY.set_menu_active('jky-menu-admin');
		JKY.set_side_active('jky-admin-configs');
		JKY.set_html('jky-app-breadcrumb'	, JKY.t(jky_program));
		JKY.set_html('jky-app-select'		, JKY.set_configs ('Root', jky_select, ''));
		JKY.set_html('jky-status'			, JKY.set_controls('Status Codes', 'Active', ''));
		JKY.display_list();
//		JKY.display_form(1);
		JKY.show('jky-side-admin'		);
		JKY.show('jky-app-header'		);
	}else{
		setTimeout(function() {JKY.set_initial_values();}, 100);
	}
}

JKY.change_select = function(){
	jky_select = JKY.get_value('jky-app-select');
	JKY.display_trace('change_select: ' + jky_select);
	JKY.display_list();
}

JKY.change_filter = function(){
	jky_filter = JKY.get_value('jky-app-filter');
	JKY.display_trace('change_filter: ' + jky_filter);
	JKY.display_list();
}

JKY.display_prev = function() {
	jky_index = (jky_index == 1) ? jky_count : (jky_index-1);
	JKY.display_row(jky_index);
}

JKY.display_next = function() {
	jky_index = (jky_index == jky_count) ? 1 : (jky_index+1);
	JKY.display_row(jky_index);
}

JKY.set_all_check = function(the_index) {
	if ($(the_index).is(':checked')) {
		$('#jky-table-body .jky-checkbox input').each(function() {$(this).attr('checked', 'checked');})
	}else{
		$('#jky-table-body .jky-checkbox input').each(function() {$(this).removeAttr('checked');})
	}
}

JKY.set_checkbox = function(the_index) {
	JKY.skip_form = true;
}

JKY.display_list = function() {
//	JKY.show('jky-app-filter'		);
	JKY.show('jky-app-more'			);
	JKY.hide('jky-app-navs'			);
	JKY.hide('jky-app-add-new'		);
	JKY.show('jky-app-counters'		);
	JKY.show('jky-action-add-new'	);
	JKY.hide('jky-action-print'		);
	JKY.hide('jky-action-save'		);
	JKY.hide('jky-action-copy'		);
	JKY.hide('jky-action-delete'	);
	JKY.hide('jky-action-cancel'	);
	JKY.hide('jky-action-publish'	);
	JKY.show('jky-app-table'		);
	JKY.hide('jky-app-form'			);
	JKY.load_table();
}

JKY.load_table = function() {
	JKY.show('jky-loading');
	var my_order_by = jky_sort_by + ' ' + (jky_sort_seq == 0 ? 'ASC' : 'DESC');
	var my_data =
		{ method	: 'get_index'
		, table		: jky_table
		, select	: jky_select
		, filter	: jky_filter
		, specific	: jky_specific
		, order_by	: my_order_by
		};
	JKY.ajax(false, my_data, JKY.process_load_success);
}

JKY.process_load_success = function(response) {
	JKY.display_trace('process_load_success');
	JKY.rows	= response.rows;
	jky_count	= JKY.rows.length;
	jky_index	= 1;
	var my_html = '';
	for(var i=0; i<jky_count; i++) {
		var my_row = JKY.rows[i];
		var my_checkbox = '<input type="checkbox" onclick="JKY.set_checkbox(this)" row_id=' + my_row.id + ' />';
		my_html += '<tr onclick="JKY.display_form(' + (i+1) + ')">'
				+  '<td class="jky-checkbox"		>' + my_checkbox			+ '</td>'
				+  '<td class="jky-sequence"		>' + my_row.sequence		+ '</td>'
				+  '<td class="jky-name"			>' + my_row.name			+ '</td>'
				+  '<td class="jky-value"			>' + my_row.value			+ '</td>'
				+  '<td class="jky-status"			>' + my_row.status			+ '</td>'
				+  '</tr>'
				;
	}
	JKY.set_html('jky-app-index', jky_index);
	JKY.set_html('jky-app-count', jky_count);
	JKY.set_html('jky-table-body', my_html );
	JKY.setTableWidthHeight('jky-app-table', 851, 221, 390, 115);
	JKY.hide('jky-loading');
}

JKY.display_form = function(index) {
	if (JKY.skip_form) {
		JKY.skip_form = false;
		return;
	}
//	JKY.show('jky-app-filter'		);
	JKY.hide('jky-app-more'			);
	JKY.show('jky-app-navs'			);
	JKY.hide('jky-app-add-new'		);
	JKY.show('jky-app-counters'		);
	JKY.show('jky-action-add-new'	);
	JKY.hide('jky-action-print'		);
	JKY.show('jky-action-save'		);
	JKY.hide('jky-action-reset'		);
	JKY.show('jky-action-copy'		);
	JKY.show('jky-action-delete'	);
	JKY.show('jky-action-cancel'	);
	JKY.hide('jky-app-table'		);
	JKY.show('jky-app-form'			);
	JKY.hide('jky-app-upload'		);
	JKY.display_row(index);
}

JKY.display_row = function(index) {
	JKY.show('jky-form-tabs');
	jky_index = index;
	JKY.row = JKY.get_row(jky_table, JKY.rows[index-1]['id']);
	JKY.rows[index-1] = JKY.row;
	JKY.set_html('jky-app-index', index);
	JKY.set_option	('jky-status'			, JKY.row.status		);
	JKY.set_value	('jky-sequence'			, JKY.row.sequence		);
	JKY.set_value	('jky-name'				, JKY.row.name			);
	JKY.set_value	('jky-value'			, JKY.row.value			);

	if (jky_select == 'Root' && JKY.row.name == 'Root') {
		JKY.hide('jky-action-save'		);
		JKY.hide('jky-action-copy'		);
		JKY.hide('jky-action-delete'	);
		JKY.hide('jky-action-cancel'	);
	}else{
		JKY.show('jky-action-save'		);
		JKY.show('jky-action-copy'		);
		JKY.show('jky-action-delete'	);
		JKY.show('jky-action-cancel'	);
	}
	JKY.set_focus(jky_focus);
}

JKY.process_add_new = function() {
	JKY.hide('jky-form-tabs');
//	JKY.hide('jky-app-filter'		);
	JKY.hide('jky-app-more'			);
	JKY.hide('jky-app-navs'			);
	JKY.show('jky-app-add-new'		);
	JKY.hide('jky-app-counters'		);
	JKY.hide('jky-action-add-new'	);
	JKY.hide('jky-action-print'		);
	JKY.show('jky-action-save'		);
	JKY.hide('jky-action-reset'		);
	JKY.hide('jky-action-copy'		);
	JKY.hide('jky-action-delete'	);
	JKY.show('jky-action-cancel'	);
	JKY.hide('jky-app-table'		);
	JKY.show('jky-app-form'			);
	JKY.hide('jky-app-upload'		);
	JKY.display_new();
}

JKY.display_new = function() {
	jky_index = 0;
	JKY.set_option	('jky-status'			, 'Active');
	JKY.set_value	('jky-sequence'			, 50);
	JKY.set_value	('jky-name'				, '');
	JKY.set_value	('jky-value'			, '');
	JKY.set_focus(jky_focus);
}

JKY.get_form_set = function() {
	var my_set = ''
		+       'group_set=\'' + jky_select + '\''
		+        ', status=\'' + JKY.get_value	('jky-status'			) + '\''
		+      ', sequence=  ' + JKY.get_value	('jky-sequence'			)
		+          ', name=\'' + JKY.get_value	('jky-name'				) + '\''
		+         ', value=\'' + JKY.get_value	('jky-value'			) + '\''
		;
	return my_set;
}

JKY.process_save = function() {
	if (JKY.is_invalid(null)) {
		return;
	}

	if (jky_index == 0) {
		JKY.process_insert();
	}else{
		JKY.process_update();
	}
	JKY.Changes.reset();
}

JKY.is_invalid = function(the_id) {
	var my_error = '';
	if (the_id == null || the_id == 'jky-full-name') {
		var my_full_name = JKY.get_value('jky-full-name');
		if (JKY.is_empty(my_full_name)) {
			my_error += JKY.set_is_required('Full Name');
		}
		var my_id = JKY.get_id('Contacts', 'full_name = \'' + my_full_name + '\'');
		if (!JKY.is_empty(my_id) && ( JKY.row == null || my_id != JKY.row.id)) {
			my_error += JKY.set_already_taken('Full Name');
		}
	}
	if (the_id == null || the_id == 'jky-contact-company') {
		if (!JKY.is_checked('jky-is-company')) {
			var my_company_id = JKY.get_value('jky-contact-company');
			if (JKY.is_empty(my_company_id)) {
				my_error += JKY.set_is_required('Company');
			}
		}
	}
	if (the_id == null || the_id == 'jky-contact-tag') {
		var my_contact_tag = JKY.get_value('jky-contact-tag');
		if (JKY.is_empty(my_contact_tag)) {
			my_error += JKY.set_is_required('Tag');
		}
	}
	if (the_id == null || the_id == 'jky-cnpj') {
		var my_cnpj = JKY.get_value('jky-cnpj');
		if (!JKY.is_empty(my_cnpj) && !JKY.is_numeric(my_cnpj)) {
			my_error += JKY.set_must_be_numeric('CNPJ or CPF');
		}
	}
	if (the_id == null || the_id == 'jky-ie') {
		var my_ie = JKY.get_value('jky-ie');
		if (!JKY.is_empty(my_ie) && !JKY.is_numeric(my_ie)) {
			my_error += JKY.set_must_be_numeric('IE or RG');
		}
	}
	if (JKY.is_empty(my_error)) {
		return false;
	}else{
		JKY.display_message(my_error);
		return true;
	}
	return false;
}

JKY.process_insert = function() {
	var my_data =
		{ method: 'insert'
		, table :  jky_table
		, set	:  JKY.get_form_set()
		};
	JKY.ajax(false, my_data, JKY.process_insert_success);
}

JKY.process_insert_success = function(response) {
	JKY.display_trace('process_insert_success');
	JKY.display_message(response.message);
	JKY.refresh_select(jky_select);					//	only used on [Configs and Controls]
	JKY.load_table();
//	JKY.display_form(JKY.get_index_by_id(response.id, JKY.rows)+1);
	JKY.process_add_new();
}

JKY.process_update = function() {
	var my_where = 'id = ' + JKY.rows[jky_index-1]['id'];
	var my_data =
		{ method: 'update'
		, table :  jky_table
		, set	:  JKY.get_form_set()
		, where :  my_where
		};
	JKY.ajax(false, my_data, JKY.process_update_success);
}

JKY.process_update_success = function(response) {
	JKY.display_trace('process_update_success');
	JKY.display_message(response.message);
	JKY.refresh_select(jky_select);					//	only used on [Configs and Controls]
	JKY.rows[jky_index-1] = JKY.get_row(jky_table, JKY.rows[jky_index-1]['id']);
//	JKY.display_next();
	JKY.display_row(jky_index);
}

JKY.process_delete = function() {
	JKY.display_confirm(JKY.delete_confirmed, null, 'Delete', 'You requested to <b>delete</b> this record. <br>Are you sure?', 'Yes', 'No');
}

JKY.delete_confirmed = function() {
	var my_id = JKY.row.id;

	if (JKY.row.group_set == 'Root') {
		var my_data =
			{ method: 'delete_many'
			, table :  jky_table
			, where : 'group_set = "' + JKY.row.name + '"'
			};
		JKY.ajax(true, my_data);
	}

	var my_data =
		{ method: 'delete'
		, table :  jky_table
		, where : 'id = ' + my_id
		};
	JKY.ajax(false, my_data, JKY.process_delete_success);
}

JKY.process_delete_success = function(response) {
	JKY.display_trace('process_delete_success');
	JKY.display_message(response.message);
	JKY.refresh_select(jky_select);					//	only used on [Configs and Controls]
	JKY.display_list();
}

JKY.process_cancel = function() {
	JKY.display_list();
	JKY.Changes.reset();
}

/**
 * process export
 */
JKY.process_export = function() {
	var my_sort_by = jky_sort_by;
	if (jky_sort_seq < 0 ) {
		my_sort_by += ' DESC';
	}
	JKY.run_export(jky_table, jky_select, jky_filter, jky_specific, my_sort_by);
};

/**
 * only used on [Configs and Controls]
 */
JKY.refresh_select = function(selected) {
	if (selected == 'Root') {
		JKY.set_html('jky-app-select', JKY.set_group_set(jky_table , jky_select, 'Root'));
	}
}
