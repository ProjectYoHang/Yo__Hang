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

btnLogin.onclick = function(){
	ws = new WebSocket("ws://" + location.host + "/book");
	
	ws.onmessage = function(one){
		let data = JSON.parse(one.data);
		let css;
		
		if(data.one == '1') {
			css = 'class=checked';
		} else {
			css = 'class=no';
		}
		
		let item = `<div>
		                <span><b>${data.mid}</b></span> [ ${data.date} ]<br/>
                      <span>${data.one}</span>
						</div>`;
		
		rooms.one.setAttribute(disabled);
		talk.innerHTML += item;
		talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
	}
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