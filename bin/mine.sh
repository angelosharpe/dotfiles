#!/bin/sh

export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_FORCE_64BIT_PTR=0

#optirun /home/tom/Downloads/ethereum/ethdcrminer64 -epool eu1-etc.ethermine.org:4444 -ewal 0xa9904091d2b29dbcb97e459874514aeed49d336b.rig01 -epsw x

#optirun taskset 1 ethminer -v 9 -G -S eu1.ethpool.org:3333 -O 0xa9904091d2b29dbcb97e459874514aeed49d336b.worker01

#port 20555 = etc, 20535 = eth, 17020 = auto-switch ethash
taskset 1 ./ethminer --farm-recheck 5000 --cl-global-work 16384 -S europe1.ethereum.miningpoolhub.com:17020 -FS us-east1.ethereum.miningpoolhub.com:17020 -O tomasmarek.worker:x


# f2pool uses stratum protocol 1 (dwarf/eth-proxy)
#optirun taskset 1 ethminer --farm-recheck 5000 -G --cl-global-work 16384 -SP 1 -S eth.f2pool.com:8008 -O 0xa9904091d2b29dbcb97e459874514aeed49d336b.genoil

