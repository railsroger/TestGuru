var check = function() {
      if (document.getElementById('password').value ==
          document.getElementById('password_confirmation').value) {
          document.getElementById('message').style.color = 'green';
          document.getElementById('message').innerHTML = 'matching';
      } else {
          document.getElementById('message').style.color = 'red';
          document.getElementById('message').innerHTML = 'not matching';
      }
}