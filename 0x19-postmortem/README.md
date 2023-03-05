# Postmortem Report
<img src=./image1.jpg width=75%>
## Issue Summary:
On March 1, 2023, from 2:00 PM to 4:30 PM EAT, the company's online shopping website experiences an outage, rendering the website inaccessible to all users. The impact of the outage was significant, with 100% of the users unable to access the website during the outage.

## Timeline:
2:00 PM: The issue was first detected when the monitoring system sent an alert to the engineering team.
2:05 PM: Engineers started investigating the issue and assumed it was due to network failure
2:15 PM: The network team was notified and they started investigating it as well
2:30 PM: The network tem ruled out any network issues and informed the engineering team the problem might be related to the web server
2:45 PM: The engineering team started investigating the webserver and realized the server was overloaded with requests.
3:15 PM: The team increased the server capacity, but didn't resolve the issue.
3:30 PM: The team realized that the databasse was the bottleneck and started investigating the database server.
4:00 PM: The database server was restarted, which fixed the issue.
4:30 PM: The website was restored to normal operation

## Root Cause and resolution:
The root cause of the issue was an overload database server, causing it to fail. The increased traffic on the website was not anticipated, and the database server was not adequatelt provisioned to handle the increased load. The issue was resolved by restarting the database server, which cleared the overloaded connections and allowed the website to funciton correctly.

## Corrective and Preventative measures:
To prevent similar issues in the future, the following measures should be taken-
Review and update the website's capacity planning and provisioning process to ensure it can handle increased traffic loads.
Implement better monitoring systems to detect performance issues before the escalate to an outage
Conduct regular load testing to identify and address bottlenecks before they become a problem.
Implement database clustering to distribute traffic across multiple servers to reduce the likelihood of single point of failure, to prevent exactly what happened now.
Conduct a post-incident review to identify areaf for improvement and make changes accordingly.
### List of tasks to address the issue (TODO)
- Conduct capacity planning and provision review.
- Implement better monitoring systems.
- Conduct regular load testing
- Implement database clustering
- Conduct post-incident review

<img src=./image2.webp width=75%>
Good luck writing a postmortem for it