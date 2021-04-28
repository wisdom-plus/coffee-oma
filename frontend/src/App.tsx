import { VFC } from 'react';
import { Route, Switch } from 'react-router';
import Home from 'components/pages/Home';
import './App.css';

const App: VFC = () => (
  <Switch>
    <Route exact path="/">
      <Home />
    </Route>
  </Switch>
);

export default App;
