jQuery ->
  $("#search-form").submit (e) ->
    $("#results").html("")
    $("#loading").show()

  $(document).on "click", ".complete-button", (e) ->
    $(this).parent(".media").addClass("completed")
