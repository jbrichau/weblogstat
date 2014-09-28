private
printStatistics

Transcript show: 'gem: '; show: (Logs sum: [ :l1 | (l1 attributeAt: #time) ]) / Logs size; show: ' s/r '; cr.
Transcript show: '0 -1s: '; show: (Logs select: [ :l | (l attributeAt: #time) <= 1 ]) size - (Logs select: [ :l | (l attributeAt: #time) < 0 ]) size; show: ' reqs '; cr.
Transcript show: '1 -3s: '; show: (Logs select: [ :l | (l attributeAt: #time) <= 3 ]) size - (Logs select: [ :l | (l attributeAt: #time) < 1 ]) size; show: ' reqs '; cr.
Transcript show: '3 - 5s: '; show: (Logs select: [ :l | (l attributeAt: #time) <= 5 ]) size - (Logs select: [ :l | (l attributeAt: #time) < 3 ]) size; show: ' reqs '; cr.
Transcript show: '5 - 10s: '; show: (Logs select: [ :l | (l attributeAt: #time) <= 10 ]) size - (Logs select: [ :l | (l attributeAt: #time) < 5 ]) size; show: ' reqs '; cr.
Transcript show: '>10s  : '; show: (Logs select: [ :l | (l attributeAt: #time) >=10 ]) size; show: 'reqs '; cr.
Transcript show: '>60s  : '; show: (Logs select: [ :l | (l attributeAt: #time) >=60 ]) size; show: 'reqs '; cr.