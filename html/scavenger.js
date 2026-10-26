(function () {
  var storageKey = "christmas-lights-scavenger";
  var boxes = document.querySelectorAll(".todo-list input[type='checkbox']");
  var saved = {};

  try {
    saved = JSON.parse(localStorage.getItem(storageKey)) || {};
  } catch (error) {
    saved = {};
  }

  function persist() {
    var state = {};
    boxes.forEach(function (box) {
      state[box.id] = box.checked;
    });
    localStorage.setItem(storageKey, JSON.stringify(state));
  }

  boxes.forEach(function (box) {
    box.checked = Boolean(saved[box.id]);
    box.addEventListener("change", persist);
  });
})();
