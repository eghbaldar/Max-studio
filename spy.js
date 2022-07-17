function Check()
{
  // Call the static page method.
  PageMethods.GetLatestHeadlineTick(OnSucceeded, OnFailed);
}

function OnSucceeded(result, userContext, methodName)
{
  // Parse the web method's result and the embedded
  //  hidden value to integers for comparison.
  var LatestTick = parseInt(result);
  var LatestDisplayTick = parseInt($get('LatestDisplayTick').value); 

  // If the web method's return value is larger than 
  //  the embedded latest display tick, refresh the panel.
  if (LatestTick > LatestDisplayTick)
    __doPostBack('up1', '');
  // Else, check again in five seconds.
  else
    setTimeout("Check()", 2000);
}

// Stub to make the page method call happy.
function OnFailed(error, userContext, methodName) {}

function pageLoad()
{
  // On initial load and partial postbacks, 
  //  check for newer articles in five seconds.
  setTimeout("Check()", 5000);
}