const imgDiv = document.getElementById("profile-img");
const img = document.getElementById('photo');
const file = document.getElementById('file');
const uploadBtn = document.getElementById('upload');

function showEdit() {
    uploadBtn.style.display = "block";
}

function hideEdit() {
    uploadBtn.style.display = "none";
}

file.addEventListener('change', function() {
    const chosenFile = this.files[0];

    if (chosenFile) {
        const reader = new FileReader();

        reader.addEventListener('load', function() {
            img.setAttribute('src', reader.result);
        });

        reader.readAsDataURL(chosenFile);
    }
});