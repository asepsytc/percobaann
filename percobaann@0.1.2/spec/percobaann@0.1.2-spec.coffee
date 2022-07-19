Percobaann@0.1.2 = require '../lib/percobaann@0.1.2'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Percobaann@0.1.2", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('percobaann@0.1.2')

  describe "when the percobaann@0.1.2:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.percobaann@0.1.2')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'percobaann@0.1.2:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.percobaann@0.1.2')).toExist()

        percobaann@0.1.2Element = workspaceElement.querySelector('.percobaann@0.1.2')
        expect(percobaann@0.1.2Element).toExist()

        percobaann@0.1.2Panel = atom.workspace.panelForItem(percobaann@0.1.2Element)
        expect(percobaann@0.1.2Panel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'percobaann@0.1.2:toggle'
        expect(percobaann@0.1.2Panel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.percobaann@0.1.2')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'percobaann@0.1.2:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        percobaann@0.1.2Element = workspaceElement.querySelector('.percobaann@0.1.2')
        expect(percobaann@0.1.2Element).toBeVisible()
        atom.commands.dispatch workspaceElement, 'percobaann@0.1.2:toggle'
        expect(percobaann@0.1.2Element).not.toBeVisible()
