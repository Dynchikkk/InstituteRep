// Находим элементы галереи и запоминаем исходные размеры из HTML.
const selectedImage = document.getElementById('selected-image');
const choices = document.querySelectorAll('.image-choice');
const caption = document.getElementById('image-caption');
const originalWidth = Number(selectedImage.getAttribute('width'));
const originalHeight = Number(selectedImage.getAttribute('height'));
const zoomScale = 1.25;

// Масштабируем
function setImageScale(scale) {
    selectedImage.width = Math.round(originalWidth * scale);
    selectedImage.height = Math.round(originalHeight * scale);
}

function enlargeImage() { setImageScale(zoomScale); }
function resetImageSize() { setImageScale(1); }

// Выбираем картинку
function selectImage(event) {
    // Устанавливаем текущей выбранную
    const choice = event.currentTarget;
    const thumbnail = choice.querySelector('img');
    selectedImage.src = thumbnail.src;
    selectedImage.alt = thumbnail.alt;
    caption.textContent = thumbnail.alt;

    resetImageSize();

    // Убираем выделения
    for (const button of choices) {
        button.classList.remove('selected');
        button.setAttribute('aria-pressed', 'false');
    }

    // Добавляем выделение
    choice.classList.add('selected');
    choice.setAttribute('aria-pressed', 'true');
}

function initGallery() {
    // Связываем нажатие
    for (const choice of choices) {
        choice.addEventListener('click', selectImage);
    }

    selectedImage.addEventListener('mouseenter', enlargeImage);
    selectedImage.addEventListener('mouseleave', resetImageSize);
    selectedImage.addEventListener('focus', enlargeImage);
    selectedImage.addEventListener('blur', resetImageSize);
}

initGallery();
