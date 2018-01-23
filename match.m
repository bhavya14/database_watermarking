function v=match(random_number,value,bit_index)

if(mod(random_number,2)==0)
   if(bitget(value,bit_index)==0)
       v=1;
   else
       v=0;
   end
else
   if(bitget(value,bit_index)==1)
       v=1;
   else
       v=0;
   end
end