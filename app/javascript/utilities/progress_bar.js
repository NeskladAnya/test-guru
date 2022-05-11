document.addEventListener('turbolinks:load', function() {
  let progress = document.querySelector('.progress')
  if (progress) { setProgress(progress) }
})

function setProgress(progress) {
  let progressBar = document.querySelector('.progress-bar')
  let questionNumber = progress.dataset.questionNumber
  let questionCount = progress.dataset.questionCount

  let result = Math.round(questionNumber * 100 / questionCount)

  progressBar.ariaValueNow = result
  progressBar.style.width = result + '%'
}
