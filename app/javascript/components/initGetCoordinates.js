const initGetCoordinates = () => {
  const submit = document.getElementById("new_message");

  function doSomethingWhenLocationIsReady(latitude, longitude) {
    document.getElementById("message_latitude").value = latitude;
    document.getElementById("message_longitude").value = longitude;
    submit.submit();
  }

  const getLocation = () => {
    navigator.geolocation.getCurrentPosition(position => {
    let longitude = position.coords.longitude
    let latitude = position.coords.latitude
    doSomethingWhenLocationIsReady(latitude, longitude);
    });
  }

  if (submit) {
    console.log("Hello")
    submit.addEventListener("submit", (event) => {
      event.preventDefault();
      getLocation();
    });
  };
};

export { initGetCoordinates };
