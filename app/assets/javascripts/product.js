$(function () {
    $(".js-more").on("click", function() {
        let id = $(this).data("id");
        $.get("/products/" + id + "/description", function(data) {
            $("#description-" + id).text(data);
        });
        $.get("/products/" + id + "/inventory", function(data) {
            console.log("inventory", data);
            if (data === "true") {
                $("#inventory-" + id).text("Inventory: Available");
            } else {
                $("#inventory-" + id).text("Inventory: Sold Out");
            }
        });
    })
})
