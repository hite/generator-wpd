!function(){
		var sharkBase = "sharkjs";
		requirejs.config({
			//By default load any module IDs from js/lib
			baseUrl: '/js',

			paths: {
				/*'jquery':'lib/jquery-1.7.1.min',
				'template' : 'lib/jquery.jqote2',
				'underscore' : 'lib/underscore-min',
				'jqueryjson' : 'lib/jquery.json-2.3',
				'jqueryvalidate' : 'lib/jquery.validate',
				'jqueryform': 'lib/jquery.form',
				'hl/zh_CN' : 'hl/zh_CN',
				'hl/en_US' : 'hl/en_US',
				'shark' : sharkBase + '/shark',
				'config' : sharkBase + '/config',
				'factory' : sharkBase + '/factory',
				'i18n' : sharkBase + '/i18n',
				'dataprovider' : sharkBase + '/dataprovider',
				'builder' : sharkBase + '/builder',
				'helper/csshelper' : sharkBase + '/helper/csshelper',
				'helper/datahelper' : sharkBase + '/helper/datahelper',
				'helper/detection' : sharkBase + '/helper/detection',
				'helper/dock' : sharkBase + '/helper/dock',
				'helper/popmenuhelper' : sharkBase + '/helper/popmenuhelper',
				'helper/shortkey' : sharkBase + '/helper/shortkey',
				'helper/eventhelper' : sharkBase + '/helper/eventhelper',
				'form/checkbox' : sharkBase + '/form/checkbox',
				'form/checkboxgroup' : sharkBase + '/form/checkboxgroup',
				'form/field' : sharkBase + '/form/field',
				'form/radio' : sharkBase + '/form/radio',
				'form/selector' : sharkBase + '/form/selector',
				'form/tightinput' : sharkBase + '/form/tightinput',
				'widget/widget' :  sharkBase + '/widget/widget',
				'widget/component' :  sharkBase + '/widget/component',
				'widget/container' :  sharkBase + '/widget/container',
				'widget/mywidget' :  sharkBase + '/widget/mywidget',
				'widget/dragsort' :  sharkBase + '/widget/dragsort',
				'widget/list' :  sharkBase + '/widget/list',
				'widget/menuitem' :  sharkBase + '/widget/menuitem',
				'widget/menulist' :  sharkBase + '/widget/menulist',
				'widget/menulistgroup' :  sharkBase + '/widget/menulistgroup',
				'widget/msgbox' :  sharkBase + '/widget/msgbox',
				'widget/placeholder' :  sharkBase + '/widget/placeholder',
				'widget/popupwrap' :  sharkBase + '/widget/popupwrap',
				'widget/previewseperator' :  sharkBase + '/widget/previewseperator',
				'widget/seperator' :  sharkBase + '/widget/seperator',
				'widget/suggestlist' :  sharkBase + '/widget/suggestlist',
				'widget/toolbar' :  sharkBase + '/widget/toolbar',
				'widget/calendar' : sharkBase + '/widget/calendar',
				'widget/button' : sharkBase + '/widget/button/button',
				'widget/buttongroup' : sharkBase + '/widget/button/buttongroup',
				'widget/strongbutton' : sharkBase + '/widget/button/strongbutton',
				'widget/cancelbutton' : sharkBase + '/widget/button/cancelbutton',
				'widget/combobutton' : sharkBase + '/widget/button/combobutton',
				'widget/okbutton' : sharkBase + '/widget/button/okbutton',
				'widget/selectorbutton' : sharkBase + '/widget/button/selectorbutton',
				'widget/switchbutton' : sharkBase + '/widget/button/switchbutton',
				'widget/hinger' : sharkBase + '/widget/complexmenu/hinger',
				'widget/dropmenu' : sharkBase + '/widget/complexmenu/dropmenu',
				'widget/hovertrigger' : sharkBase + '/widget/complexmenu/hovertrigger',
				'widget/contextmenutrigger' : sharkBase + '/widget/complexmenu/contextmenutrigger',
				'widget/hovermenu' : sharkBase + '/widget/complexmenu/hovermenu',
				'widget/splitbutton' : sharkBase + '/widget/button/splitbutton',
				'widget/basedialog' : sharkBase + '/widget/dialogbox/basedialog',
				'widget/dialogbox' : sharkBase + '/widget/dialogbox/dialogbox',
				'widget/prompt' : sharkBase + '/widget/dialogbox/prompt',
				'plugins/avatar' : sharkBase + '/plugins/avatar'*/
			},
			shim:{
				/*'template':['jquery'],
				'jqueryjson':['jquery'],
				'jqueryvalidate':['jquery'],*/
				'underscore': {
		            exports: '_'
		        }
			}
		});
	
} (); 