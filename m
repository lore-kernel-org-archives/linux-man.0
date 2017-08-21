From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [PATCH] fd.4: ffix: tables: Move units from numbers to the header
Date: Mon, 21 Aug 2017 14:07:28 +0000
Message-ID: <20170821140728.GA20011@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

fd.4: ffix: tables: Move a unit (K) from each number to the header and
change the unit to "KiB".

.N.B. An italic correction is missing in the first column.  A later patch
should fix that using a macro ".BI" if possible.

Signed-off-by: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
---
 man4/fd.4 | 71 ++++++++++++++++++++++++++++++++++-----------------------------
 1 file changed, 38 insertions(+), 33 deletions(-)

diff --git a/man4/fd.4 b/man4/fd.4
index fa874782f..6de17e4d4 100644
--- a/man4/fd.4
+++ b/man4/fd.4
@@ -66,68 +66,73 @@ _
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBd360\fP	360K	40	9	2	4
+\fBfd\fP\fIn\fP\fBd360\fP	360	40	9	2	4
 .TE
 .PP
 5.25 inch high-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBh360\fP	360K	40	9	2	20
-\fBfd\fP\fIn\fP\fBh410\fP	410K	41	10	2	48
-\fBfd\fP\fIn\fP\fBh420\fP	420K	42	10	2	64
-\fBfd\fP\fIn\fP\fBh720\fP	720K	80	9	2	24
-\fBfd\fP\fIn\fP\fBh880\fP	880K	80	11	2	80
-\fBfd\fP\fIn\fP\fBh1200\fP	1200K	80	15	2	8
-\fBfd\fP\fIn\fP\fBh1440\fP	1440K	80	18	2	40
-\fBfd\fP\fIn\fP\fBh1476\fP	1476K	82	18	2	56
-\fBfd\fP\fIn\fP\fBh1494\fP	1494K	83	18	2	72
-\fBfd\fP\fIn\fP\fBh1600\fP	1600K	80	20	2	92
+\fBfd\fP\fIn\fP\fBh360\fP	360	40	9	2	20
+\fBfd\fP\fIn\fP\fBh410\fP	410	41	10	2	48
+\fBfd\fP\fIn\fP\fBh420\fP	420	42	10	2	64
+\fBfd\fP\fIn\fP\fBh720\fP	720	80	9	2	24
+\fBfd\fP\fIn\fP\fBh880\fP	880	80	11	2	80
+\fBfd\fP\fIn\fP\fBh1200\fP	1200	80	15	2	8
+\fBfd\fP\fIn\fP\fBh1440\fP	1440	80	18	2	40
+\fBfd\fP\fIn\fP\fBh1476\fP	1476	82	18	2	56
+\fBfd\fP\fIn\fP\fBh1494\fP	1494	83	18	2	72
+\fBfd\fP\fIn\fP\fBh1600\fP	1600	80	20	2	92
 .TE
 .PP
 3.5 inch double-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBu360\fP	360K	80	9	1	12
-\fBfd\fP\fIn\fP\fBu720\fP	720K	80	9	2	16
-\fBfd\fP\fIn\fP\fBu800\fP	800K	80	10	2	120
-\fBfd\fP\fIn\fP\fBu1040\fP	1040K	80	13	2	84
-\fBfd\fP\fIn\fP\fBu1120\fP	1120K	80	14	2	88
+\fBfd\fP\fIn\fP\fBu360\fP	360	80	9	1	12
+\fBfd\fP\fIn\fP\fBu720\fP	720	80	9	2	16
+\fBfd\fP\fIn\fP\fBu800\fP	800	80	10	2	120
+\fBfd\fP\fIn\fP\fBu1040\fP	1040	80	13	2	84
+\fBfd\fP\fIn\fP\fBu1120\fP	1120	80	14	2	88
 .TE
 .PP
 3.5 inch high-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBu360\fP	360K	40	9	2	12
-\fBfd\fP\fIn\fP\fBu720\fP	720K	80	9	2	16
-\fBfd\fP\fIn\fP\fBu820\fP	820K	82	10	2	52
-\fBfd\fP\fIn\fP\fBu830\fP	830K	83	10	2	68
-\fBfd\fP\fIn\fP\fBu1440\fP	1440K	80	18	2	28
-\fBfd\fP\fIn\fP\fBu1600\fP	1600K	80	20	2	124
-\fBfd\fP\fIn\fP\fBu1680\fP	1680K	80	21	2	44
-\fBfd\fP\fIn\fP\fBu1722\fP	1722K	82	21	2	60
-\fBfd\fP\fIn\fP\fBu1743\fP	1743K	83	21	2	76
-\fBfd\fP\fIn\fP\fBu1760\fP	1760K	80	22	2	96
-\fBfd\fP\fIn\fP\fBu1840\fP	1840K	80	23	2	116
-\fBfd\fP\fIn\fP\fBu1920\fP	1920K	80	24	2	100
+\fBfd\fP\fIn\fP\fBu360\fP	360	40	9	2	12
+\fBfd\fP\fIn\fP\fBu720\fP	720	80	9	2	16
+\fBfd\fP\fIn\fP\fBu820\fP	820	82	10	2	52
+\fBfd\fP\fIn\fP\fBu830\fP	830	83	10	2	68
+\fBfd\fP\fIn\fP\fBu1440\fP	1440	80	18	2	28
+\fBfd\fP\fIn\fP\fBu1600\fP	1600	80	20	2	124
+\fBfd\fP\fIn\fP\fBu1680\fP	1680	80	21	2	44
+\fBfd\fP\fIn\fP\fBu1722\fP	1722	82	21	2	60
+\fBfd\fP\fIn\fP\fBu1743\fP	1743	83	21	2	76
+\fBfd\fP\fIn\fP\fBu1760\fP	1760	80	22	2	96
+\fBfd\fP\fIn\fP\fBu1840\fP	1840	80	23	2	116
+\fBfd\fP\fIn\fP\fBu1920\fP	1920	80	24	2	100
 .TE
 .PP
 3.5 inch extra-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBu2880\fP	2880K	80	36	2	32
-\fBfd\fP\fIn\fP\fBCompaQ\fP	2880K	80	36	2	36
-\fBfd\fP\fIn\fP\fBu3200\fP	3200K	80	40	2	104
-\fBfd\fP\fIn\fP\fBu3520\fP	3520K	80	44	2	108
-\fBfd\fP\fIn\fP\fBu3840\fP	3840K	80	48	2	112
+\fBfd\fP\fIn\fP\fBu2880\fP	2880	80	36	2	32
+\fBfd\fP\fIn\fP\fBCompaQ\fP	2880	80	36	2	36
+\fBfd\fP\fIn\fP\fBu3200\fP	3200	80	40	2	104
+\fBfd\fP\fIn\fP\fBu3520\fP	3520	80	44	2	108
+\fBfd\fP\fIn\fP\fBu3840\fP	3840	80	48	2	112
 .TE
 .SH DESCRIPTION
 \fBfd\fP special files access the floppy disk drives in raw mode.
-- 
2.14.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
