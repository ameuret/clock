module.exports =
class ClockView
  constructor: (serializeState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('clock',  'overlay', 'from-top')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Clock package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)
    atom.workspaceView.statusBar?.appendRight('<span id="clock"></span>')
    @intId = setInterval(this.update,1000)

    # Register command that toggles this view
    atom.commands.add 'atom-workspace', 'clock:toggle': => @toggle()

  update: ->
    clockSpace = document.getElementById('clock')
    clockSpace.textContent = " "+(new Date()).toLocaleTimeString()
  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()
    clearInterval(@intId)

  # Toggle the visibility of this view
  toggle: ->
    console.log 'ClockView was toggled!'

    if @element.parentElement?
      @element.remove()
    else
      atom.workspaceView.append(@element)
