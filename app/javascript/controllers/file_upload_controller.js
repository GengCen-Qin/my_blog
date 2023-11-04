import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="file-upload"
export default class extends Controller {
    connect() {
    }

    upload(event) {
        event.preventDefault();
        let file = event.dataTransfer.files[0];
        let reader = new FileReader();
        reader.onload = async () => {
            let formData = new FormData();
            formData.append('file', file);
            fetch('/fileUpload', {
                method: 'POST',
                body: formData,
                credentials: 'include'
            })
                .then(response => response.json())
                .then(data => {
                    if (data.code === 200) {
                        let postContent = document.getElementById("post_content");
                        postContent.value += `![${file.name}](${data.address})`
                    }
                });
        }
        reader.readAsDataURL(file);
    }
}
