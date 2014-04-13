function m = decodeState(state, base = 12)
  m=zeros(3, 3);
  tempState = uint64(0);
  elem0 = uint64(0);
  tempState=state;
  for i = (1:numel(m))
    pow=9-i;
    elem=uint64((tempState-0.5*(base**pow))/(base**pow));
    if(elem>0)
      m(i)=2**elem;
    endif
    tempState=tempState-elem*(base**pow);
  endfor
endfunction
