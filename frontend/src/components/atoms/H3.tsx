import { VFC } from 'react';

type Props = {
  title: string;
};
const H3: VFC<Props> = ({ title }) => <h3>{title}</h3>;

export default H3;
