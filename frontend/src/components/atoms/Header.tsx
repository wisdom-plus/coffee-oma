import { VFC } from 'react';
import { Header } from 'semantic-ui-react';
import styled from 'styled-components';

const Title = styled.h1`
  min-height: 1em;
  font-size: 5em !important;
`;
type Props = {
  elementtype: string;
  content: string;
  title?: boolean;
};

const H1herader: VFC<Props> = ({ elementtype, content, title = false }) =>
  title ? (
    <Title className="ui header">{content}</Title>
  ) : (
    <Header as={elementtype}>{content}</Header>
  );

export default H1herader;
