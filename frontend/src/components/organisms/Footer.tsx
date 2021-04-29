import { FC } from 'react';
import { Segment, Container } from 'semantic-ui-react';
import Footercolumn from 'components/molecules/Footercolumn';

const Footer: FC = () => (
  <Segment inverted vertical style={{ padding: '4rem 0' }}>
    <Container>
      <Footercolumn />
    </Container>
  </Segment>
);

export default Footer;
