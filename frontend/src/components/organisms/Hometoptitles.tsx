import { FC } from 'react';
import Textcontainer from 'components/molecules/Textcontainer';
import styled from 'styled-components';
import backimage from 'images/coffee-back.jpg';

const Backimage = styled.div`
  height: 800px;
  color: black !important;
  background-image: url(${backimage}) !important;
  background-size: cover !important;
`;

const Hometoptitles: FC = () => (
  <Backimage className="ui inverted vertical masthead center aligned segment">
    <Textcontainer />
  </Backimage>
);

export default Hometoptitles;
