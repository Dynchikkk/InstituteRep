// Показываем и скрываем стрелку у ссылки, на которой произошло событие.
function showArrow(event) {
    const arrow = event.currentTarget.querySelector('.menu-arrow');
    arrow.hidden = false;
}

function hideArrow(event) {
    const arrow = event.currentTarget.querySelector('.menu-arrow');
    arrow.hidden = true;
}

// Подключаем обработчики общего графического меню.
function initGraphicMenu() {
    const menuLinks = document.querySelectorAll('.graphic-menu a');

    for (const link of menuLinks) {
        link.addEventListener('mouseenter', showArrow);
        link.addEventListener('mouseleave', hideArrow);
        link.addEventListener('focus', showArrow);
        link.addEventListener('blur', hideArrow);
    }
}

initGraphicMenu();
