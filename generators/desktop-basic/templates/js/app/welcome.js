define("app/welcome",
 ["jquery","shark",
 "builder",
 "factory",
 "helper/dock",
 "widget/dropmenu",
 "widget/hovermenu",
 "widget/mywidget",
 "widget/popupwrap",
 "widget/placeholder",
 "form/selector",
 "form/validator",
 "widget/menulist",
 "helper/popmenuhelper",
 "app/topbar",
 'app/logger',
 'app/sidebar'
 ],
 function(
 	$,shark,
 	Builder,
 	factory,
 	dock,
 	DropMenu,
 	HoverMenu,
 	MyWidget,
 	PopupWrap,
 	Placeholder,
 	Selector,
 	Validator,
 	MenuList,
 	popmenuhelper,
 	topbar,
 	logger,
 	sidebar
 	) {

 	var mixIconFunc = function(_l){
 		//  ：0表示全部收藏、1表示校园招聘、2表示宣讲会、3表示招聘会、4表示实习兼职、5表示职位推荐、
 		var lst = _l;
		for (var i = lst.length - 1; i >= 0; i--) {
			var tl = lst[i];
			var iconType = 'default';
			var iconName = '信息';
			var content = $.trim(tl.digest) || '点击标题查看详情...';
			tl.typeLink = gContextPath +"/welcome.do?tab="+tl.type;
			if(tl.type == 5){
				iconType = 'postrcmd';
				iconName = '职位推荐';
				content = '<p class="cnt">发布时间：'+formatDate(tl.startDate,'yyyy-MM-dd')+'</p>\
											<p class="cnt">公司：'+tl.address+'</p>';
			}else if(tl.type == 2){
				iconType = 'teachin';
				iconName = '宣讲会';
				var timeStr ='';
				if((tl.startDate == 0 || tl.startDate%86400000==57600000)){
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd');
				}else{
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd HH:mm');
				}
				if(tl.endDate ==0 || tl.endDate%86400000==57600000){
				}else{
					timeStr += ' - '+ formatDate(tl.endDate,'HH:mm');
				}
				content = '<p class="cnt">时间：'+timeStr+'</p>\
											<p class="cnt">地点：'+tl.address+'</p>';
			}else if(tl.type == 1){
				iconType = 'process';
				iconName = '校园招聘';
				var timeStr = '<p class="cnt">网申时间：';
				if(tl.startDate%86400000==57600000 || tl.startDate == 0){
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd');
				}else{
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd HH:mm')
				}
				if(tl.endDate !=0){
					timeStr += ' - ';
					if(tl.endDate%86400000==57600000){
						timeStr += formatDate(tl.endDate,'yyyy-MM-dd');
					}else{
						timeStr += formatDate(tl.endDate,'yyyy-MM-dd HH:mm');
					}
				}else{
					timeStr += ' 启动';
				}
				timeStr += '</p><p class="cnt">工作地点：'+tl.address+'</p>';
				content = timeStr;
			}else if(tl.type == 3){
				iconType = 'recruit';
				iconName = '招聘会';
				var timeStr ='';
				if(tl.startDate%86400000==57600000 || tl.startDate == 0){
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd');
				}else{
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd HH:mm')
				}
				content = '<p class="cnt">时间：'+timeStr+'</p><p class="cnt">地点：'+tl.address+'</p>';
			}else if(tl.type == 4){
				iconType = 'intern';
				iconName = '实习兼职';
				var timeStr ='';
				if(tl.startDate%86400000==57600000 || tl.startDate == 0){
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd');
				}else{
					timeStr += formatDate(tl.startDate,'yyyy-MM-dd HH:mm')
				}

				content = '<p class="cnt">发布时间：'+timeStr+'</p>\
											<p class="cnt">工作地点：'+tl.address+'</p>';
			}else{
				iconType = 'famous';
				iconName = '名企策略';
			}
			tl.iconType = iconType;
			tl.iconName = iconName;
			tl.content = content;
		}
		return lst;
 	};
 	var get12Time = function(){
 		var now = new Date();
 		return new Date(now.getFullYear(),now.getMonth(),now.getDate());
 	};
 	var refreshCompleteness = function(){
        $.ajax(gContextPath + ' /xhr/myresume/completeness.do',{
            type:'POST',
            success:function(_res){
                if(_res.code == 'S_OK'){
                    var data = _res.data;
                    $('.js-number').text(data.completeness);
                }
            }
        });
    };
    //
    var reset = function(_filter,_ipArea){
    	if(_filter.city || _filter.province ){
			window.provi_city.setValue(_filter.province,_filter.city)
		}else if(_ipArea){
			window.provi_city.setValue(-1,-1);
		}
		var careerEle = $('#career');
		if(_filter.careerName){
			careerEle.val(_filter.careerName).blur();
		}
		if(_filter.industry ){
			var newCondition = $(".js-new-conditions");
			newCondition.find(".js-industry-menu").find('.value').text(_filter.industryName);
			$('#industry').val(_filter.industry).data('name',_filter.industryName);
		}
    };

 	var OFFSIZE = 20,offset = 0;

    return {
        init: function(_filter, ipAera) {
			// 修改过滤条件
			var oldCondition = $(".js-left-content");
			var newCondition = $(".js-new-conditions");
			$(".js-change-condition").click(function(){
				newCondition.fadeIn();
				oldCondition.hide();

				logger.log( 'edit');
			});
			// 地点
			require(["app/myresume/module/city"],function(CityMenu){
				window.provi_city = new CityMenu('.js-provice-menu', '.js-city-menu',{
					clsName : 'w-width97'
				});
				//
				if(_filter.city || _filter.province ){
					window.provi_city.setValue(_filter.province,_filter.city)
				}
			});

			// 行业
			var PrimitivDM = factory.clazz("PrimitiveDropMenu");
			var industryTrigger = newCondition.find(".js-industry-menu");
			if(_filter.industry ){
				industryTrigger.find('.value').text(_filter.industryName);
				$('#industry').val(_filter.industry).data('name',_filter.industryName);
			}
			var industryMenu = new PrimitivDM(industryTrigger,function(){
					var site = $(this);
					return function(_callback){
						require(["db/industry"],function(industry){
							var wrap = new PopupWrap();
							// 二级菜单
							industry.unshift({name:'不限',id:'',sub:[]})
							//
							if(!industry._mixed){
								for(var i=0;i<industry.length;i++){
									industry[i].hasMore = industry[i].sub.length>0;
								}
								industry._mixed = true;
							}
							var ml = new MenuList({
								list:industry,
								cssStyle:{
									// maxHeight:200
								}
							});
							wrap.addChild(ml);
							var html = wrap.get$Ele();
							// $(".js-industry-suggest").remove();
							// var html = '<div class="js-industry-suggest" style="padding:1px;"><ul style="position: absolute;background-color: green;color: #fff;">';
							// for(var i=0;i<industry.length;i++){
							// 	var ind = industry[i];
							// 	html += '<li iid="'+ind.id+'">'+ind.name+'</li>';
							// }
							// html += '</ul><div class="js-sub-industry" style="position: absolute;">你是鬼</div></div>';
							// html = $(html);
							html.find("li").each(function(index,item){
								var iid = $(item).attr("oid");
								if(iid){

									var hm = new HoverMenu(item,function(){
										var tar = null;
										for(var k=0;k<industry.length;k++){
											if(industry[k].id == iid){
												tar = industry[k].sub;
												break;
											}
										}
										//

										if(tar && tar.length>0){
											var wrap = new PopupWrap();
											var ml = new MenuList({
												list:tar,
												cssStyle:{
													// maxHeight:200
												}
											},{
												onclick:function(_evt,_ctrl){
													hm.close();
													newCondition.find(".js-industry-menu .value").text(_ctrl.getValue().name);	
													$("#industry").val(_ctrl.getValue().id).data('name',_ctrl.getValue().name);
													return false;
												}
											});
											wrap.addChild(ml);
											return wrap;
										}
									},{
										root:newCondition.find(".js-industry-menu").parent()

									});
								}else{
									$(item).click(function(){
										industryMenu.close();
										newCondition.find(".js-industry-menu .value").text('不限');	
										$("#industry").val('');
									});
								}
							});
							//
							_callback(wrap);
						});
					};
				});
			industryMenu.get$Ele();
			// 职业
			
			var careerEle = $('#career');
			new Placeholder(careerEle,{position:'left,top'});
			if(_filter.careerName){
				careerEle.val(_filter.careerName).blur();
			}
			// 校验
			
				var searchValidator = new Validator({
						errorPlacement:function(_error , _element){
							_error.css({
								width:'200%',
								top:0,
								left:'100%'
							});
							_element.parents('.js-career-menu').after(_error);
						}
					},{
						onwatch : function(_valid){
							
						}
					});
				searchValidator.addRule(careerEle, [
					{
						type:'maxLength',
						value:40,
						message :'限定40个字符'
					}]
				);

			// 取消
			newCondition.find(".js-cancel-condition").click(function(){
				if(searchValidator.isValid() !== true){
					return;
				}
				reset(_filter, ipAera);
				//
				window.customed = true;
				oldCondition.fadeIn();
				newCondition.hide();
			});
			// 保存或者取消
			newCondition.find(".js-save-condition").click(function(){
				if(searchValidator.isValid() !== true){
					return;
				}

				// var conditionText = $(".js-condition-text");
				// conditionText.empty();
				//
				var formData = {};
				var conditionCont = $('.js-left-content');
				if(conditionCont.attr('data-filters-id') !== ''){
					formData.id = conditionCont.attr('data-filters-id');
				}
				//
				var locationEmpty = true;
				var proviAndCity = window.provi_city.getValue();
				var locationDefined = proviAndCity.province && proviAndCity.province.value != -1 || proviAndCity.city && proviAndCity.city.value !=-1;
				if(locationDefined){
					var locationTmp = '<li>';
					if(proviAndCity.province){
						formData.province = proviAndCity.province.value;
						formData.provinceName = proviAndCity.province.name;
						locationTmp += formData.provinceName;
					}
					//
					if(proviAndCity.city){
						formData.city = proviAndCity.city.value;
						formData.cityName = proviAndCity.city.name;
						locationTmp += formData.cityName;
					}

					locationTmp += '</li>';
					// conditionText.append(locationTmp);
					locationEmpty = false;
				}

				if(locationEmpty){
					// conditionText.append('<li>'+(ipAera?'<span class="w-icon icon-location"></span>'+ipAera:'地点不限')+'</li>');
				}
				//
				var anct = ["industry"];
				for(var i=0,l = anct.length;i<l;i++){
					var key = anct[i];
					var location = $("#"+key).val();
					if(location){
						formData[key] = location;
						formData[key+'Name'] = $("#"+key).data("name");
						// conditionText.append('<li>' + formData[key+'Name'] + '</li>');
					}else{
						// conditionText.append('<li>行业不限</li>');
					}
				}
				var career = careerEle.val();
				if(career!=null && career !=""){
					formData.careerName = career;
					// conditionText.append('<li>' + shark.escapeHTML(formData.careerName) + '</li>');
				}else{
					// conditionText.append('<li>职业不限</li>');
				}
				formData.tab = $('.js-current-tab').val();
				//
				if($.toJSON({}) === $.toJSON(formData)){
					$('.js-condition-text').html('<li>地区不限</li><li>行业不限</li><li>职位不限</li><li>月薪不限</li>');
				}
				// shark.log(formData);
				$.ajax(gContextPath+"/xhr/timeline.do",{
					data:formData,
					type:"post",
					success:function(_res){
						if(_res.data){
							window.location.reload();
							return;
							//
							offset = 0;
							var lst = mixIconFunc(_res.data.infosArray);
							var footer = $('.js-lst-footer');
							if(lst.length === 0 ){
								$('.js-new-wrap').empty();
								$(".js-empty-tip").removeClass('f-hide');
								footer.addClass('f-hide');
							}else{
								mixIconFunc(lst);
								if(_res.data.hasMore == false){
									footer.addClass('f-hide');
								}else{
									footer.removeClass('f-hide');
								}
								$(".js-empty-tip").addClass('f-hide');
								
								var b = new Builder(lst);

								var newComing = b.build("#js-tmp-timeline");
								$(".js-new-wrap").html(newComing);
							}
							//
							refreshCompleteness();

						}else{
							alert('保存筛选条件失败');
						}
					}
				});
			});
			//查看跟多
			var mybody = $('.g-bd');
			//
			$(document.body).delegate(".js-more",'click',function(){
				var site = $(".js-more");
				$(".js-loading").show();
				site.hide();
				//
				if(window.customed){
					var formData = {};
					var anct = ["industry"];
					for(var i=0,l = anct.length;i<l;i++){
						var key = anct[i];
						var location = $("#"+key).val();
						if(location){
							formData[key+'Id'] = location;
							formData[key+'Name'] = $("#"+key).data("name");
						}
					}
					var career = careerEle.val();
					if(career!=null && career !=""){
						formData.careerName = career;
					}
					var proviAndCity = window.provi_city.getValue();
					if(proviAndCity.city && proviAndCity.city.value !=-1){
						formData.city = proviAndCity.city.value;
						formData.cityName = proviAndCity.city.name;
					}

					if(proviAndCity.province && proviAndCity.province.value != -1){
						formData.province = proviAndCity.province.value;
						formData.provinceName = proviAndCity.province.name;
					}
				}else{
					var formData = pFilters;
				}
				//
				formData.offsize = OFFSIZE;
				offset = offset+formData.offsize;
				formData.offset = offset;
				formData.tab = $('.js-current-tab').val();
				// shark.log(formData);
				$.ajax(gContextPath+"/xhr/fecthInfos.do",{
					data:formData,
					type:'post',
					success:function(_res){
						if(_res.code == 'FAIL') return;

						$(".js-loading").hide();
						//
						var lst = _res.data ||[];
						if(lst.length === 0 || lst.length< OFFSIZE){
							site.hide();
							$(".js-no-more").removeClass("f-hide");
							if(lst.length ==0){
								return;
							}
						}else{
							site.show();
							$(".js-no-more").addClass("f-hide");
						}
						//
						// $(".js-set-immediately").parent().hide();
						//
						var lst = mixIconFunc(_res.data);
						var b = new Builder(lst);
						var newComing = b.build("#js-tmp-timeline");
						$(".js-new-wrap").append(newComing);

						$(window).resize();
					}
				});
			});
			//
			$(".js-set-immediately").click(function(){
				$(".js-change-condition").click();
				var site = $(this);
				if(site.hasClass('js-not-hide')){
				}else{
					site.parent().hide();
				}
				mybody.animate({
					"scrollTop":0
				},500,"swing");
			});
			// 关闭编辑条件提示
			// TODO unneccessory bind
			$('.js-editcondition-close').click(function(){
				$('.js-editcondition-panel').hide();
			});
			// 收藏和取消收藏
			var doc = $(document.body);
			doc.delegate('.js-star','click',function(){
				var site = $(this);
				var item = site.parent();
				
				//
				if(site.hasClass('open')){
					//TODO ajax
					var url = gContextPath + '/xhr/delfavour.do';
				}else{
					var url = gContextPath + '/xhr/addfavour.do';
				}
				site.toggleClass('open')
				//
				$.ajax({
					url: url,
					data : {
						id: item.attr('tid'),
						type : item.attr('typeid')
					},
					success : function(_res){
						item.children('.js-star').toggleClass('f-hide');
					}
				})
			});
			// 导航常驻
			sidebar.init();
			//
			topbar.init();
			//
        }
    };

});
