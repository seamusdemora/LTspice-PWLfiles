#dupl_count ... count of duplicate lines


BEGIN { OFS = FS = "," 
        dupl_cnt = 0 }

{
    for (i = 1; i <= NF; i++) {
       if ( i % 2 == 0 ) {
         value1 = $i
       }
       else {
         time1 = $i
       }
    }
    row = NR
    if ( value1 != value2 ) {
      if (row != 1 ) {
         if ( value1 != value3 && time1 > time3 && dupl_cnt > 0) {
           #print dupl_cnt
           print time3,value3
           print time1,value1
           dupl_cnt = 0
         }
         else if ( value1 == value3 ) {
           dupl_cnt = 0
           #print dupl_cnt
           print time1,value1
         }
           else {
             dupl_cnt = 0
             #print dupl_cnt
             print time1,value1
             value3 = value1
             time3 = time1
          }
      }
      value2 = value1
      time2 = time1
    }
    else {
      dupl_cnt++
      value3 = value1
      time3 = time1
    }
}

