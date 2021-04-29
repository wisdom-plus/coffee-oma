import { FC } from 'react';
import { Card } from 'semantic-ui-react';
import Ranking from 'components/atoms/Ranking';

const rankings = {
  id: 1,
  link: 's',
  imageurl: 's',
  itemname: 's',
  meta: 's',
  shopname: 's',
  likescount: 1,
};

const Threecards: FC = () => (
  <Card.Group itemPerRow={3}>
    <Ranking rankings={[rankings]} />
  </Card.Group>
);

export default Threecards;
