$(function () {
    $(".js-more").on('click', function() {
      var id = $(this).data("id");
      $.get("/products/" + id + "/description", function(data) {
        $("#description-" + id).text(data);
      });
      $.get("/products/" + id + "/inventory", function(data) {
          if(data === "true") {
              $("#inventory-" + id).append("<p>Available</p>");
          } else {
          $("#inventory-" + id).append("<p>Sold Out</p>");
          };
      });
    });
  });

     