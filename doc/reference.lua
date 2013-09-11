idpAddFile = {
title = "idpAddFile, idpAddFileSize",
proto = [[
procedure <b>idpAddFile</b>(url, filename: String);
procedure <b>idpAddFileSize</b>(url, filename: String; size: Int64{note-1});
]],
desc = [[Adds file to download queue.]],
params = {
	url      = "Url to file on server.",
	filename = "File name on the local disk.",
	size     = "Size of file."
},
example = [[
procedure <b>InitializeWizard</b>();
begin
  idpAddFile('http://www.example.com/file1.dll', ExpandConstant('{tmp}\file1.dll'));
  idpAddFile('http://login:password@www.example.com/file2.dll', ExpandConstant('{tmp}\file2.dll'));

  idpDownloadAfter(wpReady);
end;
]],
notes = { "<tt>size</tt> parameter is <tt>Dword</tt> for ANSI Inno Setup" },
seealso = { "idpClearFiles", "idpDownloadAfter", "idpDownloadFiles" }
}

idpAddFileSize = idpAddFile

idpClearFiles = {
proto   = [[procedure <b>idpClearFiles</b>;]],
desc    = [[Clear all files, previously added with idpAddFile() procedure]],
seealso = { "idpAddFile" }
}

idpFilesCount = {
proto   = [[function <b>idpFilesCount</b>: Integer;]],
desc    = [[Returns number of files, previously added with idpAddFile() procedure.]],
returns = [[File count]],
seealso = { "idpAddFile", "idpClearFiles" }
}

idpFilesDownloaded = {
proto =   [[function <b>idpFilesDownloaded</b>: Boolean;]],
desc  =   [[If <tt>AllowContinue</tt> option was set to <tt>1</tt>, this function can be used to check
            that all files was successfully downloaded. If at least one file wasn't downloaded, 
			this function returns <tt>False</tt>]],
returns = [[<tt>True</tt> if all files was successfully downloaded, <tt>False</tt> otherwise]],
example = [[
procedure <b>CurStepChanged</b>(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then 
    if idpFilesDownloaded then
	begin
	  // Copy downloaded files to application directory
      Filecopy(ExpandConstant('{tmp}\file1.dll'), ExpandConstant('{app}\file1.dll'), false);
      Filecopy(ExpandConstant('{tmp}\file2.dll'), ExpandConstant('{app}\file2.dll'), false);
    end;
end;
]]
}

idpDownloadFile = {
}

idpDownloadFiles = {
}

idpDownloadAfter = {
}

idpGetFileSize = {
proto  = [[function <b>idpGetFileSize</b>(url: String; var size: Int64{note-1}): Boolean;]],
desc   = [[Get file size]],
params = {
	url = "File url",
	size = "The variable to store the size into"
},
returns = "<tt>True</tt> if operation was successfull, <tt>False</tt> otherwise",
notes = { "<tt>size</tt> parameter is <tt>Dword</tt> for ANSI Inno Setup" },
seealso = { "idpGetFilesSize" },
example = [[
var size: Int64;
...
if idpGetFileSize('http://www.example.com/file.zip', size) then
  // Do something with file size...
]]
}

idpGetFilesSize = {
}

idpSetOption = {
}