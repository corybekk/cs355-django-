#! /bin/bash

echo 'Creating DB schema starts'
mysql --password='da6976' --user=dahlgren  < mlbDBSchema.sql
echo 'Creating DB schema ends'

for dataFile in  prospect.sql stadium.sql pro_team.sql farm_team.sql pro_player.sql free_agent.sql d_stats.sql p_stats.sql o_stats.sql disabled_list.sql suspended_list.sql; do
    echo "Poplulating table $(echo $dataFile | sed 's/\.sql//')."
    mysql --password='da6976' --user=dahlgren  < $dataFile
    echo "Poplulating table $(echo $dataFile | sed 's/\.sql//') completed."
done

