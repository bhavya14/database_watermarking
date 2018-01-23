%Set preferences with setdbprefs.
setdbprefs('DataReturnFormat', 'numeric');
setdbprefs('NullNumberRead', '0');
setdbprefs('NullStringRead', 'null');


%Make connection to database.  Note that the password has been omitted.
%Using JDBC driver.
conn = database('mydb1', 'root', 'twinkle09111993', 'Vendor', 'MYSQL', 'Server', 'localhost', 'PortNumber', 3306);



%colnames={'sno','integer_value_1','integer_value_2','integer_value_3','integer_value_4'};
%exdata={8,212,343,454,565};
%datainsert(conn,'project',colnames,exdata);

key=101;
gamma=2;
available_bits=4;

%Read data from database.
curs = exec(conn, ['SELECT 	project.sno'...
    ' ,	project.integer_value_1'...
    ' ,	project.integer_value_2'...
    ' ,	project.integer_value_3'...
    ' ,	project.integer_value_4'...
    ' FROM 	mydb1.project ']);

curs = fetch(curs);
close(curs);


totalcount=0;
%Assign data to output variable
object = curs.Data;
n=size(object,1);
 for c=1:n
     rng(object(c,1)+key)
     G=randi(n,4);
     if(mod(G(1,1),gamma)==0)
        i=mod(G(1,2),4);%no.of columns available for marking=4
        j=mod(G(1,3),available_bits);
        totalcount=totalcount+1;
        matchcount=matchcount+match(G(1,4),object(c,i+1),j);
     end
 end
 

colnames={'sno','integer_value_1','integer_value_2','integer_value_3','integer_value_4'};


%for c=1:n
 %   exdata={object(c,1),object(c,2),object(c,3),object(c,4),object(c,5)};
  %  datainsert(conn,'project',colnames,exdata);
%end

%curs=exec(conn,'select*from project');
%curs=fetch(curs);

 
         
         

%Close database connection.
close(conn);

%Clear variables
clear curs conn