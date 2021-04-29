import { VFC } from 'react';
import { Route, Switch } from 'react-router';
import TopMenu from 'components/organisms/Topmenu';
import Home from 'components/pages/Home';
import Footer from 'components/organisms/Footer';
import Policy from 'components/templates/Policy';
import './App.css';

const App: VFC = () => (
  <>
    <TopMenu />
    <Switch>
      <Route exact path="/">
        <Home />
      </Route>
      <Route path="/private_policy">
        <Policy isprivate />
      </Route>
      <Route path="/policy">
        <Policy />
      </Route>
    </Switch>
    <Footer />
  </>
);

export default App;
