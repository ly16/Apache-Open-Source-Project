set pig.print.exec.plan true
rmf output

a = load 'studenttab10k' as (name:chararray, age:int, gpa:double);
store a into 'output';
