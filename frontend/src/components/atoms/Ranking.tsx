import { FC } from 'react';
import { Card, Icon } from 'semantic-ui-react';

type Rank = {
  id: number;
  link: string;
  imageurl: string;
  itemname: string;
  meta: string;
  shopname: string;
  likescount: number;
};

type Count = {
  count: number;
};

const extra: FC<Count> = ({ count }) => <Icon name="heart">{count}</Icon>;

const Ranking: FC<{ rankings: Rank[] }> = ({ rankings }) => (
  <>
    {rankings.map((rank) => (
      <Card
        key={rank.id}
        href={rank.link}
        image={rank.imageurl}
        header={rank.itemname}
        meta={rank.shopname}
        extra={extra}
      />
    ))}
  </>
);

export default Ranking;
