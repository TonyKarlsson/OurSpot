const messageForm = document.getElementById("new_message");

const doSomethingWhenLocationIsReady = (latitude, longitude) => {
  document.getElementById("message_latitude").value = latitude;
  document.getElementById("message_longitude").value = longitude;
  console.log(document.getElementById("message_longitude"))
  messageForm.submit();
}

const getLocation = () => {
  navigator.geolocation.getCurrentPosition(position => {
    let longitude = position.coords.longitude
    let latitude = position.coords.latitude
    doSomethingWhenLocationIsReady(latitude, longitude);
  });
}

const initGetCoordinates = () => {
  if (messageForm) {
    console.log("Hello")
    messageForm.addEventListener("submit", (event) => {
      event.preventDefault();
      getLocation();
    });
  };
};

export { initGetCoordinates };
