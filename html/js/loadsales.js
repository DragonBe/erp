"use strict";

/**
 * loadsales.js
 */

/**
 * start program
 */
JKY.start_program = function() {
	JKY.App = JKY.Application;
	JKY.App.set(
		{ object_name	: 'JKY.App'
		, program_name	: 'LoadSales'
		, table_name	: 'LoadSales'
		, specific		: ''
		, select		: JKY.loadout.select
		, filter		: ''
		, sort_by		: 'LoadOut.loadout_number'
		, sort_seq		: 'ASC'
		, sort_list		: [[1, 0]]
		, focus			: 'jky-requested-pieces'
		, add_new		: 'display form'
		});
	JKY.App.init();
};

/**
 *	set all events (run only once per load)
 */
JKY.set_all_events = function() {
	$('#jky-tab-lines'		).click (function() {JKY.display_lines	();});
//	$('#jky-line-add-new'	).click (function() {JKY.insert_line	();});
//	$('#jky-thread-filter'	).KeyUpDelay(JKY.Thread.load_data);

	$('#jky-action-generate').click( function() {JKY.generate_loadout();});
	$('#jky-action-close'	).click( function() {JKY.App.close_row(JKY.row.id);});
}

/**
 *	set initial values (run only once per load)
 */
JKY.set_initial_values = function() {
	JKY.set_side_active('jky-dyers-loadsales');
	JKY.set_html('jky-app-select', JKY.set_options(JKY.loadout.select, 'All', 'Draft + Active', 'Draft', 'Active', 'Closed'));
	JKY.set_html('jky-app-select-label', JKY.t('Status'));
	JKY.show	('jky-app-select-line');

	$('#jky-requested-pieces').ForceIntegerOnly();
	$('#jky-reserved-pieces' ).ForceIntegerOnly();
	$('#jky-checkout-pieces' ).ForceIntegerOnly();
}

/**
 *	set table row
 */
JKY.set_table_row = function(the_row) {
	var my_html = ''
		+  '<td class="jky-td-number"	>' +				 the_row.loadout_number			+ '</td>'
		+  '<td class="jky-td-short"	>' + JKY.fix_null	(the_row.dyer_name			)	+ '</td>'
		+  '<td class="jky-td-short"	>' + JKY.fix_null	(the_row.color_name			)	+ '</td>'
		+  '<td class="jky-td-number"	>' +				 the_row.sale_number			+ '</td>'
		+  '<td class="jky-td-short"	>' + JKY.fix_null	(the_row.customer_name		)	+ '</td>'
		+  '<td class="jky-td-text-s"	>' + JKY.fix_null	(the_row.product_name		)	+ '</td>'
		+  '<td class="jky-td-date"		>' + JKY.short_date	(the_row.requested_at		)	+ '</td>'
		+  '<td class="jky-td-pieces"	>' +				 the_row.requested_pieces		+ '</td>'
		+  '<td class="jky-td-pieces"	>' +				 the_row.reserved_pieces		+ '</td>'
		+  '<td class="jky-td-pieces"	>' +				 the_row.checkout_pieces		+ '</td>'
		;
	return my_html;
};

/**
 *	set form row
 */
JKY.set_form_row = function(the_row) {
	var my_requested_pieces	= parseInt(the_row.requested_pieces	);
	var my_reserved_pieces	= parseInt(the_row.reserved_pieces	);
	var my_checkout_pieces	= parseInt(the_row.checkout_pieces	);

	if (the_row.status == 'Draft') {
		JKY.enable_button ('jky-action-generate');
		JKY.enable_button ('jky-action-delete'  );
	}else{
		JKY.disable_button('jky-action-generate');
		JKY.disable_button('jky-action-delete'  );
	}
	if (the_row.status == 'Active') {
		JKY.enable_button ('jky-action-close'	);
	}else{
		JKY.disable_button('jky-action-close'	);
	}

	JKY.set_html	('jky-status'			, JKY.t(the_row.status));
	JKY.set_value	('jky-loadout-number'	, the_row.loadout_number	);
	JKY.set_value	('jky-dyer-name'		, the_row.dyer_name			);
	JKY.set_value	('jky-color-name'		, the_row.color_name		);
	JKY.set_value	('jky-sale-number'		, the_row.sale_number		);
	JKY.set_value	('jky-customer-name'	, the_row.customer_name		);
	JKY.set_value	('jky-product-name'		, the_row.product_name		);
	JKY.set_date	('jky-requested-date'	, JKY.out_time(the_row.requested_at));
	JKY.set_value	('jky-requested-pieces'	, the_row.requested_pieces	);
	JKY.set_value	('jky-reserved-pieces'	, the_row.reserved_pieces	);
	JKY.set_value	('jky-checkout-pieces'	, the_row.checkout_pieces	);
	JKY.set_calculated_color();

	if (the_row.product_id) {
		JKY.display_pieces();
	}
}

/**
 *	set add new row
 */
JKY.set_add_new_row = function() {
	JKY.disable_button('jky-action-generate');
	JKY.disable_button('jky-action-delete'	);
	JKY.disable_button('jky-action-close'	);

	JKY.set_value	('jky-product-code'			, '');
	JKY.set_value	('jky-thread-name'			, '');
	JKY.set_value	('jky-batch-number'			, '');
	JKY.set_value	('jky-machine-name'			, '');
	JKY.set_value	('jky-supplier-name'		, '');
	JKY.set_value	('jky-requested-weight'		,  0);
	JKY.set_value	('jky-requested-pieces'		, '');
	JKY.set_value	('jky-reserved-pieces'		, '');
	JKY.set_value	('jky-unit-price'			,  0);
	JKY.set_value	('jky-average-weight'		,  0);
	JKY.set_value	('jky-checkout-weight'		,  0);
	JKY.set_value	('jky-checkout-pieces'		, '');
}

/**
 *	get form set
 */
JKY.get_form_set = function() {
//	var my_supplier_id = JKY.get_value('jky-thread-name');
//	my_supplier_id = (my_supplier_id == '') ? 'null' : my_supplier_id;

	var my_set = ''
		+             '  code=\'' + JKY.get_value('jky-product-code'	) + '\''
		+'            , batch=\'' + JKY.get_value('jky-batch-number'	) + '\''
		+'       , unit_price=  ' + JKY.get_value('jky-unit-price'		)
		+' , requested_weight=  ' + JKY.get_value('jky-requested-weight')
		+' , requested_pieces=  ' + JKY.get_value('jky-requested-pieces')
		+'  , reserved_pieces=  ' + JKY.get_value('jky-reserved-pieces'	)
		+'   , average_weight=  ' + JKY.get_value('jky-average-weight'	)
		+'  , checkout_weight=  ' + JKY.get_value('jky-checkout-weight'	)
		+'  , checkout_pieces=  ' + JKY.get_value('jky-checkout-pieces'	)
		;
	return my_set;
}

/**
 *	set calculated color
 */
JKY.set_calculated_color = function() {
	var my_requested_weight	= parseFloat(JKY.get_value('jky-requested-weight'	));
	var my_checkout_weight	= parseFloat(JKY.get_value('jky-checkout-weight'	));
	JKY.set_css('jky-checkout-weight', 'color', ((my_requested_weight - my_checkout_weight) > 0.001) ? 'red' : 'black');

	var my_requested_pieces	= parseInt(JKY.get_value('jky-requested-pieces'	));
	var my_checkout_pieces	= parseInt(JKY.get_value('jky-checkout-pieces'	));
	JKY.set_css('jky-checkout-pieces', 'color', (my_requested_pieces > my_checkout_pieces) ? 'red' : 'black');

	var my_reserved_pieces	= parseInt(JKY.get_value('jky-reserved-pieces'	));
	JKY.set_css('jky-reserved-pieces', 'color', (my_reserved_pieces < 0) ? 'red' : 'black');
}

/* -------------------------------------------------------------------------- */
JKY.generate_loadout = function() {
	var my_requested_pieces = JKY.get_value('jky-requested-pieces');
	var my_reserved_pieces  = JKY.get_value('jky-reserved-pieces' );
	if (my_requested_pieces !=  my_reserved_pieces) {
		JKY.display_message('Check Out cannot be generated');
		JKY.display_message('because Resersed Pieces is not equal to Requested Pieces');
		return;
	}

	JKY.insert_load_sets();
}

JKY.insert_load_sets = function() {
	var my_data;
	var my_trs = $('#jky-pieces-body tr');
	for(var i=0, max=my_trs.length; i<max; i++) {
		var my_tr = my_trs[i];
		var my_reserved_pieces = parseInt($(my_tr).find('.jky-reserved-pieces').val());
		if (my_reserved_pieces > 0) {
			var my_checkin_location	=					 $(my_tr).find('.jky-checkin-location'	).val().toUpperCase();
			var my_checkin_date		= JKY.inp_date_value($(my_tr).find('.jky-checkin-date'		).val());
			var my_checkin_weight	= parseFloat		($(my_tr).find('.jky-checkin-weight'	).val());
			var my_checkin_pieces	= parseInt			($(my_tr).find('.jky-checkin-pieces'	).val());
			var my_set = ''
				+       ' loadsale_id=  ' + JKY.row.id
				+ ', checkin_location=\'' + my_checkin_location + '\''
				+     ', checkin_date=  ' + my_checkin_date
				+   ', checkin_weight=  ' + my_checkin_weight
				+   ', checkin_pieces=  ' + my_checkin_pieces
				+  ', reserved_pieces=  ' + my_reserved_pieces
				;
			my_data =
				{ method	: 'insert'
				, table		: 'LoadSets'
				, set		:  my_set
				};
			JKY.ajax(false, my_data);

			my_data =
				{ method	: 'update'
				, table		: 'LoadSales'
				, set		: 'reserved_pieces = reserved_pieces + ' + my_reserved_pieces
				, where		: 'LoadSales.id = ' + JKY.row.id
				};
			JKY.ajax(false, my_data);
		}
	}

	my_data =
		{ method	: 'update'
		, table		: 'LoadSales'
		, set		: 'status = \'Active\''
		, where		: 'id = ' + JKY.row.id
		};
	JKY.ajax(false, my_data, JKY.refresh_form);
}

JKY.refresh_form = function(response) {
	JKY.display_message('Load row generated: ' + JKY.row.id);
	JKY.App.display_row();
}