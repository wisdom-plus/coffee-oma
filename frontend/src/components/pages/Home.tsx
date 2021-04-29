import { FC } from 'react';
import Hometop from 'components/templates/Hometop';
import { Helmet } from 'react-helmet';
import { Container } from 'semantic-ui-react';

const Home: FC = () => (
  <>
    <Helmet title="coffe-oma" />
    <Container style={{ paddingTop: '60px' }}>
      <Hometop />
    </Container>
  </>
);

export default Home;
