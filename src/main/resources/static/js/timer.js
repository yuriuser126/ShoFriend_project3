/**
 * 
 */

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.time-left').forEach(el => {
      const endTimeStr = el.dataset.endTime;
      const endTime = new Date(endTimeStr);
  
  	
      function update() {
        const now = new Date();
        const diff = endTime - now;
        
	  	if (isNaN(diff)) {
	      return;
	    }
        const hours = Math.floor(diff / 3600000);
        const minutes = Math.floor((diff % 3600000) / 60000);
        const seconds = Math.floor((diff % 60000) / 1000);
  
        // ✅ 백틱은 JSP 바깥에서 안전하게 작동
        el.textContent = `⏰ 종료까지 ${hours}시간 ${minutes}분 ${seconds}초`;
      }
  
      update();
      setInterval(update, 1000);
    });
  });
  