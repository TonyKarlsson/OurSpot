const submitForm = () => {

  const submit = document.getElementById("btn");
  const form = document.getElementById("new_message");
    if (submit) {
    submit.addEventListener('click', (event) => {

      form.submit();

    });
  };
};


export { submitForm }
