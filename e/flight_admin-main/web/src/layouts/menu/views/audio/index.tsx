import { ActionIcon, Button, Checkbox, Divider, Group, NumberInput, Paper, Select, Slider, Space, Text } from '@mantine/core'
import { useDebouncedValue } from '@mantine/hooks'
import { useEffect, useState } from 'react'
import { BsClipboard, BsFillStopFill, BsPlayFill } from 'react-icons/bs'
import { useRecoilState } from 'recoil'
import { drawStaticEmittersAtom, radioStationsListAtom, StaticEmitter, staticEmittersDrawDistanceAtom, staticEmittersListAtom } from '../../../../atoms/audio'
import { useNuiEvent } from '../../../../hooks/useNuiEvent'
import { useLocales } from "../../../../providers/LocaleProvider"
import { fetchNui } from '../../../../utils/fetchNui'
import { setClipboard } from '../../../../utils/setClipboard'

const Audio: React.FC = () => {
    const { locale } = useLocales()
    const [checked, setChecked] = useRecoilState(drawStaticEmittersAtom)
    const [drawDistance, setDrawDistance] = useRecoilState(staticEmittersDrawDistanceAtom)
    const [closestEmitter, setClosestEmitter] = useRecoilState(staticEmittersListAtom)
    const [radioStation, setRadioStation] = useState<string>("Unknown")
    const [radioStationsList, setRadioStationsList] = useRecoilState(radioStationsListAtom)
    const [debouncedDistance] = useDebouncedValue(drawDistance, 200)
    
    useNuiEvent('setClosestEmitter', (data: StaticEmitter) => {
        setClosestEmitter(data)
        setRadioStation(data.radiostation)
    })
    
    useNuiEvent('setRadioStationsList', (data: Array<{ label: string, value: string }>) => {
        setRadioStationsList(data)
    })

    useEffect(() => {
       fetchNui('flight_admin:setStaticEmitterDrawDistance', debouncedDistance)
    }, [debouncedDistance])

    useEffect(() => {
       fetchNui('flight_admin:setDrawStaticEmitters', checked)
    }, [checked])

    return (
        <>
            <Text size={20}>{locale.ui_audio}</Text>

            <Space h='sm' />

            <Paper p='md'>
                <Text size={22}>{locale.ui_static_emitters}</Text>
                
                <Space h='md' />
                
                <Checkbox
                    label={locale.ui_draw_static_emitters}
                    checked={checked}
                    onChange={(e) => setChecked(e.currentTarget.checked)}
                />
                
                <Space h='sm' />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_draw_distance}</Text>
                    <NumberInput
                        disabled={!checked}
                        defaultValue={drawDistance}
                        value={drawDistance}
                        min={1}
                        max={100}
                        size='sm'
                        style={{ maxWidth: '110px' }}
                        onChange={(value) => setDrawDistance(value!)}
                        formatter={(value) =>
                            !Number.isNaN(parseFloat(value!))
                            ? `${value} ${locale.ui_meters}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')
                            : ` ${locale.ui_meters}`
                        }
                    />
                </Group>
                <Space h='xs' />
                <Slider
                    disabled={!checked}
                    value={drawDistance}
                    label={(value) => `${value} ${locale.ui_meters}`}
                    onChange={(value) => setDrawDistance(value)}
                    min={1}
                    max={100}
                    marks={[
                        { value: 20 },
                        { value: 40 },
                        { value: 60 },
                        { value: 80 }
                    ]}
                />
                
                <Space h='sm' />
            </Paper>

            <Space h='sm' />
                
            <Paper p='md'>
                <Group position='apart'>
                    <Text size={22}>{locale.ui_closest_emitter_info}</Text>
                    <Button
                        color='blue.4'
                        variant='light'
                        onClick={() => fetchNui('flight_admin:getClosestStaticEmitter')}
                    >
                        {locale.ui_refresh}
                    </Button>
                </Group>

                <Space h='md' />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_name}</Text>
                    <Group>
                        <Text color='blue.4' size={14}>{closestEmitter.name}</Text>
                        <ActionIcon
                            onClick={() => setClipboard(closestEmitter.name)}
                        ><BsClipboard /></ActionIcon>
                    </Group>
                </Group>

                <Divider my={5} />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_coords}</Text>
                    <Group>
                        <Text color='blue.4' size={14}>{closestEmitter.coords}</Text>
                        <ActionIcon
                            onClick={() => setClipboard(closestEmitter.coords)}
                        ><BsClipboard /></ActionIcon>
                    </Group>
                </Group>

                <Divider my={5} />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_distance}</Text>
                    <Group>
                        <Text color='blue.4' size={14}>{closestEmitter.distance} {locale.ui_meters}</Text>
                        <ActionIcon
                            onClick={() => setClipboard(closestEmitter.distance.toString())}
                        ><BsClipboard /></ActionIcon>
                    </Group>
                </Group>

                <Divider my={5} />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_flags}</Text>
                    <Group>
                        <Text color='blue.4' size={14}>{closestEmitter.flags}</Text>
                        <ActionIcon
                            onClick={() => setClipboard(closestEmitter.flags)}
                        ><BsClipboard /></ActionIcon>
                    </Group>
                </Group>

                <Divider my={5} />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_interior}</Text>
                    <Group>
                        <Text color='blue.4' size={14}>{closestEmitter.interior}</Text>
                        <ActionIcon
                            onClick={() => setClipboard(closestEmitter.interior)}
                        ><BsClipboard /></ActionIcon>
                    </Group>
                </Group>

                <Divider my={5} />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_room}</Text>
                    <Group>
                        <Text color='blue.4' size={14}>{closestEmitter.room}</Text>
                        <ActionIcon
                            onClick={() => setClipboard(closestEmitter.room)}
                        ><BsClipboard /></ActionIcon>
                    </Group>
                </Group>

                <Divider my={5} />

                <Group position='apart'>
                    <Text size={14}>{locale.ui_radio_station}</Text>
                    <Group>
                        <Select
                            color='blue.4'
                            searchable
                            nothingFound={locale.ui_no_timecycle_found}
                            data={radioStationsList}
                            value={radioStation}
                            onChange={(value) => {
                                setRadioStation(value!)
                                fetchNui('flight_admin:setStaticEmitterRadio', { emitterName: closestEmitter.name, radioStation: value })
                            }}
                            style={{ minWidth: '300px' }}
                        />
                        <ActionIcon
                            onClick={() => setClipboard(closestEmitter.radiostation)}
                        ><BsClipboard /></ActionIcon>
                    </Group>
                </Group>

                <Space h='md' />

                <Group grow>
                    <Button
                        color='teal.4'
                        variant='light'
                        onClick={() => fetchNui('flight_admin:toggleStaticEmitter', { emitterName: closestEmitter.name, state: true})}
                    >
                        <BsPlayFill />
                    </Button>
                    <Button
                        color='red.4'
                        variant='light'
                        onClick={() => fetchNui('flight_admin:toggleStaticEmitter', { emitterName: closestEmitter.name, state: false})}
                    >
                        <BsFillStopFill />
                    </Button>
                </Group>

            </Paper>
        </>
    )
}

export default Audio