import {Controller} from "@hotwired/stimulus"

function addTodo(posts) {
    const postsUl = document.getElementById('post-search')
    posts.forEach(item => {
        const post = document.createElement('li')
        post.addEventListener("click", () => {
            window.location.href = "/posts/"+item.id;
        })
        post.innerText = item.title
        post.classList.add("post-search-li")
        postsUl.appendChild(post)
    })
}

export default class extends Controller {
    connect() {
    }

    searchPost(event) {
        event.preventDefault();
        document.getElementById("layer").style.display = "flex"

        const csrfTokenElement = document.querySelector('meta[name="csrf-token"]');
        const csrfToken = csrfTokenElement ? csrfTokenElement.content : null;
        const form = document.getElementById('form')
        const input = document.getElementById('input')

        form.addEventListener('submit', async (e) => {
            e.preventDefault()
            fetch("/post/search", {
                method: "POST",
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-Token': csrfToken
                },
                body: JSON.stringify({q: input.value})
            }).then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // 这里将响应体的可读流转换为JSON对象
            }).then(data => {
                // 处理住家
                addTodo(data.data)
            }).catch(error => {
                console.error('Error:', error);
            });
        })
    }

    closeLayer() {
        const closeLayBtn = document.getElementById("closeLayer");
        document.getElementById("layer").style.display = "none"
    }
}






