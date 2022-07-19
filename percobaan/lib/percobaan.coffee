PercobaanView = require './percobaan-view'
{CompositeDisposable} = require 'atom'

module.exports = Percobaan =
  percobaanView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @percobaanView = new PercobaanView(state.percobaanViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @percobaanView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'percobaan:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @percobaanView.destroy()

  serialize: ->
    percobaanViewState: @percobaanView.serialize()

  toggle: ->
    console.log 'Percobaan was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
