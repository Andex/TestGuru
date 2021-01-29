document.addEventListener('turbolinks:load', function() {

    let control = document.querySelector('.check-confirmation-password')

    if (control) { control.addEventListener('input', confirmationPassword) }

})

function confirmationPassword() {
    let password_field = user_password.value
    let confirmation_field = user_password_confirmation.value

    let success = this.querySelector('.octicon-check-circle-fill')
    let danger = this.querySelector('.octicon-x-circle-fill')

    if (confirmation_field === '') {
        success.classList.add('hide')
        danger.classList.add('hide')
        return
    }

    if (password_field === confirmation_field) {
        success.classList.remove('hide')
        danger.classList.add('hide')
    } else {
        danger.classList.remove('hide')
        success.classList.add('hide')
    }
}
