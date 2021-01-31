document.addEventListener('turbolinks:load', function () {
    let controls = document.querySelectorAll('.form-inline-link')

    for (let i = 0; i < controls.length; i++) {
        controls[i].addEventListener('click', formInlineLinkHandler)
    }
})

function formInlineLinkHandler(event) {
    event.preventDefault()

    let testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

    console.log('formInline = ', formInline)
    console.log('testTitle = ', testTitle)
    console.log('link = ', link)

    if (formInline.classList.contains('hide')) {
        formInline.classList.remove('hide')
        testTitle.classList.add('hide')
        link.textContent =  'Cancel'
    } else {
        formInline.classList.add('hide')
        testTitle.classList.remove('hide')
        link.textContent =  'Edit'
    }
}