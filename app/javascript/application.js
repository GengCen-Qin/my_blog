// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import LocalTime from "local-time"
LocalTime.start()
let prevScrollTop = window.scrollY;

// 控制导航栏展示
window.addEventListener('scroll', (event) => {
    const nav = document.getElementById("header-nav");
    if (prevScrollTop > window.scrollY) {
        nav.classList.add("active")
    } else if (prevScrollTop < window.scrollY) {
        nav.classList.remove("active")
    }
    prevScrollTop = window.scrollY
})

const textEl = document.getElementById("introduce");
const text = textEl.innerText
let idx = 1

writeText()

function writeText() {
    textEl.innerText = text.slice(0, idx)
    idx++
    if(idx > text.length) {
        idx = 1
    }
    setTimeout(writeText, 300)
}
