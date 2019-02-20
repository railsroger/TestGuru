document.addEventListener('turbolinks:load', function() {
  var timerView = document.querySelector('.timer')

  if (timerView) {
    var timers = timerView.dataset.timer

    setInterval(function() {
      if (timers > 0) {
        timers -= 1
      } else {
        alert('Your time is up!')
        document.querySelector('form').submit()
      }

      resultTime = parseInt(timers / 60) + ':' + timers % 60
      timerView.textContent = resultTime
    }, 1000)
  }
})