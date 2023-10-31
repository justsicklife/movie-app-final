// 체크 박스
function checkSelectAll() {
  // 전체 체크박스
  const checkboxes
    = document.querySelectorAll('input[name="chk"]');
  // 선택된 체크박스
  const checked
    = document.querySelectorAll('input[name="chk"]:checked');
  // select all 체크박스
  const selectAll
    = document.querySelector('input[name="selectall"]');

  if (checkboxes.length === checked.length) {
    selectAll.checked = true;
  } else {
    selectAll.checked = false;
  }

}

function selectAll(selectAll) {
  const checkboxes
    = document.getElementsByName('chk');

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}


//-----------------------------------------------------------------------------

// 장바구니 삭제
$(function () {
  var chkObj = document.getElementsByName("chk");
  var rowCnt = chkObj.length;

  $("input[name='selectall']").click(function () {
    var chk_listArr = $("input[name='chk']");
    for (var i = 0; i < chk_listArr.length; i++) {
      chk_listArr[i].checked = this.checked;
    }
  });
  $("input[name='chk']").click(function () {
    if ($("input[name='chk']:checked").length == rowCnt) {
      $("input[name='selectall']")[0].checked = true;
    }
    else {
      $("input[name='selectall']")[0].checked = false;
    }
  });
});


function deleteValue() {
  var url = "/cart/deleteCart";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
  var valueArr = new Array();
  var list = $("input[name='chk']");
  for (var i = 0; i < list.length; i++) {
    if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
      valueArr.push(list[i].value);
    }
  }
  console.log(valueArr);
  if (valueArr.length == 0) {
    alert("선택된 영화가 없습니다.");
  }
  else {
    var chk = confirm("정말 삭제하시겠습니까?");
    if(chk == true) {

      $.ajax({
        url: url,                    // 전송 URL
      type: 'POST',                // GET or POST 방식
      traditional: true,
      data: {
        valueArr: valueArr,        // 보내고자 하는 data 변수 설정
        movieIndex: '${item.movie_index}'
      },
      success: function (jdata) {
        console.log(jdata)
        if (jdata === 1) {
          alert("삭제 성공");
          location.href="/cart/myCart.do";
        }
      }
    });
  } else {
    alert("삭제 취소")
  }
  }
}

//----------------------------------------------------------------------------

//금액 계산
$(":checkbox").click(function () {
  let total = 0; // 초기화된 total 값
  let cbArray = document.querySelectorAll("#checkbox_value"); // type 속성으로 체크 박스 요소 선택

  for (let i = 0; i < cbArray.length; i++) {
    let chkbox = cbArray[i];
    if (chkbox.checked) {
      let price = parseFloat(chkbox.getAttribute('data-price'));
      total += price;
    }
  }

  // '원'을 숫자 뒤에 붙이기
  let formattedTotal = total.toLocaleString('ko-KR') + '원';

  document.getElementById("total").value = formattedTotal; // 형식화된 총 합을 총합 필드에 반영
});




//--------------------------------------------------
// function startCart() {
//   $.ajax({
//     // URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
//     url: "/cart/loadCart.do", // 요청이 전송될 URL 주소
//     type: "post", // http 요청 방식 (default: ‘GET’)
//     dataType: "json",
//     async: true,  // 요청 시 동기화 여부. 기본은 비동기(asynchronous) 요청 (default: true)
//     // cache : true,  // 캐시 여부
//     // timeout : 3000, // 요청 제한 시간 안에 완료되지 않으면 요청을 취소하거나 error 콜백을 호출.(단위: ms)
//     // 요청 시 포함되어질 데이터
//     // processData : true, // 데이터를 컨텐트 타입에 맞게 변환 여부
//     // contentType : "application/json", // 요청 컨텐트 타입
//     // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
//     contentType: "application/x-www-form-urlemcoded; charset=UTF-8",
//     success: function (data, status, xhr) {
//       console.log(data);
//       console.log("success");
//       // 정상적으로 응답 받았을 경우에는 success 콜백이 호출되게 됩니다.
//       // 이 콜백 함수의 파라미터에서는 응답 바디, 응답 코드 그리고 XHR 헤더를 확인할 수 있습니다.
//     },
//     error: function (xhr, status, error) {
//       console.log(xhr, status, error);
//       // 응답을 받지 못하였다거나 정상적인 응답이지만 데이터 형식을 확인할 수 없기 때문에
//       // error 콜백이 호출될 수 있습니다.
//       // 예를 들어, dataType을 지정해서 응답 받을 데이터 형식을 지정하였지만,
//       // 서버에서는 다른 데이터형식으로 응답하면  error 콜백이 호출되게 됩니다.
//     },

//   });
// }

// $(document).ready(function () {
//   startCart();
// })


// ======================================================= 스크립트
var IMP = window.IMP;

IMP.init("imp43543728");

function requestPay() {

	const time = new Date().getTime();

	const buyer_name = document.querySelector(".buyer_name");
	const buyer_email = document.querySelector(".buyer_email");
	const buyer_phone = document.querySelector(".buyer_phone");

	const memberId = document.querySelector("#user_id");
	const products = document
			.querySelectorAll('input[name="chk"]:checked')

	IMP.request_pay({
		pg : "nice",
		pay_method : "card",
		merchant_uid : `merchant_${time}`, // 주문번호
		name : "영화",
		amount : 100, // 숫자 타입
		buyer_email : buyer_email,
		buyer_name : buyer_name,
		buyer_tel : buyer_phone,
		buyer_addr : "서울특별시 강남구 신사동",
		buyer_postcode : "01181"
	}, function(rsp) { // callback
		if (rsp.success) {

		} else {
			const movieId = []
			for (let i = 0; i < products.length; i++) {
				movieId.push(parseInt(products[i].value))
			}
			$.ajax({
				type : "POST",
				url : "/mymovie/add",
				traditional : true,
				data : {
					movieId : movieId,
					memberId : memberId.outerText,
				},
				success : function(res) {
					location.href = "/mymovie/list.do"
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
	});
}