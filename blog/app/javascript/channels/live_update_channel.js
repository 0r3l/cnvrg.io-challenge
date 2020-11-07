import consumer from "./consumer"

consumer.subscriptions.create({ channel: "CarsChannel" }, {
  received(data) {
    appendLine(data, '.cars .list table', createCarLine);
  }
});

consumer.subscriptions.create({ channel: "DriverChannel" }, {
  received(data) {
    appendLine(data, '.drivers .list table', createDriverLine);
  },
});

function appendLine(data, selector, htmlGen) {
  const html = htmlGen(data);
  const element = document.querySelector(selector)
  element.insertAdjacentHTML("beforeend", html)
}

function createCarLine(data) {
  return `
    <tr>
      <td>${data.car.title}</td>
      <td>${data.car.type}</td>
      <td>${data.car.color}</td>
      <td><img class="style_image" src="${imagePath(data.car.image)}"></td>
      <td><a href=${data.host}/cars/${data.car.id}>Show</a></td>
    </tr>
  `
}

function createDriverLine(data) {
  return `
    <tr>
      <td>${data.driver.name}</td>
      <td>${data.driver.email}</td>
      <td><img class="style_image" src="${imagePath(data.driver.image)}"></td>
      <td><a href="${data.host}/drivers/${data.driver.id}">Show</a></td>
    </tr>
  `
}

function imagePath(fullPath){
  return `/images/thumb${fullPath.substr(fullPath.lastIndexOf('/'))}`;
}
