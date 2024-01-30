import { Button, Stack } from '../../../../../../components';
import {
  CheckboxInput,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureDropdownInput,
  FeatureNumberInput,
  FeatureNumeric,
  FeatureToggle,
  FeatureValueProps,
} from '../../base';

const FeatureBlooperDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData>,
) => {
  return (
    <Stack>
      <Stack.Item grow>
        <FeatureDropdownInput {...props} />
      </Stack.Item>
      <Stack.Item>
        <Button
          onClick={() => {
            props.act('play_blooper');
          }}
          icon="play"
          width="100%"
          height="100%"
        />
      </Stack.Item>
    </Stack>
  );
};

export const blooper_speech: FeatureChoiced = {
  name: 'Character Voice',
  component: FeatureBlooperDropdownInput,
};

export const blooper_speech_speed: FeatureNumeric = {
  name: 'Character Voice Speed',
  description:
    '[2 - 16] Lower number, faster speed. Higher number, slower voice.',
  component: FeatureNumberInput,
};

export const blooper_speech_pitch: FeatureNumeric = {
  name: 'Character Voice Pitch',
  description:
    '[0.4 - 2] Lower number, deeper pitch. Higher number, higher pitch.',
  component: FeatureNumberInput,
};

export const blooper_pitch_range: FeatureNumeric = {
  name: 'Character Voice Range',
  description:
    '[0.1 - 0.8] Lower number, less range. Higher number, more range.',
  component: FeatureNumberInput,
};

export const hear_sound_blooper: FeatureToggle = {
  name: 'Enable vocal bloopers',
  category: 'SOUND',
  component: CheckboxInput,
};
