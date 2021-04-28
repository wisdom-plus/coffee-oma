import { FC } from 'react';
import H1herader from 'components/atoms/H1herader';
import H3 from 'components/atoms/H3';
import Primarybutton from 'components/atoms/Primarybutton';

const Textcontainer: FC = () => (
  <div className="ui text container">
    <H1herader title content="coffe-oma" />
    <H3 title="コーヒーに関するすべてを" />
    <Primarybutton />
  </div>
);

export default Textcontainer;
