# Searching Receive Logs for specific user or IP address

The script searches all receive logs for specific parameter.

## Getting Started

### Executing program

To get the date, type in powershell:

```
$date = (Get-Date).AddDays(-10) # logs from last 10 days
```

or
```
$date = Get-Date -Day 2 -Month 5 -Year 2022
```

or
```
$date = Get-Date "05/02/2022"
```


To run the program, just run the command in the proper path:

```
.\Get-ReceiveLogsForSpecificUserOrIP.ps1 -IPAddress 80.10.254.11 -Date $date
```

```
.\Get-ReceiveLogsForSpecificUserOrIP.ps1 -AccountName UserAccountName -Date $date
```

## Author

[@MatekStatek](https://twitter.com/matekstatek)

## Version History

* 1.0
    * Initial Release