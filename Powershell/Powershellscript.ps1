##LAB 1
Function helloworld
{
echo "Hello World"
echo ""
}

##LAB 2
function Get-Hardware
{
	#  2.Hardware description
	$computersystem = Get-WmiObject -Class Win32_ComputerSystem
	$manufacturer = $computersystem.Manufacturer
	$model  = $computersystem.Model
    $SN = (Get-WmiObject -Class Win32_BIOS).SerialNumber
	"  2.System Hardware Information"
    "computersystem: $computersystem"
	"manufacturer: $manufacturer"
	"model: $model"
	"serialnumber: $SN"
echo ""
}

##LAB 3
function network
{
 echo "3.Network details"
 
Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "IPEnabled = 'True'" | Where-Object { $_.DNSDomain -ne $null -or $_.DNSHostName -ne $null -or $_.DNSServerSearchOrder -ne $null } |Format-Table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSHostName, DNSServerSearchOrder -AutoSize
 echo ""
}

##LAB 4
function video

{
  echo "4.Video card details"

 Get-CimInstance Win32_VideoController | Format-Table Description, AdapterCompatibility, CurrentHorizontalResolution, CurrentVerticalResolution -AutoSize

}

function OS{

$os = Get-WmiObject -Class Win32_OperatingSystem
$name = $os.Caption
$version = $os.Version
 echo "Operating System info"
"name: $name"
"version: $version"
}

function RAM
{

$memory = Get-WmiObject -Class Win32_PhysicalMemory
$table = $memory | Select-Object Manufacturer, PartNumber, Capacity, MemoryType, BankLabel, DeviceLocator
$MaxRAM = ($memory.Capacity | Measure-Object -Sum).Sum / 1GB
Echo ""
Echo "RAM details:" 
$table | Format-Table -AutoSize
Write-Host "Total RAM: $MaxRam GB"
}
function system
{
   os
   RAM
   video
 }


function systemreport 

		 {
		
            helloworld
            Get-Hardware
            network
            video
            os
            RAM
		}



systemreport
