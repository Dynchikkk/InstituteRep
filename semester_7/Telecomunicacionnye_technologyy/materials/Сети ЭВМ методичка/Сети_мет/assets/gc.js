
  function update(){
      var checked = 0;
      var progBar = document.getElementById("progress_done");
      //Reference the Form.
      var tasks = document.getElementById("tasks");
      boxes = tasks.querySelectorAll("input[type='checkbox']:checked");
      checked = boxes.length;
      var k = document.querySelectorAll("input[type='checkbox']").length;
    progBar.style.width = ((checked / k) * 100) + "%";
  }
    checks = document.querySelectorAll("input[type='checkbox']");
    checks.forEach(function(box) {
      box.addEventListener("change", function(e) {
        update()
      });
    
  });
  function fade_out(){
    var mc =  document.getElementById("menu-content");
    if(mc.style.visibility === "visible"){
      mc.style.visibility  =  "hidden";
    }else {
      mc.style.visibility = "visible";
    }
  }
  
 