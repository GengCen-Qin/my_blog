// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import LocalTime from "local-time"
LocalTime.start()

let prevScrollTop = window.scrollY;
window.addEventListener('scroll', (event) => {
    const nav = document.getElementById("header-nav");
    if (prevScrollTop > window.scrollY) {
        nav.classList.add("active")
    } else if (prevScrollTop < window.scrollY) {
        nav.classList.remove("active")
    }
    prevScrollTop = window.scrollY
})
