const genre_button = document.querySelector("#genre_button");
const genre_box_parent = document.querySelector("#genre_box_parent");
const genre_box_list  = document.querySelectorAll(".genre_box");
const isGenreList = new Array(genre_box_list.length).fill(false)
const genre_input_box = document.querySelector("#genre_input_box")

// let isHide = true
// genre_button.addEventListener("click",(e) => {
//     console.log("aa")
//     if(isHide) {
//         genre_box_parent.classList.remove("hide")
//         genre_box_parent.classList.add("show")
//     } else {
//         genre_box_parent.classList.remove("show")
//         genre_box_parent.classList.add("hide")
//     }  
//     isHide = !isHide
// })

for (let i = 0 ; i < genre_box_list.length ;i ++) {
    genre_box_list[i].addEventListener("click",(e) => {
        if(isGenreList[i] === false) {
            const genre_name = genre_box_list[i].querySelector(".genre_name");
            let  genre_value = genre_name.innerText;
            genre_value = genre_value.toLowerCase();

            genre_box_list[i].classList.add("genre_box_active")

            const input = document.createElement("input")
            input.setAttribute("name","genre");
            input.setAttribute("value",genre_value);
            input.classList.add(`item_${genre_value}`);
            input.hidden= true;

            genre_input_box.appendChild(input);

            isGenreList[i] = true;
        }  else {
            const genre_name = genre_box_list[i].querySelector(".genre_name");
            let  genre_value = genre_name.innerText;
            genre_value = genre_value.toLowerCase();
            
            genre_box_list[i].classList.remove("genre_box_active")
            isGenreList[i] = false;
            const deleteTag = `input.item_${genre_value}`; 
            console.log(deleteTag);
            $(deleteTag).remove();

        }
    })
}