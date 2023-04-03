import { Button, Stack, TextInput } from '@mantine/core'
import { closeAllModals } from '@mantine/modals'
import { useState } from 'react'
import { fetchNui } from '../../../../../../utils/fetchNui'
import { useLocales } from '../../../../../../providers/LocaleProvider'

const RenameLocation = (props: {defaultName: string}) => {
  const { locale } = useLocales()
  const { defaultName } = props
  const [newName, setNewName] = useState(defaultName)

  return (
    <Stack>
      <TextInput label={locale.ui_location_name} value={newName} onChange={(e) => setNewName(e.target.value)} />
      <Button
        uppercase
        disabled={newName === '' || newName === defaultName}
        variant='light'
        color='blue.4'
        placeholder={defaultName}
        onClick={() => {
          closeAllModals()
          if (newName !== '') {
            fetchNui('flight_admin:changeLocationName', {oldName: defaultName, newName: newName})
          }
        }}
      >
        {locale.ui_confirm}
      </Button>
    </Stack>
  )
}

export default RenameLocation
