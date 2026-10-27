document.querySelectorAll('.image').forEach(image => {
    image.addEventListener('click', () => {
        image.style.backgroundColor = image.style.backgroundColor === 'rgb(255, 99, 71)' ? '#ddd' : 'rgb(255, 99, 71)';
    });
});
