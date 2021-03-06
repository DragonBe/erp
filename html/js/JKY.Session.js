"use strict";

/**
 * JKY.Session.js - singleton class to process all Session interface
 *
 * method:	JKY.Session.load_values()
 *			JKY.Session.set_value(key, value)
 *			JKY.Session.get_value(key)
 *
 * example:	JKY.Session.load_values();
 *			JKY.Session.set_value('language', 'taiwanese');
 *			JKY.Session.get_value('language');		//	taiwanese
 *
 * require:	JKY.Utils.js	(JKY.AJAX_URL)
 */
JKY.Session = function() {
	var my_session		= [];
	var my_locale		= '';
	var my_date_time	= '';

	var my_session_time = 1800;	//	in seconds 1800 = 30 minutes
	var my_recover_time =   60;	//	in seconds   60 =  1 minute
	var my_count_down;			//  in seconds
	var my_call_back;			//	call back function name
	var my_session_event;		//	last session event
	var my_count_down_event;	//	last count down event

	function my_load_values() {
		var my_data = {method:'get_session'};
		JKY.ajax(false, my_data, my_load_values_success);
	};

	function my_load_values_success(response) {
		my_session = response.data;
//alert('my_load_values_success:' + my_session['full_name']);
	};

//	it is incomplete, not sure if it is needed.
	function my_save_values() {
		var my_rows = [];
		$.ajax({
			url		: JKY.AJAX_URL + 'POST' ,
			asycn	: true,
			success	: function(response) {
				if (response.status == 'ok') {
					my_rows = response.data;
				}else{
					JKY.display_message(response.message);
				}
			}
		});
		return my_rows;
	};

	function my_get_action(the_resource) {
		for(var i=0, max=my_session.permissions.length; i<max; i++) {
			var my_permission = my_session.permissions[i];
			if (my_permission.user_resource == the_resource) {
				return my_permission.user_action;
			}
		}
		return '';
	};

	var my_clear_timeout = function() {
		if (my_session_event) {
			clearTimeout(my_session_event);
		}
	}

	var my_reset_timeout = function(the_call_back) {
		if(!JKY.Session.has('user_id')) {
			return;
		}
//JKY.display_trace('my_reset_timeout: ' + (my_session_time - my_recover_time));
		if (typeof(the_call_back) == 'function') {
			my_call_back = the_call_back;
		}

		if (my_session_event) {
			clearTimeout(my_session_event);
		}
		my_session_event = setTimeout(function() {
			my_count_down = my_recover_time;
			my_display_count_down();
		}, (my_session_time - my_recover_time) * 1000);
	};

	var my_display_count_down = function() {
//JKY.display_trace('my_display_count_down');
		JKY.display_confirm
				(  my_process_timeout
				,  my_keep_in_session
				, 'Time Out'
				, '<span>You have been inactive for too long</span>.'
				+ '<br>'
				+ '<span>The system will <b>log-out</b> automatically in</span>'
				+ '<span id="jky-count-down" style="padding-left:10px; font-size:24px; font-weight:bold;"></span> <span>seconds</span>.'
				+ '<br><br>'
				+ '<span>Do you want to <b>continue</b> working in this session</span>?'
				, 'Log Off'
				, 'Continue'
				);
		JKY.t_tag('jky-confirm', 'span');
		my_process_count_down();
	};

	var my_process_count_down = function() {
//JKY.display_trace('my_process_count_down');
		if (my_count_down_event) {
			clearTimeout(my_count_down_event);
		}
//		this line is only QA
//		JKY.set_html('jky-company-logo', '<span style="font-size:64px;">' + my_count_down + '</span>');
		JKY.set_html('jky-count-down', my_count_down);
		my_count_down_event = setTimeout(function() {
			my_count_down -= 1;
			if (my_count_down <= 0) {
				JKY.set_html('jky-count-down', my_count_down);
				my_process_timeout();
				clearTimeout(my_session_event);
			}else{
				my_process_count_down();
			};
		}, 1000);
	};

	var my_keep_in_session = function() {
//JKY.display_trace('my_keep_in_session');
//		my_reset_timeout();			//	not needed because ajax will reset timeout

//		extra ajax call to reset session timeout on Apache
		my_load_values();
		clearTimeout(my_count_down_event);
	};

	var my_process_timeout = function() {
//JKY.display_trace('my_process_timeout');
		clearTimeout(my_count_down_event);
		JKY.hide_modal('jky-confirm');
		if (typeof(my_call_back) == 'function') {
			my_call_back();
		}else{
			var my_log_out = $('#jky-menu-logoff');
			if (my_log_out) {
				my_log_out.click();		//	this will work on [Log Off] anchor
//				window.location = my_log_out.attr('onclick');
				clearTimeout(my_session_event);
			};
		};
	};

	$(function() {
		JKY.Session.load_values();
		my_locale = my_session['locale'];
		switch(my_locale) {
			case 'en_US'	: my_date_time = 'MM-dd-yyyy hh:mm'; break;
			case 'pt_BR'	: my_date_time = 'dd-MM-yyyy hh:mm'; break;
			default			: my_date_time = 'yyyy-MM-dd hh:mm';
		}
	});

	return {
		  load_values	: function()				{		my_load_values()		;}
		, save_values	: function()				{		my_save_values()		;}
		, set_value		: function(key, value)		{		my_session[key] = value	;}
		, get_value		: function(key)				{return my_session[key]			;}
		, has			: function(key)				{return my_session[key] ? true : false;}
		, get_action	: function(the_resource)	{return my_get_action(the_resource);}

		, get_locale	: function()	{return my_locale					;}
		, get_date_time	: function()	{return my_date_time				;}
		, get_date 		: function()	{return my_date_time.substr(0, 10)	;}

		, set_session_time	: function(the_session_time)	{		my_session_time = the_session_time	;}
		, set_recover_time	: function(the_recover_time)	{		my_recover_time = the_recover_time	;}
		, set_call_back		: function(the_call_back)		{		my_call_back	= the_call_back		;}
		, get_session_time	: function()					{return	my_session_time						;}
		, get_recover_time	: function()					{return	my_recover_time						;}

		, clear_timeout		: function()					{		my_clear_timeout()					;}
		, reset_timeout		: function(the_call_back)		{		my_reset_timeout(the_call_back)		;}
	};
}();
