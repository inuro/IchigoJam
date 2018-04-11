'1行に収まるとき
%d O=#C04:FORI=0TO%d:POKE#%03x+I,(PEEK(O+I*2)-64)<<4+PEEK(O+1+I*2)-64:NEXT' % (line_no, total_bytes, poke_address_base)),

'複数行に渡るとき
%d O=#C04:D=0:FORJ=0TO%d:N=PEEK(O-2):FORI=0TON/2-2:POKE#%03x+D,(PEEK(O+i*2)-64)<<4+PEEK(O+1+i*2)-64:D=D+1:NEXT:O=O+N+4:NEXT' % (line_no, line_count, poke_address_base)),
%d O=#C04:D=0:FORJ=0TO%d:N=PEEK(O-2):FORI=0TON/2-2:POKE#%03x+D,(PEEK(O+i*2)-64)<<4+PEEK(O+1+i*2)-64:D=D+1:NEXT:O=O+N+4:NEXT' % (line_no, line_count, poke_address_base)),
%d O=#C04:D=0:FORJ=0TO%d:N=PEEK(O-2):FORI=0TON/2-2:POKE#%03x+D,(PEEK(O+i*2)-64)<<4+PEEK(O+1+i*2)-64:D=D+1:NEXT:O=O+N+4:NEXT' % (line_no, line_count, poke_address_base)),
