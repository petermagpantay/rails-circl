const text = document.getElementById('comment-event')
const btn = document.getElementById('comment-btn')

const initComment = () => {
  if(btn){
    btn.addEventListener('click', () => {
      if (text.value == "") {
        alert("Please enter a valid comment")
      }
    });

  }
}

export { initComment }
