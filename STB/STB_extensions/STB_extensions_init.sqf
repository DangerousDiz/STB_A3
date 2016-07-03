/*
	STB_EnableExtensions is a file that holds Work in Progress or modifications to framework inner functions and global vars.
	Used to allow the base STB framework to not be modified by Dev, but allow for redefines to be implemented or tested.
	Add the following to the description.ext to enable.
	// Params	
		class Params
		{
			class STB_DebugEnabled
			{
				title = "STB Debug Enabled?"; 
				values[] = {0,1}; 
				texts[] = {"False","True"}; 
				default = 0; 
			};
			class STB_EnableExtensions
			{
				title = "STB Extensions Enabled"; 
				values[] = {0,1}; 
				texts[] = {"False","True"}; 
				default = 1; 
			};	
			
		};
	
		Usage and standards:
		Extensions should:-
			With default parameters, still have the same effect as the non extended version. 
			Additions or functionallity changes should extend the default usage not overwrite it.
			New functions should include a header with usage details including params and return value.
			Be defined below in the correct order of the original files, variables before functions that use variables etc..

*/



if(!STB_EnableExtensions) exitWith {systemchat format["[STB_Extensions: EXIT @ %1]: STB_Extensions not Enabled",time];};


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					DDZ Extentions functions (all clients)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
call compile preprocessFileLineNumbers "STB\STB_extensions\DDZ\DDZ_extensions.sqf";
call compile preprocessFileLineNumbers "STB\STB_extensions\DDZ\DDZ_AI_definitions.sqf";





