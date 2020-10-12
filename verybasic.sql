/*#------------------------------------------------------------------------------
# Description:  This program opens a database file, reads through the database one 
#               record at a time, and prints the count and average of source addresses 
#               and ports respectively.			
#
# Parameters:  NONE
#
# History: 
# Date           Author          Description
# 2018-07-27  Aditya Patel     Initial creation
#------------------------------------------------------------------------------*/

/*selects the source column and counts the number of ports and prints it right next to it at the end of the list*/
SELECT source as "Sources", group_concat(port) as Ports, count(port) as "Number of ports" FROM probes GROUP BY source

/*allows us to run multiple select statements as it moves to a new line but stays in the table*/
UNION ALL 

/*counting distinct source addresses fo that they dont get repeated*/
SELECT "Source count", "", count (distinct source) FROM probes 
UNION all

/*Calculating the average number of ports per source ip address */
select "Avg. ports per source","",ROUND(AVG (port),2) from
	(select COUNT(*) AS port from probes group by source
	)
