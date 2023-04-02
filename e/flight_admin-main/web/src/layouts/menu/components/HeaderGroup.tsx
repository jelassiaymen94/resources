import { ActionIcon, Group, Header, Text, Title, Tooltip } from '@mantine/core'
import { useRecoilState } from 'recoil'
import { TbLogout } from 'react-icons/tb'
import { GiCancel } from 'react-icons/gi'
import { menuVisibilityAtom } from '../../../atoms/visibility'
import { Version } from '../../../atoms/version'
import { useNuiEvent } from '../../../hooks/useNuiEvent'
import { fetchNui } from '../../../utils/fetchNui'
import { useLocales } from '../../../providers/LocaleProvider'
import { useExitListener } from '../../../hooks/useExitListener'
import { useEffect, useState } from 'react'

const HeaderGroup: React.FC<{data: Version}> = ({ data }) => {
  const { locale } = useLocales()
  const [visible, setVisible] = useRecoilState(menuVisibilityAtom)

  useNuiEvent('setMenuVisible', () => setVisible(true))
  useExitListener(setVisible)

  const [opened, setOpened] = useState(false)

  useEffect(() => {
    setTimeout(() => {
      setOpened(true)
    }, 2000)
  }, [visible])

  return (
    <Header sx={{ height: '50px', borderTopLeftRadius: '10px', borderTopRightRadius: '10px' }} height={50}>
      <Group px={20} position='apart'>
        <Group>
          <Title order={3}>Flight Admin</Title>
          <Text
            size={14}
            weight={600}
            color={data.url ? 'orange.4' : 'blue.4'}
            style={{ position: 'absolute', top: '18px', left: '159px' }}
          >{data.currentVersion}</Text>
        </Group>
        <Group>
          <Tooltip label={locale.ui_exit} position='bottom' transition='scale-y'>
            <ActionIcon
              color='red.4'
              style={{ margin: '5px', width: '40px', height: '40px' }}
              onClick={() => {
                setVisible(false)
                fetchNui('flight_admin:exit')}
              }
            >
              <GiCancel fontSize={24} />
            </ActionIcon>
          </Tooltip>
        </Group>
      </Group>
    </Header>
  )
}

export default HeaderGroup
