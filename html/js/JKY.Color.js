"use strict";

/**
 * JKY.Color - process all changes during one transaction
 *				 control save into private array [my_appraisals]
 *
 * method:	display(the_id)
 * 			load_data()
 *			click_row(the_index, the_id)
 *			add_new()
 *
 * require:	JKY.Utils.js(JKY.display_confirm)
 *
 * 		$(my_parent).find('.jky-color-row-id'  ).val(the_id );
 *		$(my_parent).find('.jky-color-row-name').val(my_name);
 */
JKY.Color = function() {
	var my_the_id		= null;		//	external id that initiated the call
	var my_the_type		= null;		//	selected color type: Punho, Gola, Galao
	var my_order_by		= 'color_name';
	var my_filter		= 'jky-color-filter';
	var my_search_body	= 'jky-color-search-body';
	var my_layer		= 'jky-color-search';

	function my_display(the_id, the_type) {
		my_the_id	= the_id;
		if (typeof the_type	== 'undefined') {
			my_the_type	= 'All';
		}else{
			my_the_type	= the_type;
		}
		JKY.set_focus(my_filter);
		my_load_data();
	}

	function my_load_data() {
		var my_data =
			{ method	: 'get_index'
			, table		: 'Colors'
			, select	:  my_the_type
			, filter	:  JKY.get_value(my_filter)
			, display	: '10'
			, order_by	:  my_order_by
			};
		JKY.ajax(false, my_data, my_load_data_success);
	}

	function my_load_data_success(response) {
		var my_rows	= response.rows;
		var my_html = '';
		for(var i=0; i<my_rows.length; i++) {
			var my_row = my_rows[i];
			my_html += '<tr onclick="JKY.Color.click_row(this, ' + my_row.id + ')">'
					+  '<td class="jky-search-color-name"		>' + my_row.color_name	+ '</td>'
					+  '<td class="jky-search-color-type"		>' + my_row.color_type	+ '</td>'
					+  '</tr>'
					;
		}
		JKY.set_html(my_search_body, my_html);
		JKY.show_modal(my_layer);
	}


	function my_click_row(the_index, the_id) {
		var my_name = $(the_index).find('.jky-search-color-name').html();
		var my_parent = $(my_the_id).parent();
		$(my_parent).find('.jky-color-row-id'  ).val(the_id );
		$(my_parent).find('.jky-color-row-name').val(my_name);
		$(my_parent).find('.jky-color-row-name').click();
		JKY.hide_modal(my_layer);
	}

	function my_add_new() {
		JKY.display_message('add_new');
	}

	return {
		  display		: function(the_id, the_type)	{		my_display(the_id, the_type);}
		, load_data		: function()					{		my_load_data();}
		, click_row		: function(the_index, the_id)	{		my_click_row(the_index, the_id);}
		, add_new		: function()					{		my_add_new();}
	};
}();