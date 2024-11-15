## EE577b Project Phase 3 
Instruction Files:
`imem_core{x}.fill`

Steps:
* `load`: Load data from `dmem` to `regfile`
* `load`: Load status buffer in `NIC` to `RegFile`
* `BEZ`/`BNEZ`: check if NIC buffer is empty, if not, repeat previous load
* `store`: Store data into `NIC` (to other nodes)

Data Files:
`dmem_core{x}.fill`

