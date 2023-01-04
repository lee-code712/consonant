var index = 0;
function solveQuestion(gameNo, quizNumber){
	const answer = document.querySelector('#inputAnswer').value;
	
	if (answer == "") {
		alert("공백은 입력할 수 없습니다.");
		return;
	}
	
	if(index == quizNumber){
		$.ajax({
			url:"/game/playGame/" + gameNo + "/" + index + "/" + encodeURI(answer),
			contentType : "application/json; charset=utf-8",
			type:"GET",
		}).done(function(){
			
		});
	}
	else if(index + 1 <= quizNumber){
		$.ajax({
			url:"/game/playGame/" + gameNo + "/" + index + "/" + encodeURI(answer),
			contentType : "application/json; charset=utf-8",
			dataType:"text", //반환 타입->데이터타입이랑 서비스에서 반환하는 타입이 안맞으면 done 동작 안함
			type:"GET",
		}).done(function(fragment){
			console.log(fragment);
			$("#playGameDiv").replaceWith(fragment);
			index++;
		});
	}
	
}

function getHint(){
	$.ajax({
		url:"/game/getHint/" + index,
		contentType : "application/json; charset=utf-8",
		dataType:"html", //반환 타입->데이터타입이랑 서비스에서 반환하는 타입이 안맞으면 done 동작 안함
		type:"GET",
	}).done(function(fragment){
		console.log(fragment);
		 $(".hintTableText").css("display","");
		 $(".hintBtn").attr("disabled", "true");
	});
}