From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 54271] readahead() docs incorrectly say it blocks
Date: Tue, 26 Feb 2013 15:57:55 +0000 (UTC)
Message-ID: <20130226155755.5A70411FC6E@bugzilla.kernel.org>
References: <bug-54271-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-54271-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54271





--- Comment #7 from Phillip Susi <psusi-3tLf1voIkJTQT0dZR+AlfA@public.gmane.org>  2013-02-26 15:57:55 ---
dd if=/dev/zero of=foo bs=1MiB count=512
echo 1 > /proc/sys/vm_drop_caches
time readahead foo && iostat -d 2

real    0m0.212s
user    0m0.000s
sys     0m0.164s


Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda              13.07       348.27       564.72   24916849   40401892
sdb              12.34       342.80       564.88   24525467   40413276
sdc              12.64       353.08       558.45   25260487   39953612
sdd              12.70       344.31       561.36   24633134   40162088
md0             128.52       690.00      1518.61   49365215  108647060
dm-0              4.09        68.50        14.09    4900585    1008368
dm-1              1.13       529.16        10.01   37857989     716364
dm-2              0.00         0.01         0.00        748          0
dm-3            104.29        16.60      1494.47    1187561  106920224

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda              83.50     42244.00         0.50      84488          1
sdb              73.50     37122.00         0.50      74244          1
sdc              76.50     38658.00         0.50      77316          1
sdd              80.00     40450.00         0.50      80900          1
md0               1.00         2.00         2.00          4          4
dm-0              1.00         2.00         2.00          4          4
dm-1              0.00         0.00         0.00          0          0
dm-2              0.00         0.00         0.00          0          0
dm-3              0.00         0.00         0.00          0          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda              33.00     16384.00         2.50      32768          5
sdb              40.00     20224.00         0.50      40448          1
sdc              37.00     18688.00         0.50      37376          1
sdd              32.00     15872.00         2.50      31744          5
md0               0.00         0.00         0.00          0          0
dm-0              0.00         0.00         0.00          0          0
dm-1              0.00         0.00         0.00          0          0
dm-2              0.00         0.00         0.00          0          0
dm-3              0.00         0.00         0.00          0          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               1.50         0.00         1.00          0          2
sdb               2.50         0.00        19.00          0         38
sdc               1.50         0.00         1.00          0          2
sdd               2.50         0.00        19.00          0         38
md0               5.00         0.00        18.00          0         36
dm-0              4.50         0.00        18.00          0         36
dm-1              0.00         0.00         0.00          0          0
dm-2              0.00         0.00         0.00          0          0
dm-3              0.00         0.00         0.00          0          0


When I was seeing the blocking, I observed the following stat output from a
stat command on the file in a debugfs session:

EXTENTS:
(ETB0):33795, (0-30975):370688-401663, (30976-40191):401664-410879,
(ETB0):483328, (40192-72575):410880-443263,
(72576-81919):443264-452607, (ETB0):483329, (81920-111578):452608-482266

As you can see, the file has 3 level zero extent tree blocks.  That last extent
of blocks (452608-482266) can't be queued for reading until the ETB at 483329
has been read, and so the readahead blocks until all of the blocks before have
been read, because they are ahead of the ETB in the queue, then once it has the
ETB, it queues the last extent and returns.

The freshly created file with dd has no extent tree blocks to read, so no
blocking happens.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
