import { FC } from 'react';
import Header from 'components/atoms/Header';
import styled from 'styled-components';

const Rankinggrid = styled.div`
  margin: 3rem 0 !important;
`;

const Homeranking: FC = () => (
  <Rankinggrid className="ui vertical stripe center aligned segment grid">
    <Header elementtype="h2" content="お気に入りアイテムランキング" />
  </Rankinggrid>
);

export default Homeranking;
