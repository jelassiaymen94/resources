RegisterCommand("startclipping", function(source, args, rawCommand)
  startclipping()
end, false)


function startclipping()
  CreateThread(function()
	  while(true) do
		  Wait(10)
		  if(IsRecording()) then
			  if(IsControlJustPressed(1,170)) then
				  StopRecordingAndSaveClip()
			  end
			
			  if(IsControlJustPressed(1,289)) then
				  StopRecordingAndDiscardClip()
			  end
		  else
		
			  if(IsControlJustPressed(1,288)) then
				  StartRecording(1)
			  end
		  end
		
		  if(IsControlJustPressed(1,57)) then
			  NetworkSessionLeaveSinglePlayer()
			  ActivateRockstarEditor()
		  end
	  end
  end)
end