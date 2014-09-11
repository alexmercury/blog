postsController = ($scope, $http, $timeout) ->
  $http.get("/posts_ng")
  .success (response) ->
    $scope.posts = response

  $timeout ->
    container = document.querySelector('#tiles')

    imagesLoaded container, ->
      msnry = new Masonry(container,{itemSelector: ".item"})
  ,100

window.postsController = postsController