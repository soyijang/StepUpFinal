    var modal = document.getElementById("myModal");
    var btn = document.getElementById("apply");
    var span = document.getElementsByClassName("close")[0];
    
    btn.onclick = function() {
        $(modal).fadeIn(300); 
        $(modal).css('display','block');
    }
    
    span.onclick = function() {
        $(modal).css('display','none');
    }
    
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    };