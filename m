Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFF37DEBF
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212801; cv=none; b=LHkRlzqzwr4eHNt968sJuwqTu1ainuaZJIsqYQKVM01uYpiv2pnABivlx5Qq/+sS0zp6/awce8ShzEZvsOWMy2jD2JzJHAZRdJ5P+J6AsldQ9otNHvkmjeQAHIFZv+5t8M8KgRldXHL0yfTMEr7gu5d+OTSIIZaCZ7nagY3hGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212801; c=relaxed/simple;
	bh=AwB6i/410ZEuHP4xlJU64WvnxpqLPHH+yhFxrO8uIBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQoeyL1Htn2ycA8pwMf0sLh3uUEZxvS8y/kTZkydgdDsvhxkWEqEFnd+24ct3V+L8zmXiz/9GPxCPgEFZqBNFMA9A8GEMEPBq67RsXfCKxiWZ0YyT0u3B2zsTnRaBCyfndzWBb4eyE8lDtQj+mQC4z5H4P+l4OxIQwQKHJcMyjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=VB436p4U; arc=none smtp.client-ip=91.218.175.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="VB436p4U"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AwB6i/410ZEuHP4xlJU64WvnxpqLPHH+yhFxrO8uIBA=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789212796; v=1; x=1789817596;
 b=VB436p4UvE4TEmogNtRXrE+D+6c9LuwbmS0Js4LGEB0/jKK+VKMy9fDVkOxHvaZDAktQlNFl
 eD4AYiU6bvWjVXquEdg9hRTlQYntR3IPOKur2wZOWxC+CkNLfnWuCR+LOF6xRL4wS6pusLfi9yv
 P6FNEsU3KV9/8nghprVDecvM5CWrg8dVebh8bg4NL+BWlLNBAktDvS0nny84nakgsW2RbnGZxmn
 ggEo00KcRAGoBgyrWP4B8LsWwcEAkxs2fkWdpEehO8wsO5wBA+Lot6uy0+RLbjImGiTW6Qe9VYs
 7P86gI6RZZcfuKVcPdPESXybsklBxEni7eZBEed5MVajw==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e4a5df52e45e077e;
	Sat, 12 Sep 2026 11:33:16 +0000
X-Mizu-Trace-ID: e4a5df52e45e077e
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH 2/3] man/man5/proc_pid_{smaps,smaps_rollup,maps}.5, man/man7/capabilities.7: CAP_PERFMON allows reading /proc/pid/{smaps,smaps_rollup,maps}
Date: Sat, 12 Sep 2026 05:32:12 -0600
Message-ID: <b239ee32ef7d0cbdc09c95f28034bb2426f72507.1789212041.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966; i=git@maxchernoff.ca; h=from:subject:message-id; bh=AwB6i/410ZEuHP4xlJU64WvnxpqLPHH+yhFxrO8uIBA=; b=owGbwMvMwCXWf8WB5bZ2aR3jabUkhqylFs4f3Wy3+D250bZrgeWcCvWTs9Wf++5/1dJ1p/2Ms tzZ6zGtHaUsDGJcDLJiiiwxmSkcXxOfHVqopb0AZg4rE8gQBi5OAZjIIU2G/2UW3pVpE+tME4oc zO4ui695+fBVY/mB9IQPAVtX85owuDEyLDD5tYf5/pb9NosXvPsmJHIucdd53xur5j248jb81fv dE/kB
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

Link: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c555a3c1bc9114ad91422b941dcd29e02490687>
Signed-off-by: Max Chernoff <git@maxchernoff.ca>
---
 man/man5/proc_pid_maps.5  |  5 ++++-
 man/man5/proc_pid_smaps.5 | 10 ++++++++++
 man/man7/capabilities.7   |  9 ++++++++-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/man/man5/proc_pid_maps.5 b/man/man5/proc_pid_maps.5
index 8783dbb3a89d..dcd455ea840c 100644
--- a/man/man5/proc_pid_maps.5
+++ b/man/man5/proc_pid_maps.5
@@ -16,7 +16,10 @@
 .BR mmap (2)
 for some further information about memory mappings.
 .IP
-Permission to access this file is governed by a ptrace access mode
+Permission to access this file is governed by
+.B CAP_PERFMON
+(since Linux 6.15)
+or a ptrace access mode
 .B PTRACE_MODE_READ_FSCREDS
 check;
 see
diff --git a/man/man5/proc_pid_smaps.5 b/man/man5/proc_pid_smaps.5
index 51440cc13bf6..d83521409375 100644
--- a/man/man5/proc_pid_smaps.5
+++ b/man/man5/proc_pid_smaps.5
@@ -16,6 +16,16 @@
 .BR pmap (1)
 command displays similar information,
 in a form that may be easier for parsing.)
+.IP
+Permission to access this file is governed by
+.B CAP_PERFMON
+(since Linux 6.15)
+or a ptrace access mode
+.B PTRACE_MODE_READ_FSCREDS
+check;
+see
+.BR ptrace (2).
+.IP
 For each mapping there is a series of lines such as the following:
 .IP
 .in +4n
diff --git a/man/man7/capabilities.7 b/man/man7/capabilities.7
index eef074979f1b..bb8f6d9db433 100644
--- a/man/man7/capabilities.7
+++ b/man/man7/capabilities.7
@@ -283,7 +283,14 @@
 call
 .BR perf_event_open (2);
 .IP \[bu]
-employ various BPF operations that have performance implications.
+employ various BPF operations that have performance implications;
+.IP \[bu]
+read the contents of
+.IR /proc/ pid /maps,
+.IR /proc/ pid /smaps,
+and
+.IR /proc/ pid /smaps_rollup
+for all processes.
 .RE
 .PD
 .IP
-- 
2.55.0

