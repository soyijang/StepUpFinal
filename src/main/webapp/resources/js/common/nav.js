		/* 메뉴바 숨기기용 */
		var num = 0;
		function changenav() {
			
			var menubar = document.getElementById('menubar'); 
			var menubarImg = document.getElementById('menubarImg'); 
			var menubarHide = document.getElementById('menubarHide'); 
			var menubarWithBtn = document.getElementById('menubarWithBtn'); 
			var content = document.getElementById('content'); 
			
			/* 숨기기  */
			if(num==0){
				menubarWithBtn.style.left = '-190px'
				content.style.left = '-100px'
				content.style.paddingRight = '0px'
				content.style.paddingLeft = '0px'
				menubarImg.src = "/agile/resources/icon/common/icon_nav_open.png"
				num=1; 
				
				/* 보이기 */
			}else if (num==1){
				menubarWithBtn.style.left = '0px'
				content.style.left = '0px'
				content.style.paddingRight = '20px'
				content.style.paddingLeft = '20px'
				menubarImg.src = "/agile/resources/icon/common/icon_nav_hide.png"
				num=0;
			}
			
		}