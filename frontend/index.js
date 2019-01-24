function qs(arg) {
  return document.querySelector(arg)
}

function ce(arg) {
  return document.createElement(arg)
}

qs('.postcardform').addEventListener('submit', (e) => {
  e.preventDefault();
  let split = e.target.city.value.split(', ')
  let city = split[0]
  let split2 = split[1].split(' ')
  let state = split2[0]
  let zip = +split2[1]
  let addressData = {
     street: e.target.street.value,
     city: city,
     state: state,
     zip: zip,
   }
  fetch('http://www.localhost:3000/api/v1/addresses', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(addressData)
  })
  .then(res => res.json())
  .then(res => {
    let postcardData = {
      message: e.target.message.value,
      name: e.target.name.value,
      address_id: res.id
    }
    fetch('http://www.localhost:3000/api/v1/postcards', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(postcardData)
    })
    .then(console.log('successfully created!!!'))
  })
})
