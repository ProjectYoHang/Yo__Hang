function getId(id){
	return document.getElementById(id);
}

let data = {};//전송 데이터(JSON)

let ws ;
let mid = getId('mid');
let btnLogin = getId('btnLogin');
let talk = getId('talk');
let one = getId('one');
let rooms = getId('rooms');



ws = new WebSocket("ws://" + location.host + "/book");
	


	
	ws.onmessage = function(one){
		let data = JSON.parse(one.data);
		let css;
		
		
		
		let item = `<div>
		                <span><b>${data.mid}</b></span> [ ${data.date} ]<br/>
                      <span>${data.one}</span>
						</div>`;
		
		
		talk.innerHTML += '<div>야호</div>';
		talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
	}


if($('#one').is(':checked')) {
	send();
}



bookbtn.onclick = function(){
	send();
}

function send(){
	if(one.value.trim() != ''){
		data.mid = getId('mid').value;
		data.one = one.value;
		data.date = new Date().toLocaleString();
		let temp = JSON.stringify(data);
		ws.send(temp);
	}
	msg.value ='';
}