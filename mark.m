function v=mark(random_number,value,bit_index)

if(mod(random_number,2)==0)
   v = bitset(value,bit_index,0);
else
    v = bitset(value,bit_index,1);
end