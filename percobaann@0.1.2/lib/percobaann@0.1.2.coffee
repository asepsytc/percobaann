Percobaann@0.1.2View = require './percobaann@0.1.2-view'
{CompositeDisposable} = require 'atom'

module.exports = Percobaann@0.1.2 =
  percobaann@0.1.2View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @percobaann@0.1.2View = new Percobaann@0.1.2View(state.percobaann@0.1.2ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @percobaann@0.1.2View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'percobaann@0.1.2:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @percobaann@0.1.2View.destroy()

  serialize: ->
    percobaann@0.1.2ViewState: @percobaann@0.1.2View.serialize()

  toggle: ->
    console.log 'Percobaann@0.1.2 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
