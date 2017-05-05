## Apache-Open-Source-Project

### Option to print MR/Tez plan before launching [PIG-5210]
An Improvement for Apache Open Source Software Pig

### Why do we add this patch?
For pig script, users need to use pig -e ```explain -script test.pig```to print out MR/Tez Plan. But for Python script, it is a hard thing for PIG to explain the plan automatically. This option can help to print out MR/Tez plan automatically before implementing MapReduce.

### Steps to creat a Jira issue and upload the patch
- Get clone of 0.17.0 version PIG by git pull 
- Set up Eclipse ```ant build.xml```
- Import Pig src to Eclipse, and set pig.print.exec.plan "true" in file JobControlCompiler.java,TezJobCompiler.java before Mapreduce starts 
```
// Set pig.print.exec.plan "true" in mapReduce engine
if (conf.getBoolean(PigConfiguration.PIG_PRINT_EXEC_PLAN, false)) {  log.info(mro.toString()); }
```
```
// Set pig.print.exec.plan "true" in Tez engine
if (conf.getBoolean(PigConfiguration.PIG_PRINT_EXEC_PLAN, false)) { log.info(tezPlanNode.getTezOperPlan()); }
```
- Check for compiling ```ant```
- Start remote debugger in Eclipse
```
export PIG_OPTS="- agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=8000" 
```
- Or start to run pig only in terminal 
```
unset PIG_OPTS
```
- Test for MR engine `-x local test.pig`; Test for Tez engine `-x tez_local test.pig`
- MapReduce plan printed as expected for MR/Tez engine

![mr](https://github.com/ly16/Apache-Open-Source-Project/blob/master/MR-plan.png)
![tez](https://github.com/ly16/Apache-Open-Source-Project/blob/master/Tez-plan.png)

- Upload Patch to Jira 







