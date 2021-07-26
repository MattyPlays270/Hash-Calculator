Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$selectForm = New-Object System.Windows.Forms.Form
$selectForm.ClientSize = '300,100'
$selectForm.text = "Hash Calculator"
$selectForm.MaximizeBox = $false
$selectForm.FormBorderStyle = 'FixedDialog'

$Selectfilebutton = New-Object System.Windows.Forms.Button
$Selectfilebutton.Location = New-Object System.Drawing.Size(50,50)
$Selectfilebutton.Size = New-Object System.Drawing.Size(200,40)
$Selectfilebutton.Text = "Select a file"
$Selectfilebutton.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,[System.Drawing.FontStyle]::Regular)
$Selectfilebutton.Add_Click({$selectForm.close()})

$selectForm.Controls.Add($Selectfilebutton)

$titlelbl = New-Object System.Windows.Forms.Label
$titlelbl.Location = New-Object System.Drawing.Size(45,00)
$titlelbl.Size = New-Object System.Drawing.Size(280,40)
$titlelbl.Text = "Hash Calculator"
$titlelbl.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",20,[System.Drawing.FontStyle]::Regular)

$selectForm.Controls.Add($titlelbl)

$selectForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;
$selectForm.ShowDialog() | Out-Null

Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
InitialDirectory = [Environment]::GetFolderPath('Desktop');
}
$null = $FileBrowser.ShowDialog()
$file = $FileBrowser.FileName
if (!$file) { 
[System.Windows.Forms.MessageBox]::Show('You need to select a file!', 'Error', 'OK', [System.Windows.Forms.MessageBoxIcon]::Error) | Out-Null
exit
 }
$size = ((Get-Item $file).length)
$sizekb = $size / 1024
$sizemb = $sizekb / 1024
$websiteclick = {Start-Process 'https://github.com/MattyPlays270/Hash-Calculator'}
$button_click = {[System.Windows.Forms.MessageBox]::Show('Created by MattyPlays270', 'Credits', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information)}
$md5 = Get-FileHash $file -Algorithm MD5
$sha256 = Get-FileHash $file -Algorithm SHA256
$sha384 = Get-FileHash $file -Algorithm SHA384
$sha512 = Get-FileHash $file -Algorithm SHA512
$sha1 = Get-FileHash $file -Algorithm SHA1
$ripemd160 = Get-FileHash $file -Algorithm RIPEMD160
$mactripledes = Get-FileHash $file -Algorithm MACTripleDES

$md5out = $md5.Hash.ToLower()
$sha256out = $sha256.Hash.ToLower()
$sha384out = $sha384.Hash.ToLower()
$sha512out = $sha512.Hash.ToLower()
$sha1out = $sha1.Hash.ToLower()
$ripemd160out = $ripemd160.Hash.ToLower()
$mactripledesout = $mactripledes.Hash.ToLower()

$mainForm = New-Object System.Windows.Forms.Form
$mainForm.ClientSize = '500,370'
$mainForm.MaximizeBox = $false
$mainForm.text = "Hash Calculator"
$mainForm.FormBorderStyle = 'FixedDialog'

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(410,340)
$Button.Size = New-Object System.Drawing.Size(80,30)
$Button.Text = "Credits"
$Button.Add_Click($Button_Click)

$mainForm.Controls.Add($Button)

$webButton = New-Object System.Windows.Forms.Button
$webButton.Location = New-Object System.Drawing.Size(330,340)
$webButton.Size = New-Object System.Drawing.Size(80,30)
$webButton.Text = "Website"
$webButton.Add_Click($websiteclick)

$mainForm.Controls.Add($webButton)

$titletext = New-Object System.Windows.Forms.Label
$titletext.Location = New-Object System.Drawing.Size(1,1)
$titletext.Size = New-Object System.Drawing.Size(200,20)
$titletext.Text = 'File Path:'; $mainForm.Controls.Add($titletext)

$filebox = New-Object System.Windows.Forms.Label 
$filebox.Location = New-Object System.Drawing.Size(1,20) 
$filebox.Size = New-Object System.Drawing.Size(715,20) 
$filebox.Text = $file
$mainForm.Controls.Add($filebox)

$sizetext = New-Object System.Windows.Forms.Label
$sizetext.Location = New-Object System.Drawing.Size(1,40)
$sizetext.Size = New-Object System.Drawing.Size(200,20)
$sizetext.Text = 'File Dimensions (In MB):'
$mainForm.Controls.Add($sizetext)

$sizelbl = New-Object System.Windows.Forms.Label
$sizelbl.Location = New-Object System.Drawing.Size(1,60)
$sizelbl.Size = New-Object System.Drawing.Size(715,20)
$sizelbl.Text = $sizemb
$mainForm.Controls.Add($sizelbl)

$md5text = New-Object System.Windows.Forms.Label
$md5text.Location = New-Object System.Drawing.Size(1,80)
$md5text.Size = New-Object System.Drawing.Size(715,20)
$md5text.Text = 'MD5:'
$mainForm.Controls.Add($md5text)

$md5box = New-Object System.Windows.Forms.TextBox 
$md5box.ReadOnly = $true
$md5box.Add_Click( { $this.SelectAll(); $this.Focus() })
$md5box.Location = New-Object System.Drawing.Size(1,100) 
$md5box.Size = New-Object System.Drawing.Size(200,20) 
$md5box.Text = $md5out
$mainForm.Controls.Add($md5box)

$sha256text = New-Object System.Windows.Forms.Label
$sha256text.Location = New-Object System.Drawing.Size(1,125)
$sha256text.Size = New-Object System.Drawing.Size(715,20)
$sha256text.Text = 'SHA-256:'
$mainForm.Controls.Add($sha256text)

$sha256box = New-Object System.Windows.Forms.TextBox 
$sha256box.ReadOnly = $true
$sha256box.Add_Click( { $this.SelectAll(); $this.Focus() })
$sha256box.Location = New-Object System.Drawing.Size(1,145) 
$sha256box.Size = New-Object System.Drawing.Size(200,20) 
$sha256box.Text = $sha256out
$mainForm.Controls.Add($sha256box)

$sha384text = New-Object System.Windows.Forms.Label
$sha384text.Location = New-Object System.Drawing.Size(1,165)
$sha384text.Size = New-Object System.Drawing.Size(715,20)
$sha384text.Text = 'SHA-384:'
$mainForm.Controls.Add($sha384text)

$sha384box = New-Object System.Windows.Forms.TextBox 
$sha384box.ReadOnly = $true
$sha384box.Add_Click( { $this.SelectAll(); $this.Focus() })
$sha384box.Location = New-Object System.Drawing.Size(1,185) 
$sha384box.Size = New-Object System.Drawing.Size(200,20) 
$sha384box.Text = $sha384out
$mainForm.Controls.Add($sha384box)

$sha512text = New-Object System.Windows.Forms.Label
$sha512text.Location = New-Object System.Drawing.Size(1,205)
$sha512text.Size = New-Object System.Drawing.Size(715,20)
$sha512text.Text = 'SHA-512:'
$mainForm.Controls.Add($sha512text)

$sha512box = New-Object System.Windows.Forms.TextBox
$sha512box.ReadOnly = $true
$sha512box.Add_Click( { $this.SelectAll(); $this.Focus() })
$sha512box.Location = New-Object System.Drawing.Size(1,225) 
$sha512box.Size = New-Object System.Drawing.Size(200,20) 
$sha512box.Text = $sha512out
$mainForm.Controls.Add($sha512box)

$sha1text = New-Object System.Windows.Forms.Label
$sha1text.Location = New-Object System.Drawing.Size(1,245)
$sha1text.Size = New-Object System.Drawing.Size(715,20)
$sha1text.Text = 'SHA-1:'
$mainForm.Controls.Add($sha1text)

$sha1box = New-Object System.Windows.Forms.TextBox 
$sha1box.ReadOnly = $true
$sha1box.Add_Click( { $this.SelectAll(); $this.Focus() })
$sha1box.Location = New-Object System.Drawing.Size(1,265) 
$sha1box.Size = New-Object System.Drawing.Size(200,20) 
$sha1box.Text = $sha1out
$mainForm.Controls.Add($sha1box)

$ripemd160text = New-Object System.Windows.Forms.Label
$ripemd160text.Location = New-Object System.Drawing.Size(1,285)
$ripemd160text.Size = New-Object System.Drawing.Size(715,20)
$ripemd160text.Text = 'RIPEMD160:'
$mainForm.Controls.Add($ripemd160text)

$ripemd160box = New-Object System.Windows.Forms.TextBox 
$ripemd160box.ReadOnly = $true
$ripemd160box.Add_Click( { $this.SelectAll(); $this.Focus() })
$ripemd160box.Location = New-Object System.Drawing.Size(1,305) 
$ripemd160box.Size = New-Object System.Drawing.Size(200,20) 
$ripemd160box.Text = $ripemd160out
$mainForm.Controls.Add($ripemd160box)

$mactripledestext = New-Object System.Windows.Forms.Label
$mactripledestext.Location = New-Object System.Drawing.Size(1,325)
$mactripledestext.Size = New-Object System.Drawing.Size(715,20)
$mactripledestext.Text = 'MACTripleDES:'
$mainForm.Controls.Add($mactripledestext)

$mactripledesbox = New-Object System.Windows.Forms.TextBox 
$mactripledesbox.ReadOnly = $true
$mactripledesbox.Add_Click( { $this.SelectAll(); $this.Focus() })
$mactripledesbox.Location = New-Object System.Drawing.Size(1,345) 
$mactripledesbox.Size = New-Object System.Drawing.Size(200,20) 
$mactripledesbox.Text = $mactripledesout
$mainForm.Controls.Add($mactripledesbox)

$mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;
$mainForm.ShowDialog() | Out-Null