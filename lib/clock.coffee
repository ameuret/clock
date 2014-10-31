ClockView = require './clock-view'

module.exports =
  clockView: null

  activate: (state) ->
    @clockView = new ClockView(state.clockViewState)

  deactivate: ->
    @clockView.destroy()

  serialize: ->
    clockViewState: @clockView.serialize()
