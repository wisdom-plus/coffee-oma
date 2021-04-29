import { FC } from 'react';
import { Grid } from 'semantic-ui-react';
import Menulogo from 'components/atoms/Menulogo';
import Footerlist from 'components/atoms/Footerlist';

const List = [
  {
    id: 1,
    content: 'トップページ',
    url: '/',
  },
  {
    id: 2,
    content: 'プライベートポリシー',
    url: '/private_policy',
  },
  {
    id: 3,
    content: '利用規約',
    url: 'policy',
  },
  {
    id: 4,
    content: 'お問い合わせ',
    url: '/contact/new',
  },
];

const List2 = [
  {
    id: 1,
    content: 'アイテムの一覧を見る',
    url: '/products',
  },
  {
    id: 2,
    content: 'アイテムを登録する',
    url: '/product/new',
  },
];

const Footercolumn: FC = () => (
  <Grid stackable inverted divided columns="equal">
    <Grid.Column width={3}>
      <Menulogo />
    </Grid.Column>
    <Grid.Column width={3}>
      <Footerlist links={List} />
    </Grid.Column>
    <Grid.Column width={3}>
      <Footerlist links={List2} />
    </Grid.Column>
  </Grid>
);

export default Footercolumn;
