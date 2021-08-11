require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("bootstrap")
import "@fortawesome/fontawesome-free/css/all";
import "../stylesheets/application";
import "chartkick/chart.js";
document.addEventListener("turbolinks:load", ()=>{
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})