CreateThread(function()
  SwitchTrainTrack(0, true)
  SwitchTrainTrack(3, true)
  SetTrainTrackSpawnFrequency(0, 2 * 60 * 1000) -- 2 minutes in milliseconds
  SetRandomTrains(1)
  SetTrainsForceDoorsOpen(false)
end)