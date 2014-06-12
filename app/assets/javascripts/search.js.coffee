jQuery ->
  $("#search-form").submit (e) ->
    $("#results").html("")
    $("#loading").show()
