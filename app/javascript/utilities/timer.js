document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer')

  if (control) { window.setInterval(countLeftTime, 1000) }
})

function countLeftTime() {
  var deadLine = document.querySelector('.timer').dataset.deadline
  var parsedDeadLine = Date.parse(deadLine)

  var currentTime = new Date().toISOString()
  var parsedCurrentTime = Date.parse(currentTime)

  var timeLeft = getTimeLeft(parsedDeadLine, parsedCurrentTime)

  if (timeLeft) { displayTimer(timeLeft) }
  else { stopTimer }
}

function displayTimer(time) {
  var timer = document.querySelector('.timer')

  timer.classList.remove('hide')
  timer.innerHTML = time
}

function stopTimer() {
  var timer = document.querySelector('.timer')

  timer.innerHTML = '0:0:0:0'
  clearTimeout
}

function getTimeLeft(date1, date2) {
  const timeSec = (date1 - date2) / 1000

  // --> returns the number of full days
  let full_days = Math.trunc(timeSec / 60 / 60 / 24)
  let full_days_sec = full_days * 24 * 60 * 60

  // --> returns the number of full hours
  let full_hours = Math.trunc((timeSec - full_days_sec) / 60 / 60)
  let full_hours_sec = full_hours * 60 * 60

  // --> returns the number of full minutes
  let full_minutes = Math.trunc((timeSec - full_days_sec - full_hours_sec) / 60)
  let full_minutes_sec = full_minutes * 60

  // --> returns the number of full seconds
  let full_seconds = Math.trunc(timeSec - full_days_sec - full_hours_sec - full_minutes_sec)

  if (full_days_sec + full_hours_sec + full_minutes_sec + full_seconds < 0) { 
    return false
  }
  else { return full_days + ':' + full_hours + ':' + full_minutes + ':' + full_seconds }
}


