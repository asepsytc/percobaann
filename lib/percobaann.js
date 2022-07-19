'use babel';

import PercobaannView from './percobaann-view';
import { CompositeDisposable } from 'atom';

export default {

  percobaannView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.percobaannView = new PercobaannView(state.percobaannViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.percobaannView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'percobaann:toggle': () => this.toggle()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.percobaannView.destroy();
  },

  serialize() {
    return {
      percobaannViewState: this.percobaannView.serialize()
    };
  },

  toggle() {
    console.log('Percobaann was toggled!');
    return (
      this.modalPanel.isVisible() ?
      this.modalPanel.hide() :
      this.modalPanel.show()
    );
  }

};
