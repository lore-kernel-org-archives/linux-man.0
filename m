Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0FF1A9F82
	for <linux-man@vger.kernel.org>; Mon,  6 Apr 2026 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775453761; cv=none; b=GHkkCEXfxhUwVCzP9TBmKeS14i+edSiELsQSYShj+hb3duBQC5uSEUSnn4S18A1irEJv4jlKbIoryAoZWC4cS/+c3cT3/p/Umvm5RKHUPqSR4/DqlKZlIeHkzco+muLmXs09EdafuUKnYMtMKlBKtSkRsLZ/P9eGJR9x9vE2w6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775453761; c=relaxed/simple;
	bh=+wGYSyYi61UI7cJ1Zqof9GQamkD6uJjOh2hl0GKk6As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFB2jtbpK7UUd2ffjJPQ/U9wnRVRqP6qlgHdv5ATvALW1929XRUsXT6AENHzyoQRi+4r6gLdaTpEj9b9Dn55b6vOG2dULi7yZIOSGZRDfE4IKtUusU4vxZKLxOPUR16cpgVn1zawtIVkXOBOkpS+2nsTHITlp69/9egWUeH/x2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vursc.org; spf=pass smtp.mailfrom=vursc.org; dkim=pass (2048-bit key) header.d=vursc.org header.i=@vursc.org header.b=HIBStBTF; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vursc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vursc.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vursc.org header.i=@vursc.org header.b="HIBStBTF"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fpyjR2hBZz9smP;
	Mon,  6 Apr 2026 07:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vursc.org; s=MBO0001;
	t=1775453755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JsCEsPMabUJ3Pj/PSLyOazf4buRE/lmyOAJgNpa7lJo=;
	b=HIBStBTFMd1sN1IdZcE09+oMCbKngnunwCBrP54t1r0cql7phZtMK7xmhfiLgD6Mom38kN
	kZA5oxkACG/AEYKPie0uYFGFShLrd+zfIIyJeyI6eLPvZEqb2J8XwpkM6fQtakNhQKznEX
	Bady2SUij8WEmVF9nTTQMpExhJVJld3cr8F0Yqxs40+m2XW+H1uM0Kt6NyV8rOMihUP3QU
	+CYdwSW9Q9vgQpGD/5nbLjUrXDvj9GqFb11ZGXHKYSGQreRacWyPZ3NYgq02rdng9l4/5X
	i7ioRY5Gr3aqtgzqtmcJ641KPHGnr0OSntlYS/iQqyFgsFioPwkVjV/lVbKJKA==
From: vursc <vursc@vursc.org>
To: linux-man@vger.kernel.org
Cc: vursc <vursc@vursc.org>
Subject: [PATCH v2] man/man2/getdents.2: Document system call interface of getdents64
Date: Mon,  6 Apr 2026 05:35:53 +0000
Message-ID: <20260406053554.150929-1-vursc@vursc.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The count argument of the getdents64 system call is assumed to not exceed
INT_MAX. The glibc function accepts a size_t and passes INT_MAX to the kernel
if count exceeds INT_MAX.

Also document the glibc definition of the linux_dirent64 structure as dirent64.

Signed-off-by: vursc <vursc@vursc.org>
---
 man/man2/getdents.2 | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/man/man2/getdents.2 b/man/man2/getdents.2
index 8c5bbebbc..48bdf7bd7 100644
--- a/man/man2/getdents.2
+++ b/man/man2/getdents.2
@@ -42,7 +42,6 @@ These are not the interfaces you are interested in.
 Look at
 .BR readdir (3)
 for the POSIX-conforming C library interface.
-This page documents the bare kernel system call interfaces.
 .SS getdents()
 The system call
 .BR getdents ()
@@ -216,10 +215,29 @@ using
 .BR syscall (2).
 In that case you will need to define the
 .I linux_dirent
-or
-.I linux_dirent64
 structure yourself.
 .P
+The
+.B getdents64
+system call accepts an
+.B unsigned int
+argument
+.I count
+and assumes that
+.I count
+does not exceed
+.BR INT_MAX .
+The glibc wrapper function sets
+.I count
+to
+.B INT_MAX
+if it exceeds
+.BR INT_MAX .
+glibc defines the
+.I linux_dirent64
+structure as
+.IR dirent64 .
+.P
 Probably, you want to use
 .BR readdir (3)
 instead of these system calls.
-- 
2.53.0

