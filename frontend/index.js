function qs(arg) {
  return document.querySelector(arg)
}

function ce(arg) {
  return document.createElement(arg)
}

let states

function findState(){
  states.forEach(state => {
    if(state.name === res.state){
     return postCardData = {
        message: e.target.message.value,
        name: e.target.name.value,
        address_id: res.id,
        state_id: state.id,
        url: state.url
      }
    }
  })
}

function render() {
  qs('#postcardlist').innerHTML = ''
  fetch('http://www.localhost:3000/api/v1/postcards')
  .then(res => res.json())
  .then(res => {
    console.log(res)
    res.forEach(one => {
      let maindiv = ce('div')
      let image = ce('img')
      let contentdiv = ce('div')
      let leftdiv = ce('div')
      let rightdiv = ce('div')
      let p1 = ce('p')
      let p2 = ce('p')
      let p3 = ce('p')
      let p4 = ce('p')
      image.src = one.state.image_url
      image.className = 'smallpostcardimg'
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
      maindiv.append(image, contentdiv)
      qs('#postcardlist').append(maindiv)
    })
  })
}

document.addEventListener('DOMContentLoaded', (e) => {
  render()
  fetch(`http://localhost:3000/api/v1/states`)
    .then(res => res.json())
    .then(res => states = res)
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
    states.forEach(state => {
      if(state.name === res.state){
       return postcardData = {
          message: e.target.message.value,
          name: e.target.name.value,
          address_id: res.id,
          state_id: state.id
        }
      }
    })
    fetch('http://www.localhost:3000/api/v1/postcards', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(postcardData)
    })
    .then(render)
    .then(res => {
      e.target.message.value = ''
      e.target.name.value = ''
      e.target.street.value = ''
      e.target.city.value = ''
    })
  })
})
