$(function(){
    $("#new_genre").validate({
        rules : {
            "genre[in_genre]": {
                required: true
            }
        },
        messages: {
            "genre[in_genre]": {
                required: "必須入力です",
            }
        },
        errorPlacement: function(error, element) {
            if (element.attr("name") == "genre_in_genre") {
                console.log("2")
                console.log(element)
                console.log(error)
                error.insertAfter("#genre_in_genre");
            } else {
                console.log("1")
                console.log(error)
                console.log(element)
                error.insertAfter(element);
            }
        }
    });
});


