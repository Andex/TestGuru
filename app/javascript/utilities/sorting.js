document.addEventListener('turbolinks:load', function() {

    // выбирается элемент (ф-ция querySelector выбирает элемент по css-классу), к к-ому прикрепится событие обработки клика
    let control = document.querySelector('.sort-by-title')

    if (control) { control.addEventListener('click', sortRowsByTitle) }

})

function sortRowsByTitle() {
    let table = document.querySelector('table')

    // NodeList
    // https://developer.mozilla.org/ru/docs/Web/JavaScript
    let rows = table.querySelectorAll('tr')

    let sortedRows = []

    for (let i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    let arrowUp = rows[0].querySelector('.octicon-arrow-up')
    let arrowDown = rows[0].querySelector('.octicon-arrow-down')

    if (arrowUp.classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        arrowUp.classList.remove('hide')
        arrowDown.classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        arrowDown.classList.remove('hide')
        arrowUp.classList.add('hide')
    }
    // console.log('rows[0] = ', rows[0])

    let sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.classList.add('text-center')

    // к неатрендеренному элементу (sortedTable находится в памяти) appendChild добавляет первой строкой заголовок
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
        sortedTable.appendChild(sortedRows[i])
    }

    // физическая вставка: у отрендеренной неотсортированной таблицы берется родительский элемент
    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
}