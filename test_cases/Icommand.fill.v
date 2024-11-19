NOP                                
load datamem[0] into R10    		
load datamem[1] into R20    		
load datamem[2] into R30    		
load NIC[3] into R1  				
VBNEZ r1, 4                        
store r10 into NIC[2]			
load NIC[3] into r1  				
VBNEZ r1, 7                        
store r20 into NIC[2]			
load NIC[3] into r1  				
VBNEZ R1, 10                       
store R30 into NIC[2]				
load NIC[1] into R2					
VBEZ R2, 13                        
store NIC[0] into R5	           
load NIC[1] into R2					
VBEZ R2, 16
store NIC[0] into R15	           
load NIC[1] into R2					
VBEZ R2, 19
store NIC[0] into R25
VSD R5, 5                          
VSD R15, 6                         
VSD R25, 7                         
load datamem[3] into R10    		
load datamem[4] into R20    		
load datamem[5] into R30    		
load datamem[6] into R40    		
load NIC[3] into R1  				
VBNEZ r1, 29                       
store r10 into NIC[2]			
load NIC[3] into r1  				
VBNEZ r1, 32                       
store r20 into NIC[2]			
load NIC[3] into r1  				
VBNEZ R1, 35                       
store R30 into NIC[2]				
load NIC[3] into r1  				
VBNEZ R1, 38                       
store R40 into NIC[2]				
load NIC[1] into R2					
VBEZ R2, 41                        
store NIC[0] into R5	           
load NIC[1] into R2					
VBEZ R2, 44
store NIC[0] into R15	           
load NIC[1] into R2					
VBEZ R2, 47
store NIC[0] into R25
load NIC[1] into R2					
VBEZ R2, 50
store NIC[0] into R32
VSD R5, 8                          
VSD R15, 9                         
VSD R25, 10                        
VSD R32, 11                        
load datamem[6] into R10    		
load datamem[7] into R20    		
load datamem[8] into R30    		
load datamem[9] into R40    		
load NIC[3] into R1  				
VBNEZ r1, 61                       
store r10 into NIC[2]			
load NIC[3] into r1  				
VBNEZ r1, 64                       
store r20 into NIC[2]			
load NIC[3] into r1  				
VBNEZ R1, 67                       
store R30 into NIC[2]				
load NIC[3] into r1  				
VBNEZ R1, 70                       
store R40 into NIC[2]				
load NIC[1] into R2					
VBEZ R2, 73                        
store NIC[0] into R5	           
load NIC[1] into R2					
VBEZ R2, 76
store NIC[0] into R15	           
load NIC[1] into R2					
VBEZ R2, 79
store NIC[0] into R25
load NIC[1] into R2					
VBEZ R2, 82
store NIC[0] into R32
VSD R5, 12                         
VSD R15, 13                        
VSD R25, 14                        
VSD R32, 15                        
load datamem[6] into R10    		
load datamem[7] into R20    		
load datamem[8] into R30    		
load datamem[9] into R40    		
load NIC[3] into R1  				
VBNEZ r1, 93                       
store r10 into NIC[2]			
load NIC[3] into r1  				
VBNEZ r1, 96                       
store r20 into NIC[2]			
load NIC[3] into r1  				
VBNEZ R1, 99                       
store R30 into NIC[2]				
load NIC[3] into r1  				
VBNEZ R1, 102                      
store R40 into NIC[2]				
load NIC[1] into R2					
VBEZ R2, 105                       
store NIC[0] into R5	           
load NIC[1] into R2					
VBEZ R2, 108
store NIC[0] into R15	           
load NIC[1] into R2					
VBEZ R2, 111
store NIC[0] into R25
load NIC[1] into R2					
VBEZ R2, 114
store NIC[0] into R32
VSD R5, 16                            
VSD R15, 17                           
VSD R25, 18                           
VSD R32, 19                           
NOP 