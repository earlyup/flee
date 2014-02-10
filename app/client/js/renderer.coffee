class FL.Renderer
	constructor: (@stage = null) ->
		@ctx = @stage.dom.getContext('2d')

	render: ->
		@clear_stage()

		for el in @stage.children
			switch el.type()
				when 'rect'
					@ctx.fillStyle = el.color()
					@ctx.fillRect.apply @ctx, el.rect()

				when 'circle'
					@ctx.fillStyle = el.color()
					@ctx.beginPath()
					@ctx.arc.apply @ctx, el.circle()
					@ctx.fill()
					@ctx.strokeStyle = '#999'
					@ctx.stroke()
					@ctx.closePath()
		return

	clear_stage: ->
		@ctx.clearRect(0, 0, FL.app.stage.width, FL.app.stage.height)
