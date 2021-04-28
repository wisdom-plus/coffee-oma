import { FC } from 'react';
import Hometoptitles from 'components/organisms/Hometoptitles';
import Homeicongrid from 'components/organisms/Homeicongrid';
import Homeranking from 'components/organisms/Homeranking';

const Hometop: FC = () => (
  <>
    <Hometoptitles />
    <Homeicongrid />
    <Homeranking />
  </>
);

export default Hometop;
