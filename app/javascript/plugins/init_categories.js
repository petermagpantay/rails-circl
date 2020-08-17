const initCategories = () => {

    const categories = document.querySelectorAll('.category')
    const input = document.querySelector('checkbox-category')
    

    const toggleButtons = (event) => {
        
        event.target.classList.toggle('active')
        console.log(event.target);
    }
    categories.forEach((category) => {
        category.addEventListener('click', toggleButtons);
    });
};

export { initCategories }
