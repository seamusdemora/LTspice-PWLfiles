BEGIN { OFS = FS = "," }

{
    for (i = 1; i <= NF; i++) sum[i] += $i
    count++
}

count % 3 == 0 {
    for (i = 1; i <= NF; i++) $i = sum[i] / count
    delete sum
    count = 0
    if ($NF >= 1.1 * last || $NF <= 0.9 * last) {
        print
        last = $NF
    }
}


END {
    if (count > 0) {
        for (i = 1; i <= NF; i++) $i = sum[i] / count
        if ($NF >= 1.1 * last || $NF <= 0.9 * last) print
    }
}
