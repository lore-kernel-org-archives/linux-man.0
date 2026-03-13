Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA64346AD4
	for <linux-man@vger.kernel.org>; Fri, 13 Mar 2026 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773429365; cv=none; b=Zvridpc3mN2RHbRvNLXVb8Pwn/DYkdcI1O//cIqJsl2G1HhNVUQfseULwghCJjSEvcY8fRldFP+xFdPOIglloiqVIqptIuEdin+FjmsNEAoKBAbwhcY1Dq4oXg9h7vTEOc4yQeXjqR5upf8MFFrbqlqCqHoLfxCKx6BKlq53VAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773429365; c=relaxed/simple;
	bh=tJNKHp1tJ/dvxi2pJfaXmYs+LQbvjNndLuUK6Z/v1SA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VP/g0YXqVM/S5h6kbBp/vy94o9JEjv+fjQCDM7fMptQJDCE8f6lJh64y3NN26kKAZh+BersEUaMDnQWcsWZ4Jx6X6jZ0jREbWHSEHXw6iYtvxQvq3DbB+izbiVxKmp0a/9ydAI5XIvP2hwRCLkNQ5Ibfz84J/+Q2UalcpbWSegg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FB661758;
	Fri, 13 Mar 2026 12:15:56 -0700 (PDT)
Received: from NH27D9T0LF (unknown [10.57.11.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1683F694;
	Fri, 13 Mar 2026 12:16:01 -0700 (PDT)
Date: Fri, 13 Mar 2026 20:15:54 +0100
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Lepton Wu <ytht.net@gmail.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH] core.5: document the %f and %C core_pattern specifiers
Message-ID: <abRiap_UrhFzNxPs@NH27D9T0LF>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Whilst going through the relevant kernel code in fs/coredump.c, I noticed that
two core pattern specifiers supported by Linux are missing from man5/core.5.
Document them now.

Signed-off-by: Emanuele Rocca <emanuele.rocca@arm.com>
---
 man/man5/core.5 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man/man5/core.5 b/man/man5/core.5
index 8c26aa07e..4da5819b6 100644
--- a/man/man5/core.5
+++ b/man/man5/core.5
@@ -154,6 +154,11 @@ A single % character.
 %c
 Core file size soft resource limit of crashing process (since Linux 2.6.24).
 .TP
+%C
+CPU the task ran on
+.\" commit 8603b6f58637ce196d68f7749633ea81af196d66
+(since Linux 6.2).
+.TP
 %d
 .\" Added in git commit 12a2b4b2241e318b4f6df31228e4272d2c2968a1
 Dump mode\[em]same as value returned by
@@ -179,6 +184,11 @@ Pathname of executable,
 with slashes (\[aq]/\[aq]) replaced by exclamation marks (\[aq]!\[aq])
 (since Linux 3.0).
 .TP
+%f
+Actual filename of executable, which may differ from %e
+.\" commit f38c85f1ba6902e4e2e2bf1b84edf065a904cdeb
+(since Linux 5.9).
+.TP
 %F
 PIDFD of dumped process
 .\" commit b5325b2a270fcaf7b2a9a0f23d422ca8a5a8bdea
-- 
2.47.3

