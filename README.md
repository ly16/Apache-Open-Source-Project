## Apache-Open-Source-Project

### Option to print MR/Tez plan before launching [PIG-5210]
An Improvement for Apache Open Source Software Pig

### Why do we add this patch?
For pig script, users need to use pig -e ```explain -script test.pig```to print out MR/Tez Plan. But for Python script, it is a hard thing for PIG to explain the plan automatically. This option can help to print out MR/Tez plan automatically before implementing MapReduce.

### Steps to creat a Jira issue and upload the patch
- Get clone of 0.17.0 version PIG by git pull 



