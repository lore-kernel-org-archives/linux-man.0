Received: from aion.slow.network (aion.slow.network [95.179.232.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76A3CE4BF
	for <linux-man@vger.kernel.org>; Fri,  1 May 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.179.232.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777647583; cv=none; b=qZypHieLUQWq1BejXmLfDjYR7kaLkHHijb2KkZNcMqBefkfkmLpx5E6UBIjUzzD900e+W+hoUj6ciwl80xH8IrlcczUxdo68FyL7Qe6xACsvGAfHieuWK2xL5yUPvtqVhAl6+cZT51r3BCkT/iL/eoAJd38dJnm2mkXjHSXKak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777647583; c=relaxed/simple;
	bh=J2qYOuhamLYrmamDYNY8p/MnU0UmqOCQ4FGeXHN0rgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAcLI73Vj6R4tI1z4fLOss9dKb1gIwadZPA3s/ZTsiYdQEfd6cI39Ax1VYAizFV1miQhiyQiZpUIQUG9VSAwbI7wA3Iodtf7KFQ47lI+QSTxzp/wRCkHZB+jhgbcujGTzMEGscJJ030MslTiyiTkk5S36CIpA2O21wLY8N5rhBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kramkow.ski; spf=pass smtp.mailfrom=kramkow.ski; dkim=pass (2048-bit key) header.d=kramkow.ski header.i=@kramkow.ski header.b=GjxsDrBz; arc=none smtp.client-ip=95.179.232.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kramkow.ski
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kramkow.ski
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kramkow.ski header.i=@kramkow.ski header.b="GjxsDrBz"
Received: from erebus.slow.network (erebus.slow.network [2a01:7e00:e000:24e:109:74:205:187])
	by aion.slow.network (OpenSMTPD) with ESMTPS id b84baeeb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 1 May 2026 15:57:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=20220506; bh=J2qYOuhamLY
	rmamDYNY8p/MnU0UmqOCQ4FGeXHN0rgA=; h=date:subject:cc:to:from;
	d=kramkow.ski; b=GjxsDrBzse+pER23mwKkmiChVfrB9a/D4DrYmOm3C40WkpDpyokaG
	x7n3Fs93daQjoyMDuKiEoepFNWJe/U9vteeMh+hIEg9bOgD2KrdLJKlPphlaM4Au1+kQPW
	M9EZiP/j5e19EnpwC9ReFM0EVw9zk5A/Mjk1Y6fGYQUjKikVCk+1q0lxzax5vQw64UgbdD
	wWhmHlPK4Sti80GG6OzR3YdiehDPOaP0ufoPNs7UpBJ73QN+LXE6jiUgv6lWzqClQ7DTPF
	JEbXqnhkmb05VltqsDBtOJKPlAElLfaXsuUIG/JhZJtuoURwwBvQuMb5Nr/2x/tlYBOjuk
	NkJbnGvkA==
Received: from localhost (flit-04-b2-v4wan-169180-cust382.vm32.cable.virginm.net [81.96.161.127])
	by erebus.slow.network (OpenSMTPD) with ESMTPSA id 3cd42e49 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 1 May 2026 14:57:24 +0000 (UTC)
From: Tomasz Kramkowski <tomasz@kramkow.ski>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Tomasz Kramkowski <tomasz@kramkow.ski>
Subject: [PATCH] man/man2/ioctl_tty.2: Fix references to TCSETS(2const)
Date: Fri,  1 May 2026 15:57:01 +0100
Message-ID: <20260501145701.66573-1-tomasz@kramkow.ski>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the duplicate references to refer to all of the different
variants of the TC{GET,SET{S,S2,W}{,W,F}} constants.

This looks to be a bug which was introduced during a restructuring.

Signed-off-by: Tomasz Kramkowski <tomasz@kramkow.ski>
---
 man/man2/ioctl_tty.2 | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/man/man2/ioctl_tty.2 b/man/man2/ioctl_tty.2
index 1d6e279c0..cb2776867 100644
--- a/man/man2/ioctl_tty.2
+++ b/man/man2/ioctl_tty.2
@@ -42,21 +42,21 @@ whenever possible.
 .TQ
 .BR TCSETSF (2const)
 .TP
-.BR TCGETS (2const)
+.BR TCGETS2 (2const)
 .TQ
-.BR TCSETS (2const)
+.BR TCSETS2 (2const)
 .TQ
-.BR TCSETSW (2const)
+.BR TCSETSW2 (2const)
 .TQ
-.BR TCSETSF (2const)
+.BR TCSETSF2 (2const)
 .TP
-.BR TCGETS (2const)
+.BR TCGETA (2const)
 .TQ
-.BR TCSETS (2const)
+.BR TCSETA (2const)
 .TQ
-.BR TCSETSW (2const)
+.BR TCSETAW (2const)
 .TQ
-.BR TCSETSF (2const)
+.BR TCSETAF (2const)
 .SS Locking the termios structure
 .TP
 .BR TIOCGLCKTRMIOS (2const)
-- 
2.51.0

