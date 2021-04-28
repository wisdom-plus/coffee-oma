import { FC } from 'react';
import { Button, Icon } from 'semantic-ui-react';

const Primarybutton: FC = () => (
  <>
    <Button size="huge" primary>
      coffee-omaを始める
      <Icon name="arrow right" />
    </Button>
  </>
);

export default Primarybutton;
