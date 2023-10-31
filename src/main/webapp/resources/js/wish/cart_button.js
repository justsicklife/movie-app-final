let cart_on = document.querySelectorAll(".cart_on");
let cart_off = document.querySelectorAll(".cart_off");
let movie_index = document.querySelectorAll(".movie_index");
const document_member_index = document.querySelector(".member_index");
const member_index = parseInt(document_member_index.textContent);

for (let i = 0; i < cart_on.length; i++) {
    $.ajax({
        type: "POST",
        url: "/cart/checked",
        // 1. data를 url 보냄
        // 2. url 이 받음 
        // 3. controller 에 (/cart/checked) checked 메서드가 받고 
        // 4. service.checkedCart 메서드를 실행하고 check 변수에 null 값 이나 객체값이 담긴다.
        
        // 5. check 가 null 이라면 success 함수에서 on 을 반환
        // 6. check 가 CartDto 객체 값이라면 off 를 반환
        data: {
            movie_index: parseInt(movie_index[i].textContent),
            member_index: member_index,
        },
        success: function (res) {
        // 7. res 는 controller에서 반환한 값 이 담긴다.

            if (res == "on") {
                // cart_on 버튼이 비활성화 된다.
                cart_on[i].style.display = "none";
            } else if(res == "keep") {
                cart_on[i].style.display = "none";
            	cart_off[i].style.display = "none";
            }
             else {
                // cart_off 버튼이 비활성화 된다.
                cart_off[i].style.display = "none";
            }
        },
        error: function (error) {
            console.log(error);
        }
    })
}

for (let i = 0; i < cart_on.length; i++) {

    cart_on[i].addEventListener('click', function () {
        cart_off[i].style.display = "inline-block";
        cart_on[i].style.display = "none";

        let id = cart_on[i].dataset.id;

        $.ajax({
            type: "POST",
            url: "/cart/unlike",
            data: {
                id: id
            },
            success: function (res) {
                console.log(res)                
            },
            error: function (error) {
                console.log(error)
            }
        })
    })

    cart_off[i].addEventListener("click", function () {
        cart_on[i].style.display = "inline-block";
        cart_off[i].style.display = "none";
			
        let id = cart_on[i].dataset.id;

        $.ajax({
            type: "POST",
            url: "/cart/like",
            data: {
                id: id
            },
            success: function (res) {
                console.log(res)
            },
            error: function (error) {
                console.log(error)
            }
        })
    })
}