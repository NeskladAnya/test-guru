document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.new_user')
  if (control) { control.addEventListener('click', checkPasswordFields) }

  let password_field = document.getElementById('user_password')
  let password_confirmation_field = document.getElementById('user_password_confirmation')

  let password = document.querySelector('.password')

  function checkPasswordFields() {
    if (password_field.value && password_confirmation_field.value) {
      password.classList.remove('hide')

      if (password_field.value == password_confirmation_field.value) {
        password.classList.add('text-success')
        password.classList.remove('text-danger')
      } else {
        password.classList.add('text-danger')
        password.classList.remove('text-success')
      }
    } else {
      password.classList.add('hide')
    }
  }
})
