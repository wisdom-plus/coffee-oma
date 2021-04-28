import { FC } from 'react';
import Header from 'components/atoms/Header';
import Primarybutton from 'components/atoms/Primarybutton';

const Textcontainer: FC = () => (
  <div className="ui text container">
    <Header title content="coffe-oma" elementtype="h1" />
    <h3>コーヒー関するすべてを</h3>
    <Primarybutton />
  </div>
);

export default Textcontainer;
