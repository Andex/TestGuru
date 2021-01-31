document.addEventListener('turbolinks:load', function () {

    let progressBar = document.querySelector('.progress-bar')

    if (progressBar) {
        progressBar.style.width = progressBar.percent + '%'
    }

})

