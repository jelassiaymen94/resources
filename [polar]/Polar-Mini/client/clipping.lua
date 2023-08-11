RegisterCommand("startclipping", function(source, args, rawCommand)
	clipping = true
  startclipping()
end, false)
RegisterCommand("stopclipping", function(source, args, rawCommand)
	clipping = false
  end, false)

local clipping = true

function startclipping()
	while clipping do
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
end

RegisterCommand("record", function(source, args, rawCommand)
	StartRecording(1)
end, false)
RegisterCommand("save", function(source, args, rawCommand)
	StopRecordingAndSaveClip()
end, false)
RegisterCommand("editor", function(source, args, rawCommand)
	ActivateRockstarEditor()
end, false)