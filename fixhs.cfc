<cfcomponent>
	 <cffunction name="init">
		<cfset this.version = "1.0.0">
		<cfreturn this>
	</cffunction>
	
<cffunction name="$hashStruct" returntype="string" access="public" output="false">
    <cfargument name="args" type="struct" required="true">
    <cfreturn Hash(structToList(arguments.args))>
</cffunction>

<cffunction name="structToList" returntype="string" access="public" output="false">
<cfargument name="s" type="struct" required="true">
<cfscript>
/**
* Converts struct into delimited key/value list.
*
* @param s      Structure. (Required)
* @param delim      List delimeter. Defaults to a comma. (Optional)
* @return Returns a string.
* @author Greg Nettles (gregnettles@calvarychapel.com)
* @version 2, July 25, 2006
*/
    var delim = "&";
    var i = 0;
    var newArray = structKeyArray(arguments.s);

    if (arrayLen(arguments) gt 1) delim = arguments[2];

    for(i=1;i lte structCount(arguments.s);i=i+1) newArray[i] = newArray[i] & "=" & arguments.s[newArray[i]];

    return arraytoList(newArray,delim);
</cfscript>
</cffunction>
</cfcomponent>