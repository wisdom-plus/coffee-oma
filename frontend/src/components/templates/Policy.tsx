import { FC } from 'react';
import Header from 'components/atoms/Header';
import { Grid } from 'semantic-ui-react';
import Privatepolicycontent from 'components/atoms/Privatepolicycontent';
import Policycontent from 'components/atoms/Policycontent';

type Props = {
  isprivate?: boolean;
};
const Prolicy: FC<Props> = ({ isprivate = false }) => (
  <Grid centered padded>
    <Grid.Column width={11} style={{ margin: '2em 0' }}>
      {isprivate ? (
        <>
          <Header elementtype="h1" content="利用規約" textalign="center" />
          <Policycontent />
        </>
      ) : (
        <>
          <Header
            elementtype="h1"
            content="プライバシーポリシー"
            textalign="center"
          />
          <Privatepolicycontent />
        </>
      )}
    </Grid.Column>
  </Grid>
);

export default Prolicy;
