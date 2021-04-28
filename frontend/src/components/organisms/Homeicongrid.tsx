import { FC } from 'react';
import Icongridtextcontainer from 'components/molecules/Icongridtextcontainer';
import Threefivecolumn from 'components/molecules/Threefivecolumn';
import styled from 'styled-components';

const Icongrid = styled.div`
  margin: 3rem 0 !important;
`;

const Homeicongrid: FC = () => (
  <Icongrid className="ui vertical stripe center aligned segment grid">
    <Icongridtextcontainer />
    <Threefivecolumn />
  </Icongrid>
);

export default Homeicongrid;
