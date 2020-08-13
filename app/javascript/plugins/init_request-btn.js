const reqBtn = document.getElementById('req-btn')
const reqStatus = document.getElementById('req-status')

const initRequestBtn = reqBtn.addEventListener('click', (event) => {
    event.preventDefault();
    reqBtn.style.display = "none";
    reqStatus.classList.remove('d-none');
});

export { initRequestBtn };