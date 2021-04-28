import { FC } from 'react';
import Hometop from 'components/templates/Hometop';
import { Helmet } from 'react-helmet';

const Home: FC = () => (
  <>
    <Helmet title="coffe-oma" />
    <Hometop />
  </>
);

export default Home;
