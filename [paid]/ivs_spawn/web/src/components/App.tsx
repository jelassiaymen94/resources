import React, {useState} from 'react';
import './App.css'
import {debugData} from "../utils/debugData";
import {useNuiEvent} from "../hooks/useNuiEvent";
import map from './images/map.png'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faLocationPin } from '@fortawesome/free-solid-svg-icons'
import Tooltip from '@mui/material/Tooltip';
import Button from '@mui/material/Button';
import { useEffect } from 'react';
import { fetchNui } from '../utils/fetchNui';
import { createTheme } from '@mui/material/styles';

// This will set the NUI to visible if we are
// developing in browser

debugData([ { action: 'setVisible', data: { visible: true } } ])

interface LocationsInterfact {
  x: number,
  y: number,
  z: number,
  label: string
}

const darkTheme = createTheme({
  palette: {
    mode: 'dark',
    primary: {
      main: '#0088ff',
    },
  },
  typography: {
    fontFamily: [
      "Roboto",
      "sans-serif"
    ].join(",")
  }
});

const App: React.FC = () => {
  const [show, setShow] = useState(false)
  const [showHidden, setShowHidden] = useState(true)
  const [hidden, setHidden] = useState(true)
  const [visible, setVisible] = useState(false)
  const [chosenData, setChosenData] = useState({
    label: '',
    x: 0,
    y: 0,
    z: 0,
  })
  const [locations, setLocations] = useState<LocationsInterfact[]>([])
  const [showLast , setShowLast] = useState(true)

  useNuiEvent('setVisible', (data) => {
    setShow(data)
  })

  useNuiEvent('setLocations', (data:any) => {
    setLocations(data.locations)
    setShowLast(data.lastLocation)
  })

  const clickPin = (data: any) => {
    console.log(data.x,data.y,data.z)
		setChosenData(data)
    setVisible(true)
	}

  const spawn = () => {
    setVisible(false)
    fetchNui('spawnCharacter', chosenData)
	}

  const cancel = () => {
    setVisible(false)
	}

  const lastLocation = () => {
    setChosenData({label:'Last Location',x:0,y:0,z:0})
    setVisible(true)
	}


  useEffect(() => {
		setTimeout(() => {
      setHidden(false)
		}, 1000);
	}, [hidden])

  useEffect(() => {
		setTimeout(() => {
      setShowHidden(false)
		}, 1000);
	}, [showHidden])


  return (
    <div className={`nui-wrapper ${show}`} style={{ visibility: showHidden ? 'hidden' : 'visible' }}>
      <div className='map-shell'>
        <div className='img-wrapper'>
          <img src={map} className='map'>
          </img>
        </div>
      </div>
      <div className='locations'>
      {locations && locations.map((data: any, key: number) => {
        return <Tooltip key={key} title={data.label} arrow>
          <FontAwesomeIcon className='location-pin' onClick={() => {clickPin(data)}} style={{top: `${data.top}px`, left:`${data.left}px`}} icon={faLocationPin} />
        </Tooltip>
      })}
      </div>
      <div className={`decision-wrapper ${visible}`} style={{ visibility: hidden ? 'hidden' : 'visible' }}>
        <div className='decision-title'>{chosenData.label}</div>
        <div className='decision-desc'>Are you sure you want to spawn here?</div>
        <div className='decision-button-wrapper'>
            <Button className='button' color="success" variant="contained" onClick={spawn}>Spawn</Button>
            <Button className='button' color="error" variant="contained" onClick={cancel}>Cancel</Button>
        </div>
      </div>
      <div className='last-location' style={{display : !showLast ? 'none' : ''}}><Button color="info" style={{width:'200px',height:'60px',fontSize:'18px'}}variant="contained" onClick={lastLocation}>Last Location</Button></div>
      
    </div>
  );
}

export default App;
