[top]
components : Seeker
in : inPort1 inPort2
link : inPort1 inputCalor1@Seeker
link : inPort2 inputCalor2@Seeker

[Seeker]
type : cell
dim : (10,10,3)
delay : transport
defaultDelayTime  : 100
border : wrapped
neighbors : Seeker(-1,-1,0) Seeker(-1,0,0) Seeker(-1,1,0)
neighbors : Seeker(0,-1,0)  Seeker(0,0,0)  Seeker(0,1,0)
neighbors : Seeker(1,-1,0)  Seeker(1,0,0) Seeker(1,1,0)

neighbors : Seeker(-1,-1,1) Seeker(-1,0,1) Seeker(-1,1,1)
neighbors : Seeker(0,-1,1)  Seeker(0,0,1)  Seeker(0,1,1)
neighbors : Seeker(1,-1,1)  Seeker(1,0,1) Seeker(1,1,1)

neighbors :                 Seeker(0,0,2)

initialvalue : 0
in : inputCalor1 inputCalor2
link : inputCalor1 in@Seeker(6,2,1)
link : inputCalor2 in@Seeker(2,7,1)

initialCellsValue : Seeker.val
localtransition : calculus
portInTransition : in@Seeker(6,2,1)  setCalor1
portInTransition : in@Seeker(2,7,1)  setCalor2


[calculus]
rule : 2 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=1 and ((0,-1,1) - (0,1,1)) < 0 }
rule : 4 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=1 and ((0,-1,1) - (0,1,1)) > 0 }
rule : 3 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=2 and ((-1,0,1) - (1,0,1)) < 0 }
rule : 1 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=2 and ((-1,0,1) - (1,0,1)) > 0 }
rule : 4 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=3 and ((0,1,1) - (0,-1,1)) < 0 }
rule : 2 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=3 and ((0,1,1) - (0,-1,1)) > 0 }
rule : 1 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=4 and ((1,0,1) - (-1,0,1)) < 0 }
rule : 3 100 { cellpos(2)=0 and (0,0,2)=0 and (0,0,0)=4 and ((1,0,1) - (-1,0,1)) > 0 }

rule : 30 100 { cellpos(2)=0 and (0,0,2)=1 and (-1,0,0)=3 }
rule : 20 100 { cellpos(2)=0 and (0,0,2)=1 and (0,-1,0)=2 }
rule : 40 100 { cellpos(2)=0 and (0,0,2)=1 and (0,1,0)=4 }
rule : 10 100 { cellpos(2)=0 and (0,0,2)=1 and (1,0,0)=1 }

rule : 0 100 { cellpos(2)=0 and (0,0,2)=2 and (0,0,0)<10 }

rule : {(0,0,0)/10} 100 { cellpos(2)=0 and (0,0,2)=3 and (0,0,0)>=10 }

rule : { ((-1,-1,0)+(-1,0,0)+(-1,1,0)+(0,-1,0)+(0,0,0)+(0,1,0)+(1,-1,0)+(1,0,0)+(1,1,0))/9 } 100 {cellpos(2)=1 and (0,0,1)>=4}

rule : {(0,0,0)+1} 100 { cellpos(2)=2 and (0,0,0) < 6 }
rule : 0 100 { cellpos(2)=2 and (0,0,0)>=6 }

rule : { (0,0,0) } 100 { t }

[setCalor1]
rule : { uniform(30,65) } 100 { t }
[setCalor2]
rule : { uniform(65,95) } 100 { t }
