Received: from mail-108-mta227.mxroute.com (mail-108-mta227.mxroute.com [136.175.108.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68A40B36D
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207051; cv=none; b=XcZcZ5AFjl62noLq+/iAfPhf0Ma15bdrDeYfdFK1nh0OM/9dIvVkGm7CymdM+F9K6Tx4riq3e5Ok6og9Zvcq3SRTXQyydMYj+3pglmQiEgqASjDDOlyrRl9mVEA9djiR7A2opX9isUNfG8HOEXnE6VNZHkxX8PXovaJT8fSs38Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207051; c=relaxed/simple;
	bh=5aJenh6clDffb1zQdMduGOCCajb5ly5bfQXh5VlAHsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1DBBkeu3GBO5L/AJgkUepk/2tBwvr5wTXThcfNu2JAjq4jmt6lezvwNIAx3EsK5HnwSfhmJbQKQ2L3SaHqNdCTfYtAC3fy7/GDI0CKZ+/JfpY+SDIzVaE0gmzO2/6zbDV+nwk/PQeFMhR1wLQNurgSwP1aX/yp97E8kgfCOYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com; spf=pass smtp.mailfrom=trevorgross.com; dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b=DOxu/WlZ; arc=none smtp.client-ip=136.175.108.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b="DOxu/WlZ"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta227.mxroute.com (ZoneMTA) with ESMTPSA id 1a0d0a2fd7000028b2.004
 for <linux-man@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 23:38:57 +0000
X-Zone-Loop: 7a38b1fa2a2354e5b45dd2931cb19079f72be9ab081e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=trevorgross.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+OvcULhoky8QbMdBwGBDHKLK2JV2lvhrcpNgbX1xy4c=; b=DOxu/WlZVc2ZFeQQfPJVTKeTK0
	Twt3ePGlOgVCOHtVh9RgbUFtUQ2k+77ffHsHc5Emvf2G0HVDFfbjobIquxHG785zb1oU0UJYxZH50
	BIUwfgOdFSfKaeTHoS8gQ6DQ4G4gcpyDgyB5JRg+iRNU9F4LR4W95px3Fs1WrgTo7fBZXaT3vYG+g
	CE7sNkYRwpTVrqWWO6Su2oJyvmgoixfgbLUl9rb+wy9PfQN6VxUU2VauoHdsjgTKvA76RO1boFurz
	EKwWAU7Hn8g223WzeSgplOEdYrEsWXRzJncqSneRdHDFnEX/YqmfQrcItSRt0H3qj5o6iv9ofTBhR
	aBAT4DtA==;
From: Trevor Gross <tg@trevorgross.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	libc-alpha@sourceware.org,
	musl@lists.openwall.com,
	Trevor Gross <tg@trevorgross.com>
Subject: [PATCH 2/2] man/man2/fork.2: Document glibc and musl relaxed fork->exec AS requirements
Date: Wed, 23 Sep 2026 23:38:19 +0000
Message-ID: <20260923233818.25289-3-tg@trevorgross.com>
In-Reply-To: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: tg@trevorgross.com

Link: https://lore.kernel.org/linux-man/20260923013428.GT23438@brightrain.aerifal.cx/ [1]
Link: https://git.musl-libc.org/cgit/musl/commit/?id=167390f05564e0a4d3fcb4329377fd7743267560
Signed-off-by: Trevor Gross <tg@trevorgross.com>
---
 man/man2/fork.2 | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/man/man2/fork.2 b/man/man2/fork.2
index fc78f786b..336c17448 100644
--- a/man/man2/fork.2
+++ b/man/man2/fork.2
@@ -147,10 +147,17 @@ may be helpful for dealing with problems that this can cause.
 After a
 .BR fork ()
 in a multithreaded program,
-the child can safely call only async-signal-safe functions (see
+POSIX specifies that the child can safely call only async-signal-safe
+functions (see
 .BR signal\-safety (7))
-until such time as it calls
+until it calls
 .BR execve (2).
+On glibc and musl libc, this is relaxed;
+it is safe to call non-async-signal-safe functions in the time between
+.BR fork ()
+and
+.BR exec ()
+\&.
 .IP \[bu]
 The child inherits copies of the parent's set of open file descriptors.
 Each file descriptor in the child refers to the same
-- 
2.50.1 (Apple Git-155)

