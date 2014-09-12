postsController = ($scope, $http, $timeout) ->

  $scope.posts_container = document.querySelector('#tiles')

  $scope.msnry = null

  $scope.count = 0

  $http.get("/posts_ng")
  .success (response) ->
    $scope.posts = response
    $scope.count = $scope.posts.length
    $('.loading ').hide()

  $timeout ->
    imagesLoaded $scope.posts_container, ->
      $scope.msnry = new Masonry($scope.posts_container, {itemSelector: ".item"})
  ,100

  $(window).scroll ->
    flag = $('.item:last').visible()

    if flag
      $http.post("/posts_ng_add", { count: $scope.count})
      .success (response) ->
        $scope.posts = $scope.posts.concat(response);

        imagesLoaded $scope.posts_container, ->

          dom_el = document.querySelectorAll('li.item')

          i = $scope.count
          elements = new Array()
          while i < dom_el.length
            elements.push dom_el[i]
            i++

          $scope.msnry.appended(elements)

          $scope.count = $scope.posts.length

window.postsController = postsController