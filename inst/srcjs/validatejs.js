  function add_validation_field(id) {
  var element = document.getElementById(id).parentElement;
  var alertElem = document.createElement('div');
  element.appendChild(alertElem);
  const styles = {
    minHeight: '20px',
    color: 'red',
    fontWeight: 'bold'
  };
  Object.assign(alertElem.style, styles);
  alertElem.innerHTML = '<span> </span>';
 }

  function updateAlert(id, text) {
    var alertElem = document.getElementById(id).nextElementSibling;
    alertElem.innerHTML = text;
  }

  function waitForEl(id, runFun) {
    var element = document.getElementById(id);
    if (element) {
      runFun(id);
    } else {
      setTimeout(waitForEl(id, runFun), 300);
    }
  }

