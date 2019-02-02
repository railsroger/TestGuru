function checkPassword() {

  var password = document.getElementById('password');
  var password_confirmation = document.getElementById('password_confirmation');
  var message = document.getElementById('message');
  var goodColor = 'green';
  var badColor = 'red';

  if(password.value.length > 5) {

    password.style.backgroundColor = goodColor
    message.style.color = goodColor;
    message.innerHTML = "Character number ok!"
  }
  else {

    password.style.backgroundColor = badColor;
    message.style.color = badColor;
    message.innerHTML = "You have to enter at least 6 digit!"
    return;
  }

  if(password.value == password_confirmation.value) {
    
    password_confirmation.style.backgroundColor = goodColor;
    message.style.color = goodColor;
    message.innerHTML = "matching!"
  }

  else {
    
    password_confirmation.style.backgroundColor = badColor;
    message.style.color = badColor;
    message.innerHTML = "These password don`t match!"
  }

}