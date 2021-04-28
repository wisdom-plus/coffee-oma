import { FC } from 'react';
import { Header, Icon } from 'semantic-ui-react';

type Props = {
  icontype: 'coffee' | 'search' | 'comment alternate';
  content: string;
  subheader?: string;
};

const Iconheader: FC<Props> = ({ icontype, content, subheader }) => (
  <Header as="h2" icon>
    <Icon name={icontype} />
    {content}
    <Header.Subheader>{subheader}</Header.Subheader>
  </Header>
);

export default Iconheader;
