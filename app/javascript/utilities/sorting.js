document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  // Create a table in the memory
  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.classList.add('table-hover')
  sortedTable.classList.add('table-bordered')

  // Create table elements in the memory
  let head = document.createElement('thead')
  let body = document.createElement('tbody')

  // Add table elements to the created in the memory table
  sortedTable.appendChild(head)
  sortedTable.appendChild(body)

  // Add header to the created in the memory table
  head.appendChild(rows[0])

  // Add already sorted rows to the table in the memory
  for (i = 0; i < sortedRows.length; i++) {
    body.appendChild(sortedRows[i])
  }

  // Replace the existing table with the one in the memory
  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
