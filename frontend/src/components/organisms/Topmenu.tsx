import { FC } from 'react';
import { Menu, Container } from 'semantic-ui-react';
import Menulogo from 'components/atoms/Menulogo';

const Topmenu: FC = () => (
  <Menu fixed="top" inverted color="teal">
    <Container>
      <Menulogo />
    </Container>
  </Menu>
);

export default Topmenu;
