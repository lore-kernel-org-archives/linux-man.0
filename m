Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013077.outbound.protection.outlook.com [52.103.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F45D4DA9C3
	for <linux-man@vger.kernel.org>; Mon, 12 Oct 2026 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839325; cv=fail; b=tfba7h0XBxy2vEwJEHHGA2FmXxWjyij+rAY3CgMZTteHRKC/uqz9uBqgXbxS2l9C1sSjyTm5MIzXOEdowWGciwFf+lsO5UpSOZSmRFj5+XR11icQBIsWAyc20aIHLLRXDhD0tZBS+DyzMij4QQGutxZOaGj+nsKnNVR67VzMLQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839325; c=relaxed/simple;
	bh=s2GH1VAdJ4UMV6zVB4rquWaFPApRlUoVbTZVzJFhMGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mVuHsQ0RKhuziq33kKVtffWwHuRLM/yH17EH0dCVqkd4UAWFa2B4LneSxlovqcOicX0K86WiZXZya9OPtm+voi0a0du7aC+WOxcJEUyzPG2gx9aC47wDj+jHhfpKQqn98swQeJHKEv1ahcWJElmFt7+9TqDZOcuEkPeYaGw4Qc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=OKGjdll7; arc=fail smtp.client-ip=52.103.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="OKGjdll7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERAXfUOzeGcHq8s9FCBX+OurLWSQ7xcG8fFUlu/obdWGBOEx0gPcvvAaOP/XEeCgeW6f1gGRcYxSg62QH+ld0eD/z6Si368J5qCwlWBRSziecMzdOACxZspSWTJODyut5wN2VdfwW/AGmStbS6qPIJXi+U0NGwCT3lFIsDltfmi77eJg88XoX0Gu7eg8HP76brRSeyZVZQQxhpp0JDkMsxf5mvRUwB7lu82Txg4QpCNskZsYNNb0rh3xp6Zpb74JLKlfxJ1qpUf0Pr3Di3kp1bZl+xpMeGqJ/S78PYXIooYD8qbeX6r/m6AmdhZ9biNJXXSCYbfNJWoeQkj2DDq1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXY5HmfMkwvDPbapqz+/pwXzinCQhYGj2zo3bYjjMKw=;
 b=aPMm9Rnb/kQuUY2mc25RKkuLU1FFuw/g5IqPLaKuznTckTAGsnD9LFxtCJQ4asDZWN03lfsOe6eCNjG0iml44Bm16vVeqeQ2LIdzuBRE9DojVZDMN/n8P2o4ez1+jo+V1dizKnNETIu7OMtP66MbO8JF633q6vc2Fk7KbaaPfP1GJfJXW6SLMiFdko4qPKYADcKauTEbx9/tMNfC7B2BP1ObeRfigMymKX2AXjUOOvnwIaK2ZhofkdibbCZuGSzIxq8AKAlv4oLadQV0UVk+E44S7SmdZMQ8Mj2wmvTQvBSEZopGjBb+tev4ywKkTGJN67qKQkpun7sqXOcBthuKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXY5HmfMkwvDPbapqz+/pwXzinCQhYGj2zo3bYjjMKw=;
 b=OKGjdll7kNICbEPkmk/3fpndzf8U43pz7KqhwUtnnnNvuiaUhrZQVnUOmsFsoYs04Ge26gx55CVrQqtdqjUZF4yPQ8MYhzA8SJgd4xHAqEiezVfMT5XmFNS8N70oz66twJuQs4y7PwZTAPcypdyon7bFhgaWiGxg3gKgmAzn8yvn0tRAimJMx+jwD41az4m3Gb5OuAH0ymIgTOfd8fiNlMROI6+QFetxBKn2gscHBCGwhoT9Q2xvILw0OFcpusiYufbZuDFopKd9vCb4utR2TNqnUPwFvFk4K0mDVa+5OBCXt6CQTQ4wDz7ZtRVPChRt2LKrd+zleecC7xwN+vtZpQ==
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
Subject: [PATCH v1 1/3] man/man2const/F_DUPFD_QUERY.2const: Add page
Date: Mon, 12 Oct 2026 23:08:14 +0200
Message-ID:
 <AS2PR02MB9737E7B696310F87C9571E789B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0288.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::14) To AS2PR02MB9737.eurprd02.prod.outlook.com
 (2603:10a6:20b:60f::14)
X-Microsoft-Original-Message-ID:
 <20261012210816.2575185-2-yannick.lepennec@live.fr>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB9737:EE_|DU0PR02MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5c7819-8e02-4f4d-3a87-08df28a4fca9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|15080799012|23021999003|41001999006|260925184616899003|25010399006|4140399003|5072599009|16041099003|55001999006|24021099003|2607281247196008|440099028|3412199025|4302099013|10035399007|53005399003|40105399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sxDR5GJiMa8Wf8EFtJQGia1jV37p5lKTobGPckoLjRTgBhdXt7AGXg0Nb/SH?=
 =?us-ascii?Q?TrVJl5BSzRJlG0fw/e41oRbi22vRYyJiEYr/qh9LjQ+bRRPovMFE1p+b+ImG?=
 =?us-ascii?Q?Ah59z+NuxSDG9qZeaSAeHv8RKUA/mWB7s/c3qC725qDewfHPET80BxLrrIJ/?=
 =?us-ascii?Q?czSle13X2M//hvY6e8vmfzirjhY06L6wnRIT6mrEQnJbWCN/T4ZYqmnJsQCn?=
 =?us-ascii?Q?SCb/SxboaUGb7sbIgtRMlWsW66m4/wHtv4pqutr64fpvRiyRnAKYZF80huGC?=
 =?us-ascii?Q?7boKPKCVJ0dVDW7gOacvruZzCAP23H9vUn8/gLzwxpGEcPCS5WOrLpd3w2/Q?=
 =?us-ascii?Q?GMOUE8PgnFhTKiXvPJ/MV4ZMVznI7xlepS4Y3WbyaKL1JfdkyBYoz3CmEfX1?=
 =?us-ascii?Q?klxWisbqfoAkUzWHt8U7lDV621bgOkT8NpB2wHKgcEJ0TkCWf1DcnwUQ/wtg?=
 =?us-ascii?Q?2oQwIEQGZT5AW5AkG/diweYyk16yvlm6mS22aeJ49ikng6fm5tn6qcUfO0Ze?=
 =?us-ascii?Q?kQy9Sk2PUaZjXXtBplX7O3QP1oKDlAWDFkP3Jjcf5iCuUVDkJ0/yWv8Ed1q6?=
 =?us-ascii?Q?NPM/vX9a6TCO+XJTno4jE8T6OArZCDdI5v0zTjYWZ3WpmSLPj3MZV3AxlqP7?=
 =?us-ascii?Q?2DotBdfppVtrCItjWw8beqrlRZLpXkURq/I4N19zCb8qdLvgKJsDtFh/yT4v?=
 =?us-ascii?Q?2UHjABgd5lPpHUnkcodZ7FYJMJQNFEW1619Gie3lmDBmOdk6DrnHBYJJEoJH?=
 =?us-ascii?Q?EMLfFu/oypI1BZjRHspvZlxgMyDQhQJuXlAlid/+TFHjvuiw3kXtjJIHlaPQ?=
 =?us-ascii?Q?FV1uKbzvNLjrBprBUJK5O45E51r1lHDJJRfsVvOW24YQxLfwUf8hHF0oqVqk?=
 =?us-ascii?Q?+QzGDSJIA8CZc5jdm5SuGQ6kbU0bsgYWUuHT1LsNebiHIwbjFBj4XovBYwcU?=
 =?us-ascii?Q?0DqFATXNNRa5+KZsDts2byIfjcdMzmu0yPemo362yTwlJ13gQpPDtiqwZpnl?=
 =?us-ascii?Q?OaeIY6crvXatZTeHtHZgME3/MvpBj52C6cRYrYFN6pCIz4o9VwsFYoLPZu6f?=
 =?us-ascii?Q?nTCG4g4s1vPh2hgVYI7V0BU24ZZI5dLgu7UPSlo97eDS9lDezds=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tFAA0tRnOIukfYo+yjrSlvOmN4af2pl47C82BXQC9vbA4pxJQHFIWc41avsM?=
 =?us-ascii?Q?ORsuEqCuklDy0uznpjcxsgL3URKKo8kPWsW0TZdsmatK8xn1aRnqrOm9Yn5p?=
 =?us-ascii?Q?zFVhb2bs9HWEPwSlzoIgTV427hF7RQSDnlHJmJY9+n8u8dmRZnwKbB5JjYzj?=
 =?us-ascii?Q?lq5ndrrSOT/6ViGHwabFyKQ9dT6kV9FX/ASF9PE22q9rQUKBvKDfJsO1qudj?=
 =?us-ascii?Q?VkZmgnyhoqxRyb251XJWchCNDqpkpEunDTPHxrXQ5UvPktUGLX68BAyr7Gzu?=
 =?us-ascii?Q?p3jCkBVsB5OzZ89x24Vih2VTdviXCtAmiaK2esBGRuspYHtq5lrbCJ6bFev/?=
 =?us-ascii?Q?MbA8Izqnh9RA1/cYcuELQxHdwGIvOFXJRIoGmLoPyE2PzFMi0BcLkm3Mp7Sd?=
 =?us-ascii?Q?udTPBQGMJZOKePrnLH+yTum1vRROIeDD39npP6OX2bqwaGFeyX/LotBItcny?=
 =?us-ascii?Q?faeAlIuP0LacQdgZoa0gbr3KAirG7LzP0XUg/qo5WHeZXR3YVFfiORxvUIU+?=
 =?us-ascii?Q?N7HQEPy4R99YyKf3xmFbxnBzr/JbCICufhr/gyy8Wto7mLv3/wqfA50if/MT?=
 =?us-ascii?Q?nW8flifM1FoYugZmmKEAFBGKN/c1X9jOKqOTuB7CXpp4OZV6EpnnsI3I2Nxd?=
 =?us-ascii?Q?xKmXPRn/c3ndzwbY/z6J7/VZ9WGmx2l1/ZApd7a/KgHWH2S3M8gdgfTEW7I2?=
 =?us-ascii?Q?R7JUqnpTm9xGyZk7B++0iT7fgMWw7XATHUNitd2LzPQQGH7KzHeZ6PR/C2n/?=
 =?us-ascii?Q?D/O77KsiGYyq58Ee8pxLOPsUZ5yWPWmwN+w1RgqR/oBQkM6qIEDa63TGMWsq?=
 =?us-ascii?Q?lwAOEa5kGaJ2FgHTYO7nqkejeA872J/kK2QT/O1w2SJ/wwRmgkP2bi4yTtmn?=
 =?us-ascii?Q?1C71Fkjuz77TlYaLTbRTR/pyl0nk4kovtA0CKTwp2OS/68gC8RHoSwZdPM2o?=
 =?us-ascii?Q?jEyohbZg7rQUjeC+CZABm5b8galviQCXyzSkn+wf1FdsAVY7vIaGPA+1eCoD?=
 =?us-ascii?Q?+SJFHJP9k86xAccsoYIJ4qVbjseq4sSht/MHsvZjZQCJn/cwvZJVqWxyipl2?=
 =?us-ascii?Q?IfVdmpIWY9qWbv8BRSIVULK9TI6a7KzxOZmL5jQ4pWlzS9OoJBfTyNOA4AF2?=
 =?us-ascii?Q?7EISxEExlhYXX6TTKol0EXMdsJ2SFQfMHSELfz72C25UjSwM/tvQuawQeHMD?=
 =?us-ascii?Q?YsMGg8qXt1zs3xpNclsukd/nTKjDTQ8Jc2XVfUQ5in1E0mJsdYl95pUm+i0C?=
 =?us-ascii?Q?8celgrP0oT2Hcc97sp2SqyozIc3RnjWH0Ry88cFZEEoZuesyG2kjp9ZPG974?=
 =?us-ascii?Q?8JEaMle2rs4ZH6nJqY5LRpNAxzHK2QOKVA/JDH+WP2CZlE9nh1DDRmV3QBFT?=
 =?us-ascii?Q?/yp94Dc+0mrYpaPzP5iEm/A56QqWqANMo84Zo84HlvMNnhaDiFgbS8HY1DhH?=
 =?us-ascii?Q?F5eGWnjjhOrlEJ99FSuZDdnXz5xDeymwwuWBlOyuhDYDz6FNoD76pw=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-9f624.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5c7819-8e02-4f4d-3a87-08df28a4fca9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB9737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 21:08:39.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9799

Linux 6.10 adds a new fcntl(2) operation, F_DUPFD_QUERY, which glibc exposes
since 2.41. This commit documents it, with example usage.

In essence, F_DUPFD_QUERY takes two file descriptors and determines whether they
refer to the same open file description (by comparing the pointers to the
underlying struct file). Two file descriptors can refer to the same open file
description if one was obtained by dup(2)ing the other, for example.

Previously, this comparison could be done through the kcmp system call with
KCMP_FILE (see kcmp(2)), but not only that interface is much broader, glibc
does not presently provide a wrapper for it.

See-also: linux.git c62b758bae6a ("fcntl: add F_DUPFD_QUERY fcntl()")
See-also: glibc.git 28f8cee64a32 ("Add F_DUPFD_QUERY from Linux 6.10 to
                                  bits/fcntl-linux.h")
Link: <https://lore.kernel.org/dri-devel/CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com/>
Link: <https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=28f8cee64a3223636d15c78f69432503d8ef1c22>
Signed-off-by: Yannick Le Pennec <yannick.lepennec@live.fr>
---
 man/man2const/F_DUPFD_QUERY.2const | 105 +++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 man/man2const/F_DUPFD_QUERY.2const

diff --git a/man/man2const/F_DUPFD_QUERY.2const b/man/man2const/F_DUPFD_QUERY.2const
new file mode 100644
index 0000000000..0a07f3968a
--- /dev/null
+++ b/man/man2const/F_DUPFD_QUERY.2const
@@ -0,0 +1,105 @@
+.\" Copyright, the authors of the Linux man-pages project
+.\"
+.\" SPDX-License-Identifier: Linux-man-pages-copyleft
+.\"
+.TH F_DUPFD_QUERY 2const 2026-10-11 "Linux man-pages (unreleased)"
+.SH NAME
+F_DUPFD_QUERY
+\-
+determine whether two file descriptors refer to the same open file description
+.SH LIBRARY
+Standard C library
+.RI ( libc ,\~ \-lc )
+.SH SYNOPSIS
+.nf
+.B #define _GNU_SOURCE
+.B #include <fcntl.h>
+.P
+.BI "int fcntl(int " fd ", F_DUPFD_QUERY, int " other );
+.fi
+.SH DESCRIPTION
+Determine whether file descriptors
+.I fd
+and
+.I other
+refer to the same open file description (see
+.BR open (2)).
+.SH RETURN VALUE
+On success, if both
+.I fd
+and
+.I other
+refer to the same open file description, 1 is returned.
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
+Linux 6.10.
+.SH NOTES
+On Linux, this
+.BR fcntl ()
+.BR F_DUPFD_QUERY
+operation is a narrower, more efficient spelling of the following
+.BR kcmp (2)
+invocation:
+.P
+.in +4n
+.EX
+int   ret;
+pid_t pid;
+
+pid = getpid();
+ret = syscall(SYS_kcmp, pid, pid, KCMP_FILE, fd, other);
+
+if (ret == 0) {
+	/* fd and other refer to the same file */
+}
+.EE
+.in
+.SH EXAMPLES
+The following program checks whether standard output and standard error streams
+refer to the same open file description (typically, the user's terminal).
+Example output:
+.P
+.in +4n
+.EX
+.RB $ " ./a.out"
+stdout and stderr are the same file
+.RB $ " ./a.out 2> /dev/null"
+stdout and stderr are different files
+.EE
+.in
+.SS Program source
+.\" SRC BEGIN (dupfd_query.c)
+.EX
+#define _GNU_SOURCE
+#include <err.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+\&
+int
+main(void) {
+	int ret;
+
+	ret = fcntl(STDOUT_FILENO, F_DUPFD_QUERY, STDERR_FILENO);
+	if (ret == -1)
+		err(EXIT_FAILURE, "fcntl");
+
+	printf("stdout and stderr are %s\[rs]n",
+	       ret ? "the same file" : "different files");
+}
+.EE
+.\" SRC END
+.SH SEE ALSO
+.BR dup (2),
+.BR fcntl (2),
+.BR kcmp (2),
+.BR open (2)
-- 
2.55.0

