const messageForm = document.getElementById("new_message");
const newMessage = document.querySelector('#message-btn');

const doSomethingWhenLocationIsReady = (latitude, longitude) => {
  if (messageForm) {
    document.getElementById("message_latitude").value = latitude;
    document.getElementById("message_longitude").value = longitude;
    messageForm.submit();
  } else if (newMessage) {
    window.location.href = `/messages/new?lat=${latitude}&lng=${longitude}`;
  };
};

const getLocation = () => {
  navigator.geolocation.getCurrentPosition(position => {
    let longitude = position.coords.longitude
    let latitude = position.coords.latitude
    doSomethingWhenLocationIsReady(latitude, longitude);
  });
}

const initGetCoordinates = () => {
  if (messageForm) {
    messageForm.addEventListener("submit", (event) => {
      event.preventDefault();
      getLocation();
    });
  } else if (newMessage) {
    newMessage.addEventListener("click", (event) => {
      event.preventDefault();
      getLocation();
    });  
  };
};

export { initGetCoordinates };
