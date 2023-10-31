// 공유 버튼 누르면 url 복사 창 표시
function show() {
    
    let share = document.getElementById('share');
    if (share.style.display === 'none') {
    	share.style.display = 'block';    
    } else if (share.style.display === 'block') {
    	share.style.display = 'none';
    }
}



// url 복사
function copy() {
	let targetURL = document.getElementById('targetURL');
	targetURL.disabled = false;
	targetURL.select();
	document.execCommand("copy");
	targetURL.disabled = true;
	alert("URL이 복사되었습니다.")
}