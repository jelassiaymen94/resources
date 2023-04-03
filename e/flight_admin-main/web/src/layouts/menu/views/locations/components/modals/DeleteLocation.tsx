import { Button, Group, Stack, Text } from '@mantine/core'
import { closeAllModals } from '@mantine/modals'
import { useSetRecoilState } from 'recoil'
import { locationCustomFilterAtom } from '../../../../../../atoms/location'
import { fetchNui } from '../../../../../../utils/fetchNui'
import { useLocales } from '../../../../../../providers/LocaleProvider'

const DeleteLocation = (props: {name: string}) => {
  const { locale } = useLocales()
  const { name } = props
  const setCustomLocationCheckbox = useSetRecoilState(locationCustomFilterAtom)

  return (
    <Stack>
      <Text>{locale.ui_delete} '{name}' ?</Text>
      <Group grow>
        <Button
          uppercase
          variant='light'
          color='green.4'
          onClick={() => {
            closeAllModals()
            fetchNui('flight_admin:deleteLocation', name)
            setCustomLocationCheckbox(true)
          }}
        >
          {locale.ui_confirm}
        </Button>
        <Button
          uppercase
          variant='light'
          color='red.4'
          onClick={() => {
            closeAllModals()
          }}
        >
          {locale.ui_cancel}
        </Button>
      </Group>
    </Stack>
  )
}

export default DeleteLocation
