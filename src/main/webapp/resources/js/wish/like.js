let like_on = document.querySelectorAll(".like_on");
let like_off = document.querySelectorAll(".like_off");
let movie_index_like = document.querySelectorAll(".movie_index");
const document_member_index_like = document.querySelector(".member_index");
const member_index_like = parseInt(document_member_index_like.textContent);

window.onload = function () {
    // HTML 요소를 선택합니다.
    const movieBackgrounds = document.querySelectorAll('.movie_background');
    const iconBoxParents = document.querySelectorAll('.icon_box_parent');

    movieBackgrounds.forEach(movieBackground => {
      movieBackground.addEventListener('click', function (event) {
        // 클릭 이벤트를 방지하기 위해 icon_box_parent 내의 요소를 클릭한 경우 페이지 이동을 막습니다.
        if (event.target.closest('.icon_box_parent')) {
          console.log("Clicked on icon box parent");
          event.preventDefault(); // 이벤트 기본 동작을 막습니다.
        } else {
        // 클릭한 경우, 페이지로 이동합니다.
        //   const movieIndex = event.target.getAttribute('data-id');
          const movieIndex = event.target.dataset.id 
          
          console.dir(event.target);
          console.log("movieIndex : " + movieIndex);

          window.location.href = `/movie/detail.do?movieIdx=${movieIndex}`;
        }
      });
    });
  };

const likeCount = (oper) => {
	const movie_like = document.querySelector(".movie_like");
	let movie_like_count = 0
	try {		
		movie_like_count = parseInt(movie_like.outerText);
	}	catch(e) {
		return;
	}
	
	if (oper === "minus") {
		movie_like.innerText = movie_like_count -1;
		movie_like_count -= 1;
	
	} else if( oper === "plus") {
		movie_like.innerText = movie_like_count +1;
		movie_like_count += 1;
	}
}

for (let i = 0; i < like_on.length; i++) {

    $.ajax({
        type: "POST",
        url: "/wish/checked",
        data: {
            movie_index: parseInt(movie_index_like[i].textContent),
            member_index: member_index_like,
        },
        success: function (res) {
            if (res == "on") {
                // like_on 버튼이 비활성화 된다.
                like_on[i].style.display = "none";
                console.log("like_on")
            } else {
                // like_off 버튼이 비활성화 된다.
                like_off[i].style.display = "none";
				console.log("like_off")
                
            }
        },
        error: function (error) {
            console.log(error);
        }
    })
}

for(let i = 0 ; i < like_on.length ; i++) {

    like_on[i].addEventListener('click', function() {
        like_off[i].style.display="inline-block";        
        like_on[i].style.display="none";    

        let id = like_on[i].dataset.id;

        $.ajax({
            type:"POST",
            url:"/wish/unlike",
            data:{
                id:id
            },
            success: function(res) {
              likeCount("minus") 
            },
            error:function(error) {
                alert("통신 실패")
            }
        })
    })

    like_off[i].addEventListener("click",function() {
        like_on[i].style.display="inline-block";
        like_off[i].style.display="none";

        let id = like_on[i].dataset.id;

        $.ajax({
            type:"POST",
            url:"/wish/like",
            data:{
                id:id
            },
            success: function(res) {
				likeCount("plus") 
            },
            error:function(error) {
                alert("통신 실패")
            }
        })
    })
}
