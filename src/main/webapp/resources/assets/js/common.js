$(function(){
    // header
    function headerAction(){
        var $headerItem = $('.hs_cate_btn'),
            $sub = $('.header_sitemap'),
            $close = $('.header_sitemap .hst_btn');
        
        $headerItem.on( 'click', function(){
            $sub.toggle();
        });

        $close.on('click', function () {
            $sub.hide();
        });

        var $cB = $('.hs_link_wifi'),
            $consulting = $('.hs_consulting');

        $cB.on( 'click', function(e){
            e.preventDefault();
            $consulting.toggle();

            if ( $(window).width() < 1310 ) {
                $('.hs_search').hide();
            }
        });

        // tobbar
        var $tobClose = $('.topbar_close'),
            $tobbar = $('.topbar');

        $tobClose.on('click', function(){
            $tobbar.hide();
        });

        // dropdown
        $('.hm_box').on( 'click', function(){
            $('.hm_dropdown').toggle();
        });
        $('.hm_arrow').mouseenter(function(){
            $('.hm_dropdown').show();
        });
        $('.header_top').mouseleave(function(){
            $('.hm_dropdown').hide();
        });
    }
    // header mobile
    function headerActionMo() {
        var $sB = $('.mo_header_fc_btn'),
          $search = $('.header_search');

        $sB.on( 'click', function(){
            $search.fadeIn();
        });
        $('.mo_header_fc_btn_close').on( 'click', function(){
            $search.fadeOut();
        });


        // gnb
        var $close = $('.mo_gnb_btn_close'),
            $open = $('.mo_gnb_btn'),
            $box = $('.mo_gnb_box'),
            $layer = $('.mo_gnb_layer'),
            $gnb = $('.mo_gnb');
        
        $open.on( 'click', function(){
            $box.show();
            $box.find('.mo_gnb').animate({
                left: 0
            }, 500);
            $box.find('.mo_gnb_layer').animate({
                opacity: 1
            });

            $('body').css('overflow', 'hidden');
        });
        $close.on( 'click', function(){
            $box.delay(300).fadeOut();
            $box.find('.mo_gnb').animate({
              left: '-100%',
            }, 500);
            $box.find('.mo_gnb_layer').animate({
              opacity: 0,
            });

            $('body').css('overflow', 'auto');
        });
        $layer.on( 'click', function(){
            $box.delay(300).fadeOut();
            $box.find('.mo_gnb').animate({
              left: '-100%',
            }, 500);
            $box.find('.mo_gnb_layer').animate({
              opacity: 0,
            });

            $('body').css('overflow', 'auto');
        });
    }

    headerAction();

    if ( $(window).width() < 1250 ) {
        headerActionMo();
    }

    function popupFc(popup) {
        $('.popup_wrap').hide();
        $('#' + popup).show();
    }

    function goTop() {
        $('.top_btn').click( function() {
            $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
            return false;
        });
    }

    // 탑버튼
    goTop();

    // 팝업
    $('.pop_open').on( 'click', function(){
        var popup = $(this).data('popup');

        popupFc(popup);
    });
    $('.pop_close').on( 'click', function(){
        $('.popup_wrap').hide();
    });
    $('.apply_pop_btnx').on( 'click', function(){
        $('.popup_wrap').hide();
    });
//    $('.apply_pop_btn').on( 'click', function(){
//        $('.popup_wrap').hide();
//    });
    function accoFc() {
        var $btn = $('.acco_toggle');

        $btn.on( 'click', function(){
            $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
        });

        var $btnSingle = $('.acco_toggle_single');

        $btnSingle.on( 'click', function(){
            $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
            $(this).parents('.acco_box').siblings('.acco_box').removeClass('active').children('.acco_content').slideUp();
        });
    }

    // 아코디언
    accoFc();

    // toggle btn
//    $(document).on('click', '.toggle_btn', function(e){
//        e.preventDefault();
//        $(this).toggleClass('active');
//    });
    
    deviceSystem();
//    prdtSliderEvent();
    prdtFaqEvent();
    prdtRightInfo();
//    prdtTabEvent(); // 주석풀지말것 해당 페이지의 카테고리 append 전에 실행시 위치가 안맞음
    goTopInPrdtResize();
    prdtFooterPaddingBottomSystem();
    prdtReviewEvent();
//    lnbEvent();
});

//PC TABLET MOBILE  분기
function deviceSystem(){
    $(window).on('resize', function(){
        if($(window).outerWidth(true) > 1201){
            DEVICE_TYPE = 'PC';
        }else if( $(window).outerWidth(true) > 960 && $(window).outerWidth(true) <= 1200){
            DEVICE_TYPE = 'TABLET';
        }else if($(window).outerWidth(true) <= 960){
            DEVICE_TYPE = 'MOBILE';
        }
    }).trigger('resize');
}

// goTop 버튼 resize
function goTopInPrdtResize(){
    if($('.prdt_info_sta').length){
        $(window).on('resize', function(){
            goTopInPrdt();
        }).trigger('resize');  
    }
}
function goTopInPrdt(){
    if(DEVICE_TYPE != 'MOBILE'){
        $('.top_fixed').removeClass('has-sticky-bottom');
        $('.top_fixed').css({ bottom: '100px' });
    }else{
        $('.top_fixed').addClass('has-sticky-bottom');
        if($('.top_fixed').hasClass('has-sticky-bottom')){
            $('.top_fixed').stop().animate({ bottom: $('.prdt_info_sta').outerHeight()+20+'px' },200);
        }
    }
}
// prdt 페이지 FAQ 아코디언
function prdtFaqEvent(){
      var $faqTop = $('.prdt_faq_item_top');
  	  $faqTop.on('click', function(){
  	  $(this).toggleClass('is-active');
  	  $(this).siblings('.prdt_faq_item_bottom').slideToggle( 190, 'linear');
    });
}
// 마스터홈, 상품상세 오른쪽 제품정보 영역
function prdtRightInfo(){
    var $cardParent = $('.prdt_info_area');
    var $card = $('.prdt_info_layout');

    var stickyCardEvent = function(){
        var $targetHeight = $cardParent.offset().top;
        $(window).scroll(function(e){
            if(DEVICE_TYPE != 'MOBILE'){
                if($card.length){        
                    if( $targetHeight - 40 < window.scrollY){
                        $card.css({position:'fixed', top: '20px'});
                    }else{
                        $card.css({position:'static'});
                    }
                }
            }else{
                $card.css({position:'static'});
            }
        });
    }
    if($cardParent.length){
        stickyCardEvent();    
    }
    
}
//마스터홈, 상품상세 탭 이벤트
function prdtTabEvent(){
    var $tabs = $('.prdt_tab a');
    var $contents = $('.section_prdt[data-idx]');
    var $tabCont = $('.prdt_tab_lists');
    
    //�꽭�똿
    $tabs.eq(0).addClass('is-active');

//    클릭 시 이동 이벤트
    $(document).on('click','.prdt_tab a', function(e){
        e.preventDefault();
        var tabIdx = $(this).data('idx');
        for(var i=0; i<$contents.length; i++){
            if(tabIdx == $contents.eq(i).data('idx')){
                $('html, body').animate({scrollTop : $contents.eq(i).offset().top}, 0);
            }
        }
        // 2021-01-20 理쒖슦�꽦�씠 �닔�젙�븿
        $tabs.removeClass('is-active');
        $(this).addClass('is-active');
        // 2021-01-20 理쒖슦�꽦�씠 �닔�젙�븿.
    });
    
//    탭 바 위치고정 값 설정
    if($tabCont.length){
        var $targetHeight = $tabCont.offset().top;
//        console.log( $targetHeight );
        $(window).scroll(function(e){
//        	console.log( window.scrollY );
            $tabCont.css({width: $tabCont.parent().width()})
            if($tabCont.length){        
                if( $targetHeight < window.scrollY) $tabCont.addClass('is-sticky');    
                else $tabCont.removeClass('is-sticky');
            }
        });

        $(window).on('resize', function(){
            $tabCont.css({width: $tabCont.parent().width()})
        });
    }
    
    
    $(window).scroll(function(e){
        var pos = $(window).scrollTop();
        $contents.each(function(i, e){
            var nowPos = nowPos = $contents.eq(i).offset().top - ($(window).height() / 5);// -($(window).height() / 2);
            var nextPos = 0;
            if($contents.eq(i + 1).length){   
                nextPos = $contents.eq(i + 1).offset().top;
            }else{
                nextPos = $(document).height() - $(window).height();
                nowPos = $contents.eq(i).offset().top-($(window).height() / 2);
            }
            
            if(nowPos <= pos && nextPos >= pos){
                var tabIdx = $(e).data('idx');
             // 2021-01-20 理쒖슦�꽦�씠 �닔�젙�븿
//                $tabs.removeClass('is-active');
//                $tabs.eq(tabIdx).addClass('is-active');
             // 2021-01-20 理쒖슦�꽦�씠 �닔�젙�븿.
            }
        });
    });

}
// 마스터홈, 상품상세 추천상품 이벤트
function prdtSliderEvent(){
    var $slide = $('.prdt_recommend_list ul');
    if($slide.length){
        $slide.slick({
            infinite: false,
            slidesToShow: 4,
            slidesToScroll: 4,
            variableWidth:false,
            responsive: [
                {
                  breakpoint: 760,
                  settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    // draggable : true, 
                    variableWidth: true
                  }
                },{
                    breakpoint: 400,
                    settings: {
                      slidesToShow: 1,
                      slidesToScroll: 1,
                      // draggable : true, 
                      variableWidth: true
                    }
                  }
              ]
        });
    }
    
}
//마스터홈, 상품상세 모바일 푸터 padding bottom 
function prdtFooterPaddingBottomSystem(){
    var $prdtInfo = $('.prdt_info_sta')
    if($prdtInfo.length){
        $('.footer').addClass('has-prdt-info');
    }
}

// toggle is-active popup event
function clickToggleClassPopupEvent(target, option){
    var $btn = $(target);
    var activeClassName = 'active is-active';
    var that = target;
    
    if( $(that).hasClass(activeClassName) ) { //찜 하기
        var alertYn;
        if(option.beforePopup) alertYn = option.beforePopup(that);
        
        if ( alertYn === 'ALERT' ) {
        	new PopupAlert({
        		type: option.popupType, // popup type (alert, confirm)
        		msg: option.popupMsg, // 팝업 메세지
        		callback: function(){
        			if(option.callback) option.callback(that);
        		}
        	});
		}
    } else { //찜 해제
        if(option.beforePopup) option.beforePopup(that);
    }
}

// normal popup event
function clickPopupEvent(target, option){
    var $btn = $(target);
    var that = this;
    var alertYn
    if(option.beforePopup) alertYn = option.beforePopup(that);

    if ( alertYn === 'ALERT' ) {
        new PopupAlert({
            type: option.popupType, // popup type (alert, confirm)
            msg: option.popupMsg, // 팝업 메세지
            callback: function(){
                if(option.callback){
                    option.callback(that);
                }
            }
        });
    }
}

// 마스터홈 click 이벤트
function btnFollowingEvent(callback1, callback2){
    var $btn = $('.btn_following');
    $(document).on('click', '.btn_following', function(){
        if($(this).hasClass('badge_white')){
            $(this).removeClass('badge_white');
            $(this).addClass('badge_cyan');
            if(callback1){
                callback1();
            }
        }else{
            $(this).addClass('badge_white');
            $(this).removeClass('badge_cyan');
            if(callback2){
                callback2();
            }
        }
    });
}

// 메인 click 이벤트
function follow_btnEvent(callback1, callback2){
	var $btn = $('.follow_btn');
	$(document).on('click', '.follow_btn', function(){
//		console.log( $(this).hasClass('active') );
		
		if( $(this).hasClass('active') ){
			if(callback1){
				callback1( this.value );
			}
			
		}else{
			if(callback2){
				callback2( this.value );
			}
		}
	});
}

//마스터홈, 상품상세 리뷰 click event
function prdtReviewEvent(){
  var $target = $('.rpdt_review_textarea');
  $(document).on('click', '.rpdt_review_textarea', function(){
      $(this).toggleClass('non-ellipsis');
  });
}

//All Checkbox Event
function checkAllEvent(allCheckbox, otherCheckbox){
    var $allCheckbox = $(allCheckbox);
    var $otherCheckbox = $(otherCheckbox);
    var confirmOtherCheckbox = function(){
        var bool = true;
        $otherCheckbox.each(function(i, e){
            if(bool){
                ($(e).is(':checked')) 
                    ? bool = true
                    : bool = false;
            }
        });
        return bool;
    }
    $allCheckbox.on('change', function(e){
        ($(e.target).is(':checked'))
            ? $otherCheckbox.prop('checked', true)
            : $otherCheckbox.prop('checked', false)
    });
    $otherCheckbox.on('change', function(e){
        (confirmOtherCheckbox())
            ? $allCheckbox.prop('checked', true)
            : $allCheckbox.prop('checked', false)
    });
}

function lnbEvent(){
    var $lnb = $('.lnb');
    var $lnbItems = $lnb.find('.lnb_item');
    $lnbItems.each(function(i,e){
        if($(e).hasClass('is-active')){
            $lnb.scrollLeft($(e).offset().left);
        }
    })
    $lnbItems.on('mouseenter', function(e){
        $lnb.stop().animate({scrollLeft: $(this).offset().left}, 1000);
    });
    
}

// popup system
function PopupAlert(option){
    this.type           = null;
    this.msg            = null;
    this.cb             = null;
    this.cancelCb       = null;
    this.popupParent    = null;
    this.popup          = null;
    this.className      = null;
    this.init(option);
}

PopupAlert.prototype = {
    init : function(option){
        this.popup = null;
        this.className = {
            popupParent : 'popup-alert-area',
            popup       : 'popup-alert',
            btnConfirm  : 'btn-confirm-popup-alert',
            btnCancel   : 'btn-cancel-popup-alert'
        };
        this.msg        = option.msg;
        this.type       = option.type || 'alert';
        this.cb         = option.callback;
        this.cancelCb   = option.cancelCallback;

        this.createParentElement();
        this.createPopup();
        this.createBtns();
        this.popupEvent();
    },

    createParentElement : function(){
        if( document.getElementById(this.className.popupParent) === null ) {
            document.querySelector('body').insertAdjacentHTML('beforeend', '<div id="'+this.className.popupParent+'"></div>');
        }
        this.popupParent = document.getElementById(this.className.popupParent);
    },

    createPopup: function(){
        var idx = this.popupParent.querySelectorAll('.'+this.className.popup).length;
        var html = '<div id="'+this.className.popup+idx+'"class="' +this.className.popup+'">' +
                        '<div class="popup-alert-inn">'+
                            '<div class="popup-alert-text-area">' + 
                                '<p class="popup-alert-text">'+this.msg+'</p>'+
                            '</div>' +
                        '</div>' +
                    '</div>';
        this.popupParent.insertAdjacentHTML('beforeend', html );
//        window.document.body.style.overflow = 'hidden';
        this.popup = this.popupParent.querySelector('#'+this.className.popup+idx);
    },

    createBtns: function(){
        var btns = null;
        var objthis = this;
        var btnType1 = function(){
            btns =  '<div class="popup-alert-btn-area type2">' +
                        '<button type="button" class="'+objthis.className.btnConfirm+'">확인</button>' +
                    '</div>';
        };
        var btnType2 = function(){
            btns = '<div class="popup-alert-btn-area type1">' +
                        '<button type="button" class="'+objthis.className.btnConfirm+'">확인</button>' +
                        '<button type="button" class="'+objthis.className.btnCancel+'">취소</button>' +
                    '</div>';
        };
        switch(this.type){
            case 'alert' : 
                btnType1();
                break;
            case 'confirm' : 
                btnType2();
                break;
            default : 
                throw Error('plz choise "alert" and "confirm"');
        }
        this.popup.insertAdjacentHTML('beforeend',btns);
    },

    popupEvent: function(){
        var objthis = this;
        var confirmBtn  = this.popup.querySelector('.'+this.className.btnConfirm);
        var closeBtn    = this.popup.querySelector('.'+this.className.btnCancel);
        if(this.type == 'confirm'){
            closeBtn.addEventListener('click', function(){ 
                objthis.closePopupEvent(); 
            });
            confirmBtn.addEventListener('click', function(){ 
                objthis.confirmPopupEvent(); 
            });
        }else{
            confirmBtn.addEventListener('click',function(){ 
                objthis.confirmPopupEvent(); 
            });
        }
    },

    hidePopupEvent: function(){
        if( this.popupParent.querySelectorAll('.'+this.className.popup).length == 0 ) this.popupParent.remove();
    },

    confirmPopupEvent: function(){
        this.popup.remove();
        window.document.body.style.overflow = 'visible';
        this.hidePopupEvent();
        if(this.cb){
            this.cb();
        }
    },

    closePopupEvent: function(){
        this.popup.remove();
        window.document.body.style.overflow = 'visible';
        this.hidePopupEvent();
        if(this.calcelCb){
            this.cancelCb();
        }
        
    }
}









