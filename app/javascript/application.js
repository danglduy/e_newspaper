// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// AlpineJS
import Alpine from "alpinejs"
window.Alpine = Alpine

document.addEventListener("DOMContentLoaded", function(event) {
  window.Alpine.start();
});

import "trix"
import "@rails/actiontext"
