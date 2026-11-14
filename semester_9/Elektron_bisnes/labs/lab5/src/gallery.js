// Находим элементы галереи и запоминаем исходные размеры из HTML.
const selectedImage = document.getElementById('selected-image');
const choices = document.querySelectorAll('.image-choice');
const caption = document.getElementById('image-caption');
const originalWidth = Number(selectedImage.getAttribute('width'));
const originalHeight = Number(selectedImage.getAttribute('height'));
const zoomScale = 1.25;

// Масштабируем относительно исходных размеров, сохраняя пропорции.
function setImageScale(scale) {
    selectedImage.width = Math.round(originalWidth * scale);
    selectedImage.height = Math.round(originalHeight * scale);
}

function enlargeImage() { setImageScale(zoomScale); }
function resetImageSize() { setImageScale(1); }

// Показываем картинку из нажатой кнопки и обновляем подпись.
function selectImage(event) {
    const choice = event.currentTarget;
    const thumbnail = choice.querySelector('img');
    selectedImage.src = thumbnail.src;
    selectedImage.alt = thumbnail.alt;
    caption.textContent = thumbnail.alt;
    resetImageSize();

    // Переносим выделение на выбранную миниатюру.
    for (const button of choices) {
        button.classList.remove('selected');
        button.setAttribute('aria-pressed', 'false');
    }
    choice.classList.add('selected');
    choice.setAttribute('aria-pressed', 'true');
}

// Связываем нажатие, наведение и фокус с нужными функциями.
function initGallery() {
    for (const choice of choices) {
        choice.addEventListener('click', selectImage);
    }

    selectedImage.addEventListener('mouseenter', enlargeImage);
    selectedImage.addEventListener('mouseleave', resetImageSize);
    selectedImage.addEventListener('focus', enlargeImage);
    selectedImage.addEventListener('blur', resetImageSize);
}

initGallery();
