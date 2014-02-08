class FL.Shuttle
	constructor: ->
		[@x, @y, @radius] = [
			FL.app.stage.width / 2
			FL.app.stage.height / 2
			5
		]
		@_color = '#333'

	type: ->
		'circle'

	update: ->
		@x += FL.app.controller.velocity.x * FL.app.time_delta
		@y += FL.app.controller.velocity.y * FL.app.time_delta

		@check_bound()

	color: (color) ->
		if color
			@_color = color
		else
			@_color

	circle: (circle) ->
		if circle
			[@x, @y, @radius] = circle
		else
			[@x, @y, @radius, 0, 2 * Math.PI]

	check_bound: ->
		if @x < 0
			@x = 0
		if @x > FL.app.stage.width
			@x = FL.app.stage.width
		if @y < 0
			@y = 0
		if @y > FL.app.stage.height
			@y = FL.app.stage.height