document.addEventListener('turbolinks:load', function () {

    let progressBar = document.querySelector('.progress-bar')

    if (progressBar) {
        progressBar.style.width = progressBar.dataset.percent + '%'
        console.log('percent = ', progressBar.dataset.percent)
    }

})

