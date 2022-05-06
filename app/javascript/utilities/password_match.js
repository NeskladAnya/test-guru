document.addEventListener('turbolinks:load', function() {

  this.addEventListener('click', checkPasswordFields)

})

function checkPasswordFields() {
  var password = document.getElementById('user_password').value
  var password_confirmation = document.getElementById('user_password_confirmation').value

  if (password && password_confirmation) {
    this.querySelector('.octicon-alert').classList.remove('hide')

    if (password == password_confirmation) {
      this.querySelector('.octicon-alert').classList.add('text-success')
      this.querySelector('.octicon-alert').classList.remove('text-danger')
    } else {
      this.querySelector('.octicon-alert').classList.add('text-danger')
      this.querySelector('.octicon-alert').classList.remove('text-success')
    }
  } else {
    this.querySelector('.octicon-alert').classList.add('hide')
  } 
}