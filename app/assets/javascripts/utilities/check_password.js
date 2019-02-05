document.addEventListener('turbolinks:load', function() {
  password.addEventListener('keyup', checkPassword)
  password_confirmation.addEventListener('keyup', checkPassword)
})

function checkPassword() {

  var password = document.getElementById('password');
  var password_confirmation = document.getElementById('password_confirmation');
  var message = document.getElementById('message');
  var goodColor = 'green';
  var badColor = 'red';

  if(password.value.length > 5) {

    password.style.backgroundColor = goodColor
    message.style.color = goodColor;
    message.textContent = "Character number ok!"
  }
  else {

    password.style.backgroundColor = badColor;
    message.style.color = badColor;
    message.textContent = "You have to enter at least 6 digit!"
    return;
  }

  if(password.value == password_confirmation.value) {
    
    password_confirmation.style.backgroundColor = goodColor;
    message.style.color = goodColor;
    message.textContent = "matching!"
  }

  else {
    
    password_confirmation.style.backgroundColor = badColor;
    message.style.color = badColor;
    message.textContent = "These password don`t match!"
  }

}