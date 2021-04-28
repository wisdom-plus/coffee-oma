import { VFC } from 'react';
import styled from 'styled-components';

const Title = styled.h1`
  min-height: 1em;
  font-size: 5em !important;
`;
type Props = {
  title?: boolean;
  content: string;
};

const H1herader: VFC<Props> = ({ title = false, content }) =>
  title ? (
    <Title className="ui header">{content}</Title>
  ) : (
    <h1 className="ui header">{content}</h1>
  );

export default H1herader;
