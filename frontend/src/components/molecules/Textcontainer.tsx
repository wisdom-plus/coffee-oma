import { FC } from 'react';
import Toptitle from 'components/atoms/Toptitle';
import H3 from 'components/atoms/H3';
import Primarybutton from 'components/atoms/Primarybutton';

const Textcontainer: FC = () => (
  <div className="ui text container">
    <Toptitle />
    <H3 title="コーヒーに関するすべてを" />
    <Primarybutton />
  </div>
);

export default Textcontainer;
