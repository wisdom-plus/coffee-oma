import { VFC } from 'react';
import { Menu, Image } from 'semantic-ui-react';
import logo from 'images/coffeeoma-logo.png';

const Menulogo: VFC = () => (
  <Menu.Item as="a" header style={{ padding: 0 }}>
    <Image size="small" src={logo} />
  </Menu.Item>
);

export default Menulogo;
