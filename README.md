# GST Search Screens Assignment

- As asked in assignment, first screen enables searches for gstin from an api, 
and second screen shows details fetched using provided gstin.

- To make app functional a mock api is built using Firebase which returns required
information when provided with gstin number.

## Data Generation for mock api

A python script was written to randomly generate information like addresses, organization
name, dates, etc. for a particular gstin number, which itself was also generated randomly by
the that script.

Link to github repository of the Python Script :

> [GST Search Screens Random Data Generator](https://github.com/rishabhy22/Gst_Search_Screens_GstInGenerator)

## Generted GSTIN numbers

This repository, as well as Data Generation repository, both contain a text file named
"[gstINs.txt](https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/gstINs.txt)" which contains valid gstin numbers that were generated by above mentioned [Python Script](https://github.com/rishabhy22/Gst_Search_Screens_GstInGenerator/blob/main/main.py) and were stored in Firebase firestore database along with other information generated to build a mock api. Gstin Numbers other than those will be considered invalid.

## Screenshots

Below are the some screenshots of the assignment in some scenarios :


| Default Home Screen | Second Tab on Home Screen |
|<img src="https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/Screenshots/HomeScreen.png" alt="Default Home Screen" title="Default Home Screen" height="600"/>
| <img src="https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/Screenshots/TabSwitch.png" alt="Second Tab on Home Screen" title="Second Tab on Home Screen" height="600"/>
|
<br/>
|<img src="https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/Screenshots/OnInvalidNumber.png" alt="Invalid Number Entered" title="Invalid Number Entered" height="600"/>
| <img src="https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/Screenshots/OnConnectionError.png" alt="Connection Error Occurs" title="Connection Error Occurs" height="600"/>
|
<br/>
|<img src="https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/Screenshots/Screenshot_1629530323.png" alt="Entering a valid GSTIN number" title="Entering a valid GSTIN number" height="600"/>
| <img src="https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/Screenshots/Loading.png" alt="Loading and fetching information" title="Loading and fetching information" height="600"/>
|
<br/>
|<img src="https://github.com/rishabhy22/Gst_Screens_Assignment/blob/main/Screenshots/GstInformation.png" alt="GST profile displayed if gstin number is valid" title="GST profile displayed if gstin number is valid" height="600"/>
|