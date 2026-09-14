Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC7E30568E
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386774; cv=none; b=PzvqWrKnJaB73tZKXo1IjVyB9RZqSr2Ij93DEzYzbmwFd81+p9zWMN0aJrd8pJHYlc1xhiMSF00756SFkiT5B2n/C/TA9uK/aRFAM0A8rIOYQeHofwHNhi0wSdRXY1ox3s9aEppUvnH7k1Da0wlOIHPwUiXe4xq1nX1Vvjcyybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386774; c=relaxed/simple;
	bh=JVa2PqUbEb/9Exw/H5J4oFicyHlbzWz0Ubh8znKFICQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2bxUoX4RlWa+VGPgWi9WM2q9FeClIxXpHq3LkP4GfhlL1pTOlHs1xbrrD9kS9SWjjoSK3YQFXFRW3BupBd2VGGOgKg6lV/2RDkqOXbFv4V1C8CqhjCbwWSkpgJmvKeJaEujZnZVZPbk5bTxMnZjcB3pldkOGJdgE1RWNPYVvhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=qkxcWlHt; arc=none smtp.client-ip=91.218.175.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="qkxcWlHt"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JVa2PqUbEb/9Exw/H5J4oFicyHlbzWz0Ubh8znKFICQ=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386770; v=1; x=1789991570;
 b=qkxcWlHtDSeW72uc1jxO8s1H8A6iYWUhsBcD2PcFxG7VjjpufmQ815/VUFxUcaucEXh1cDMA
 O0NpboYzdfYsJUQd8mmPGYfex5PSj95ix+0Aw0y4S/cMdYVd2mqrEZMiMj/pe+bqzkQy7M56Yy2
 fRsznOu1reBXFjfwspEx36XZYVZnD0p2fjwBthHTdFNOQGl9Jh8dHN+FfkHXf8WUDJtX03AHDdD
 FRnCOFWFpV579pABTRbLVLg8OF/NSTgNz7rKgxiVnjtZcHS+znhWLBmWj8qYABH87Z0YKZGz5I2
 aLu1HHjoQ3csyRW3CkAd0PV+haEG44G2e4o7RGXKvhV6Q==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 136b23a9dae035b6;
	Mon, 14 Sep 2026 11:52:49 +0000
X-Mizu-Trace-ID: 136b23a9dae035b6
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 3/4] man/man5/proc_pid_{smaps,smaps_rollup,maps}.5, man/man7/capabilities.7: CAP_PERFMON allows reading /proc/pid/{smaps,smaps_rollup,maps}
Date: Mon, 14 Sep 2026 05:51:47 -0600
Message-ID: <2131d236b21001cff1d6d6725539bf434b2ea42c.1789386106.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789386106.git.git@maxchernoff.ca>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca> <cover.1789386106.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015; i=git@maxchernoff.ca; h=from:subject:message-id; bh=JVa2PqUbEb/9Exw/H5J4oFicyHlbzWz0Ubh8znKFICQ=; b=owGbwMvMwCXWf8WB5bZ2aR3jabUkhqzl969sv/110uum06x/whbNeaXPK197RUrN+LBRrNjTp 5rMv+4t7ChlYRDjYpAVU2SJyUzh+Jr47NBCLe0FMHNYmUCGMHBxCsBEePsZGXpSojInrpM7/8WB /8e0Ro4XUYuSr+rIHCzjdJ/g8rFxUwojQyvbOcWDZ36fy27W+JBSfNcnv9civz44rdXS8phyTlw cOwA=
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

Link: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c555a3c1bc9114ad91422b941dcd29e02490687>
Signed-off-by: Max Chernoff <git@maxchernoff.ca>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
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

