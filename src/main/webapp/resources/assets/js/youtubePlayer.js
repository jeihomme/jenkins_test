    // youtube API 불러옴
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/player_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // 플레이어변수 설정
    function onYouTubeIframeAPIReady() {
    	
    	for (var i = 0; i < $('.yotube').length; i++) {
    		var videos;
    		var videosId = idAry[i];
	        videos = new YT.Player(videosId, {
	            width: '1000',
	            height: '563',
	            videoId: urlAry[i],
	            events: {
	            'onReady': onPlayerReady, //로딩할때 이벤트 실행
	            }
	        });
    	}
    }
    function onPlayerReady(event) {
        $(clickButtonClass).on('click', function(){
            $(this).parent().hide();
            event.target.playVideo();//자동재생
            //로딩할때 실행될 동작을 작성한다.
        });
    }