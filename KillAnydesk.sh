#!/bin/bash
sleep 20s

echo "Current DateTime: "$(date)
ProcessName="anydesk"
TOTAL_PROCESSES=$(ps -ef | grep $ProcessName | grep -vi grep | wc -l)
echo "Killing \"$ProcessName\" Processes, TOTAL_PROCESSES: " $TOTAL_PROCESSES
echo -e $(ps -ef | grep $ProcessName | grep -vi grep )
while [ 1 ]
do
	TOTAL_PROCESSES=$(ps -ef | grep $ProcessName | grep -vi grep | wc -l)
	if [ $TOTAL_PROCESSES -gt 0 ]
	then
			echo $(ps -ef | grep $ProcessName | grep -vi grep |head -1| awk '{print $2}'|tail)
			PID=$(ps -ef | grep $ProcessName | grep -vi grep |head -1| awk '{print $2}'|tail)
			kill $PID
			if [ $? -eq 0 ]; then
				echo "Process killed"
			else
				echo "failed"
			fi
			sleep 2s
	else 	
		echo "No \"$ProcessName\" processes currently running"
		break
	fi
done