Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACCC3033D8
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626139; cv=none; b=BWD6LjqoUjC80J8Xh/wpmM+34z+j+IUWODfvc3fDGmIspTB8pjlWSXvS44fTXGTT2PmPkjPOzH/H7UOMftwIBP06WycITuC59ZVhaj7NjvHeNg2JJDV99R57MoopDj8ZI/m/pcZEjMp3wigwT1oYshsp2H/bjxNoFCdHWvE/lqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626139; c=relaxed/simple;
	bh=OhMH6YZ+IFDVnMi/uQ2bTaiYCpPYlkuWS0o/eURzMNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jptasmPxgxwOo6A2jPJByP+wVYEIVh8OvK1yXKcWqK6XMFGIyCp5dwhP06+tTMKszKXWfMv/tGBXFybaNLFoRIiv9U4xo37xCY3wcr25Rs9rDLAa52ReOM20JYr5MG7A0YLqUmnqLT20oUs6KntsbMeUeIHbCMLJXqEgykjUXfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=KaaXnQor; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="KaaXnQor"
From: astian <astian@memeware.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789626125; bh=OhMH6YZ+IFDVnMi/uQ2bTaiYCpPYlkuWS0o/eURzMNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KaaXnQorJz6F7nCVawOKLlldbHaM/pbAeKfbBuemd0LtMLfbc/gnqrDskWKM7DFzE
	 fJOCTQ5h7WDl/QlBMeFPzWE3hRrGaI1HmP9zxMrKOpPJo2xKNdxk3FC939iROw2Anl
	 Zr4IuDR6sGD+XZiKTVOaIh+l+KTwhvcHxB4DTEDvNk6eV71E3hqnUtpJ1p0/nz5w9B
	 ysaAF/HGFDOh1uly6sKmpPki5rel6NOOGoW9WFAwmoKkubesh+7r5ex2tGNN1RYbnj
	 XDzEBlC9qSFctq3u9ZYNj3iYl2yhPpF93XU/NHiddjoezyvNYEn5aEPzYCPFZ+r+Ju
	 f7F6368XcvRdg==
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man <linux-man@vger.kernel.org>,
	astian <astian@memeware.net>
Subject: [PATCH 1/2] man/man2/ioperm.2: Reword slightly for clarity
Date: Thu, 17 Sep 2026 06:16:00 +0000
Message-ID: <20260917062039.1365378-1-astian@memeware.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqXOgqne-v4GtglY@devuan>
References: <aqXOgqne-v4GtglY@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unexplained mention of "bits" (implicit reference to a
kernel-maintained permissions bitmap) with "ports".

Link: <https://lore.kernel.org/linux-man/aqfsMbQWdqq_TG_b@devuan/T/>
Signed-off-by: astian <astian@memeware.net>
---
Didn't address your questions about general arch support and the
EIO/ENOSYS on PowerPC.

 man/man2/ioperm.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
index cb2c48652b5d..e4a058164f6f 100644
--- a/man/man2/ioperm.2
+++ b/man/man2/ioperm.2
@@ -16,13 +16,13 @@ .SH SYNOPSIS
 .fi
 .SH DESCRIPTION
 .BR ioperm ()
-sets the port access permission bits for the calling thread for
+sets the calling thread's access permission for
 .I num
-bits starting from port address
+ports starting from port address
 .IR from .
 If
 .I turn_on
-is nonzero, then permission for the specified bits is enabled;
+is nonzero, then permission for the specified ports is enabled;
 otherwise it is disabled.
 If
 .I turn_on
-- 
2.55.0

