document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    let currentQuestionIndex = progressBar.dataset.currentQuestionIndex
    let questionsCount = progressBar.dataset.questionsCount

    let percentage = Math.round((((currentQuestionIndex - 1) / questionsCount) * 100)) + '%'

    progressBar.style.width = percentage;
    progressBar.textContent = percentage;
  }
})