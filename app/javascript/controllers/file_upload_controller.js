import {Controller} from "@hotwired/stimulus"
import {post} from '@rails/request.js'

// Connects to data-controller="file-upload"
export default class extends Controller {
    connect() {
    }

    async upload(event) {
        event.preventDefault();
        let file = event.dataTransfer.files[0];
        let reader = new FileReader();
        reader.onload = async () => {
            let formData = new FormData();
            formData.append('file', file);
            const response = await post('/fileUpload', {body: formData})
            if (response.ok) {
                response.json.then((data) => {
                    let postContent = document.getElementById("post_content");
                    postContent.value += `![${file.name}](${data.address})`
                })
            }
        }
        reader.readAsDataURL(file);
    }
}
