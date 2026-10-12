Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013077.outbound.protection.outlook.com [52.103.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC04EC655
	for <linux-man@vger.kernel.org>; Mon, 12 Oct 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839327; cv=fail; b=hmpbn8ZvqzNd9ZWddfrQ1bbn2BlTAPm/levgQO5TMeY2eCCLjwuK8lpC5AoW6E8VTMxAGZc3+OCBd0iitR7JOdt7HTJc7HFi0jweCcz+d+64hWrd0eb1JtpQTXGFpTpKaXnUg2HA6KMAPF/eFgUZdpHsLrUUdbv8PI3p8k9zUF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839327; c=relaxed/simple;
	bh=FgiapGthE2rh57axW3r/3whIpheXUKkl3W1HBK4nSho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6Ea1vpooXpEyQR7MxHHd6k/e/lBqAZkW9CkBITFAoQ76L4X7axFsyNcPTBBHYCh1hCmBigyFuOuaFGSR7U1SNkNzvtXW651Tshr+NVE2/IceKIuzpbOldvh2EQiR9280hu75oCJu3ca8kqHo/V2qjmspiBsDDSyHy7slI+ADvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=Xq/FDIQf; arc=fail smtp.client-ip=52.103.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="Xq/FDIQf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtDflK1bO31tnxoY5wcV+BlyyFAurKsSxIOHSnIcQ4n3hKgMlTcwnPorz+Pnw6nB1E2Gv66WUm1enZblBodzbTFDmhmoXlxZkcI0IKO8tYb4A68kNvBZ/A4f4U989VITGVchnHOFN8vKcYcjzgNx1XvfkUna0NoyE5rgeNSTbnFQfZLsre+OY6cOXeoSlVr/dx82kK59hXtIxQZKdWytkaz3XFZ73Blpd51GoYyKPuYK4K/dY/njGAwXzZS8nXtOg7miE9ZwRQhqZg40V+g77nG1uVaQmmW6PEO8LCWDwMBrBehSR7QXAwdJTsBCgZJuTqFo28ZFyBTxAqxmYUwUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jssx9pZGW8V0ZJlxycKNcYtvZmiGY9jlJ/1Yh3/82oM=;
 b=VdzDL4NP1etGFFEPvfCcXowVBAI0s9vC7SnRJMeGs9srKxkuQf62B92hvRHY945gjYq2sKbaDBoImiUFY/EbFkoJARfTKWywU3hFsb9yiugSIwR0LHcUHuKAudVJgC8goitU5mFcrxZ0+7YwezBsqgGy3KbM74CgCTyonT/qlk6KR54GMKUbTHbM2RMdcuryUi/dUYKX6sgJ1FauvnyAuItKAvKNd7/twtL48u+7Dyu8vqoaG9eAQiQKAudr5+gCgVEgAOCPzlg4LnLf3+amoo2HrQB9F4cVq1o0CHLD+dk/ZyD2Os+X4X43lgFZYuhuCP6h7nmEDmEtuB93T/mbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jssx9pZGW8V0ZJlxycKNcYtvZmiGY9jlJ/1Yh3/82oM=;
 b=Xq/FDIQf5GA2HhxSPeVh7KHC8IhofzerqBuTG+L0srs1Godz6/pPhWT72BfdWZUhdCwf14iIY/AfVaAKkyQ78SKLdnCddkVyM2py42xeVr+UOqQO9T+o6eeBYqeyq3Ygu4+xmHhmiakje6t+yDoX4d9jpBfBOrv5hNWEp56PiOvD4JCo8+RHCOh9Y61NVC/BDvJ1eNal6BQ83yV7JcHEmGo3cGkjIQDeIYkD80b7e7dXdr3IvveD4zodR4HkhhVOaTWuvRXSotosIB58AD9YbN6nuoZPKQjWbZq7qA0zj8K+mMQuGRK5YrZ/lqP2lf2jKckz7D8Q1U6a8iF+TjVuHQ==
Received: from AS2PR02MB9737.eurprd02.prod.outlook.com (2603:10a6:20b:60f::14)
 by DU0PR02MB9799.eurprd02.prod.outlook.com (2603:10a6:10:44c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 21:08:39 +0000
Received: from AS2PR02MB9737.eurprd02.prod.outlook.com
 ([fe80::be12:e30c:d91a:f161]) by AS2PR02MB9737.eurprd02.prod.outlook.com
 ([fe80::be12:e30c:d91a:f161%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 21:08:39 +0000
From: Yannick Le Pennec <yannick.lepennec@live.fr>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Yannick Le Pennec <yannick.lepennec@live.fr>
Subject: [PATCH v1 2/3] man/man2const/F_CREATED_QUERY.2const: Add page
Date: Mon, 12 Oct 2026 23:08:15 +0200
Message-ID:
 <AS2PR02MB9737E9F57A2777FDD7A2D1E49B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0288.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::14) To AS2PR02MB9737.eurprd02.prod.outlook.com
 (2603:10a6:20b:60f::14)
X-Microsoft-Original-Message-ID:
 <20261012210816.2575185-3-yannick.lepennec@live.fr>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB9737:EE_|DU0PR02MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cf2249-8c92-487b-81aa-08df28a4fcfb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|15080799012|23021999003|41001999006|260925184616899003|25010399006|5072599009|51005399006|55001999006|24021099003|2607281247196008|440099028|3412199025|4302099013|10035399007|40105399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d/rXYBAYgZ2/IvVMoweo0oY4LyphMq6T4kKdhpysjip5BuSv/lIaZfvPpPpd?=
 =?us-ascii?Q?h7/spiPpftcRrvUanyCnu2npyna05Sw2rWqywuOc97u4tP6S5pdsMRlsp7WP?=
 =?us-ascii?Q?joSWcmMFERfToNiztVpIk4bjF1MLBWkPFRWh32VONT/zuTKlb30ZcEAcxOR7?=
 =?us-ascii?Q?86L4AyQBGfOccFuXymTTYQh0uNKh6zxyNnmubmOC8uxbsjL/3gL3QEOX2KTR?=
 =?us-ascii?Q?fOQpxgyTQccL4+18+LKO/KlHDfFCx320BOGludHofs32b7kyhksefVjwPXLX?=
 =?us-ascii?Q?VHlau+3xB/pqQYrb9AbWgjLvbbcbUoZHTssGBw+X2UD+bTeVXdR9/U8N4xlF?=
 =?us-ascii?Q?EZY+GqGhMzherUFkfO0K8c2bR3aNc0kkuhjwbBvtEe/264jji1EVojuEbTqx?=
 =?us-ascii?Q?rOllSjhjJ0j4iKgcODz/UWzyRyK0ElPNBPFHOizvk52p/Toswofxftf9gW7d?=
 =?us-ascii?Q?33TP/yryWfED181ywc8w+It+obIK5S+/RekVxTLKkYCtgVVLnHIynERGgiVq?=
 =?us-ascii?Q?DHBd+EpbXIDDQb8n0aUbSdBRu9mQC7iyznT30nCvYhCYKxYmWz4m6OthE+rQ?=
 =?us-ascii?Q?aaRRxtBBzIhf6rxXp5QKlx6Co0CYoVuVm07bgqYlgrtBICwTcYkqJnQ7KrHL?=
 =?us-ascii?Q?TW94y9lu8XQDkOe05u5Ke9rSkHvkoCMJmieuUrzNPEOxIpOxPNCbpW2b/Cn6?=
 =?us-ascii?Q?INLKxBl72j/P5S109j3c1HFhrxqAwSo9w454CXHluXLSna/O/jH7QiqhXtP0?=
 =?us-ascii?Q?Z+K7vnHEGyrQZyUfUu/GsmiI8kDjlmI/Jp0YN7gOB1v4radl2UBG4Asif8K6?=
 =?us-ascii?Q?hprK9wD8YgEG85RDF8CV7rkSOX0jv7q6TZgwRScTJajeO3yLt4Mb4ftPR8Pr?=
 =?us-ascii?Q?D7cF96OMZUNVLPTACaRNzKyIt+ndZAwHFRQRg4oi8Wh1EXVo+ARPY8I0CQgt?=
 =?us-ascii?Q?hQPMYlypP3tn6Y1uuiXOLrNCcz9Wi0IPNG336XL2ZgHEVPc2vU+5r8rESv92?=
 =?us-ascii?Q?K8X1aPJ0/U6jPnG9+oZUttaPaLu4aWQYMgyr1xCHdy2qs5XTOxi/Chale9mn?=
 =?us-ascii?Q?IkxnjgHB?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tfy9cPJoCweS6h/3NyDeFi/UC/6NI4U3ePJBIbX00vdFbm89gugQAJEM4Jcl?=
 =?us-ascii?Q?bBfy5QAzQKUus73w7aSPR8qrhzU2tx27C2+Xrg866T6v7lC7MljhZyrj/+1Z?=
 =?us-ascii?Q?JHt/Ncn9p4YUjUBzii+0OLw79CI5jTWmtZEAUrJcI+jrK9ZDBqsS+qDwNbxq?=
 =?us-ascii?Q?V49VFBl43iAEZdgpAuQGM3HZLraaHZn+yx6w0mQSrVAUJ4yIKnN8Qnu+OZP7?=
 =?us-ascii?Q?Amwe4Rs/zgFb2y1tyIv+TPAtqkjXkGoDpJxh+hJRF453bvj/e6bsS02glSPF?=
 =?us-ascii?Q?56mtfoS4dU02g/gDPOpnKXK4WotcXIPOpBDnA92qjg3/IT9d9TEMpvLlS0/H?=
 =?us-ascii?Q?D4AxIT3YESWP0U2nfc8NhjRJg7lM53UiuvTRj/4JR3NPVwr6uDTtWTBQFH7a?=
 =?us-ascii?Q?WcuKHRCLdx0MFo+yXf4me3hTs9MKAvhp8amdd4wJ5df5KcwpxyMfEQ1Hhzjj?=
 =?us-ascii?Q?WpYC5YkE3UH5wdyf+mWMZpDwW40mSddF/kEpKKw5bT9CARSCoDtWUXeRPsJR?=
 =?us-ascii?Q?Ggsc+/E3aYq9sgLs1dH3C8W0wP31q4AEc7r4DNBOZbyxPsCIjiRKqthL7hfv?=
 =?us-ascii?Q?rLUY9Ep/nau0lHiRes4wC2fjAwVR0OgglBDZweiFxZ4bH+OvPCrDUGbBFjWZ?=
 =?us-ascii?Q?DSya2Ox3zSwocQSyAsuDzfc35X+Rw+5svM1M1SK/qcudYlJIOM2VpROZLH9C?=
 =?us-ascii?Q?CTD7I0oSq/IswVDXkrRpZtXiFl4+XdDZxQCpnHLevgcjDySXq2BFzO7JxzdT?=
 =?us-ascii?Q?np3xh0exDZcsL7kDa0SrtvD0Pfv0iUSIXfX8jerM+7JhLw8nOU7f3RkNNjlv?=
 =?us-ascii?Q?MxIaWsG7ejUHQccSKn9hOoM9yXxCqZf8O7JVmuz7UJdlBcId2ku6DbfnZGDX?=
 =?us-ascii?Q?ptzTbUXKHfhd982pZXp9WrNdvE8ieRZOG1/r+HDqz9elybu1b+5IeNjLs+RP?=
 =?us-ascii?Q?HPjVbL/mcEx10i0vy7Uik7bfkt7GxmXl064dQxhrxkWm5FvOEmdl1kr3xmW3?=
 =?us-ascii?Q?c/Kb52TEXZQb28M37V3ooQDx0O8gqOfxEKgPxgZF6m2Wrja8rySkDfOkTDlG?=
 =?us-ascii?Q?Dg1tGCJ47se9GYmjfdViC6Lbf/O7++EN88TDdly0aY10SrkwywoZQUrcVtXR?=
 =?us-ascii?Q?GK4R+LU5x8qByRuQshDC5WLzDLii3paDLzT3zTZxFekFq6ZrOVSEMDaWBHOc?=
 =?us-ascii?Q?ZK9G+ZiQfPS9N8QJT8yb6ZoTuZjc3AcbI0KtQD67e2+O1O4A5KNrTr4j6hha?=
 =?us-ascii?Q?l0UJj95sgphWgFYpRIHBJlg2afVsl0KuOZ5rNJbUvQzWeSU9zhnJmUj4KC6G?=
 =?us-ascii?Q?TOJJhd3HTh0woi4aZGWNL6LQECTcGFcF74IGrSRxp6WGoMV1ShYIX6pM/3Or?=
 =?us-ascii?Q?Mif4q/ycPDSt04Twm+dyRBBIE06xQafxPI6kfkgmwE8oWonzWWX8gsBF5QkF?=
 =?us-ascii?Q?lJoye1GhLdf7SRXCPi+rAMHWUeDS0tj7u7Ntv7zcVc7i4mmebK0VbA=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-9f624.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cf2249-8c92-487b-81aa-08df28a4fcfb
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB9737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 21:08:39.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9799

Linux 6.12 adds a new fcntl(2) operation, F_CREATED_QUERY, which glibc exposes
since 2.41. This commit documents it, with example usage.

When a file is open(2)ed with the O_CREAT flag, it is potentially created (if it
does not already exist), in which case the open file description has the flag
FMODE_CREATED set. The F_CREATED_QUERY operation gives userspace a way of
retrieving the value of that flag to determine whether the open call resulted or
not in the file being created.

Previously you had to jump through a variety of questionable hoops to achieve
something similar (see the kernel.org discussion in the link below).

See-also: linux.git 820a185896b7 ("fcntl: add F_CREATED_QUERY")
See-also: glibc.git 322e9d4e4430 ("Add F_CREATED_QUERY from Linux 6.12 to
                                   bits/fcntl-linux.h")
Link: <https://lore.kernel.org/all/20240724-work-fcntl-v1-1-e8153a2f1991@kernel.org/>
Link: <https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=322e9d4e443084336ea41a8e7bf72456ab273b73>
Signed-off-by: Yannick Le Pennec <yannick.lepennec@live.fr>
---
 man/man2const/F_CREATED_QUERY.2const | 107 +++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 man/man2const/F_CREATED_QUERY.2const

diff --git a/man/man2const/F_CREATED_QUERY.2const b/man/man2const/F_CREATED_QUERY.2const
new file mode 100644
index 0000000000..fe6a0fe536
--- /dev/null
+++ b/man/man2const/F_CREATED_QUERY.2const
@@ -0,0 +1,107 @@
+.\" Copyright, the authors of the Linux man-pages project
+.\"
+.\" SPDX-License-Identifier: Linux-man-pages-copyleft
+.\"
+.TH F_CREATED_QUERY 2const 2026-10-11 "Linux man-pages (unreleased)"
+.SH NAME
+F_CREATED_QUERY
+\-
+determine whether a file was created
+.SH LIBRARY
+Standard C library
+.RI ( libc ,\~ \-lc )
+.SH SYNOPSIS
+.nf
+.B #define _GNU_SOURCE
+.B #include <fcntl.h>
+.P
+.BI "int fcntl(int " fd ", F_CREATED_QUERY);
+.fi
+.SH DESCRIPTION
+A call to
+.BR open( "..., " O_CREAT " | ..." )
+may optionally create a file, if the specified file does not already exist (see
+.BR open (2)
+for details).
+If the file was created, the
+.BR fcntl ()
+.B F_CREATED_QUERY
+operation on the resulting
+.I fd
+returns 1.
+Note that this is a property of the
+.IR "open file description" ,
+rather than the file descriptor, and therefore carries across any
+.BR dup (2)ed
+file descriptors.
+.SH RETURN VALUE
+On success, if
+.I fd
+refers to a file that was created by
+.BR open (2),
+1 is returned.
+Otherwise, zero is returned.
+On error, \-1 is returned, and
+.I errno
+is set to indicate the error.
+.SH ERRORS
+See
+.BR fcntl (2).
+.SH STANDARDS
+Linux.
+.SH HISTORY
+Linux 6.12.
+.SH EXAMPLES
+The following program repeatedly attempts to open the file supplied in its first
+command-line argument, potentially creating it, prints whether that file was
+actually created, and exits if it wasn't.
+Example output:
+.P
+.in +4n
+.EX
+.RB $ " ./a.out some-path"
+F_CREATED_QUERY: 1 (file was created)
+F_CREATED_QUERY: 0 (file exists)
+.EE
+.in
+.SS Program source
+.\" SRC BEGIN (created_query.c)
+.EX
+#define _GNU_SOURCE
+#include <err.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+\&
+int
+main(int argc, char *argv[]) {
+	int fd;
+	int ret;
+
+	if (argc != 2) {
+		fprintf(stderr, "Usage: %s path\[rs]n", argv[0]);
+		exit(EXIT_FAILURE);
+	}
+
+	do {
+		fd = open(argv[1], O_CREAT | O_RDONLY, 0644);
+		if (fd == -1)
+			err(EXIT_FAILURE, "open");
+
+		ret = fcntl(fd, F_CREATED_QUERY);
+		if (ret == -1)
+			err(EXIT_FAILURE, "fcntl");
+
+		printf("F_CREATED_QUERY: %d (file %s)\[rs]n", ret,
+		       ret ? "was created" : "exists");
+
+		close(fd);
+	} while (ret != 0);
+}
+.EE
+.\" SRC END
+.SH SEE ALSO
+.BR creat (2),
+.BR fcntl (2),
+.BR open (2)
-- 
2.55.0

