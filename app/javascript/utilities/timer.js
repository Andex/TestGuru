document.addEventListener('turbolinks:load', function () {

    let timer = document.getElementById('countdown')

    if(timer) {
        initializeCountDown(timer)
    }
})

function initializeCountDown(timer) {
    // ск секунд осталось на данный момент
    let distance = timer.dataset.timeLeftInSeconds
    let timeInterval = setInterval(updateCountDown, 1000)

    function updateCountDown() {
        // перевод ск секунд осталось в часы таймера
        let minutes = Math.floor(distance / 60)
        let seconds = Math.floor(distance % 60)
        seconds = seconds < 10 ? '0' + seconds : seconds
        // перезапись содержимого тега таймера на актуальное время
        timer.innerHTML = minutes + ":" + seconds
        // минус 1 секунда
        distance--

        if (distance < 0) {
            clearInterval(timeInterval)
            timer.innerHTML = ''
            document.querySelector('.time-is-over').classList.remove('hide')
            // вызов функции через 2 секунды
            setTimeout(function(){
                // перенаправление с /test_passages/:id на /test_passages/:id/result
                window.location.href = window.location.pathname + '/result';
            }, 2 * 1000);
        }
    }
}
