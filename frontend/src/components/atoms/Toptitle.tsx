import { FC } from 'react';
import styled from 'styled-components';

const Title = styled.h1`
  min-height: 1em;
  font-size: 5em !important;
`;

const Toptitle: FC = () => <Title className="ui header">coffee-oma</Title>;

export default Toptitle;
