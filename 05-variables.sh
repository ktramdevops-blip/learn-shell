
#!/bin/bash

start_time=$(date +%s)
echo "Script start time: $start_time"

sleep 10

end_time=$(date +%s)
echo "Script end time: $end_time"

total_time=$(($end_time - $start_time))
echo "Total time taken for script execution: $total_time seconds"
