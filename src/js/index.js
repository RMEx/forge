import * as ruby from './ruby'
import elm from '../elm/Main.elm'

const container = document.getElementById('app');
const elmApp = elm.Main.embed(container);
