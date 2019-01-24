function qs(arg) {
  return document.querySelector(arg)
}

function ce(arg) {
  return document.createElement(arg)
}

function render() {
  qs('#postcardlist').innerHTML = ''
  fetch('http://www.localhost:3000/api/v1/postcards')
  .then(res => res.json())
  .then(res => {
    console.log(res)
    res.forEach(one => {
      let maindiv = ce('div')
      let contentdiv = ce('div')
      let leftdiv = ce('div')
      let rightdiv = ce('div')
      let p1 = ce('p')
      let p2 = ce('p')
      let p3 = ce('p')
      let p4 = ce('p')
      maindiv.className = 'maindiv'
      contentdiv.className = 'contentdiv'
      leftdiv.className = 'leftdiv'
      rightdiv.className = 'rightdiv'
      p4.innerText = one.message
      p1.innerText = one.name
      p2.innerText = one.address.street
      p3.innerText = `${one.address.city}, ${one.address.state} ${one.address.zip}`
      rightdiv.append(p1, p2, p3)
      leftdiv.append(p4)
      contentdiv.append(leftdiv, rightdiv)
      maindiv.append(contentdiv)
      qs('#postcardlist').append(maindiv)
    })
  })
}

document.addEventListener('DOMContentLoaded', (e) => {
  render()
})

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
    .then(render)
  })
})
