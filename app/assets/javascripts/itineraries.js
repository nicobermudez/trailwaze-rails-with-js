$(() => {
  bindClickHandlers()
})

// Hijack search and render using ajax

const bindClickHandlers = function() {
  $('.search-input').on('keydown', function(e) {
    e.preventDefault()

    fetch(`/itineraries.json`).then(res => res.json()).then(function(data) {
      console.log(data)
    })
  })
}
