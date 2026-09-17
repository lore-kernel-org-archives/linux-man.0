Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A1396597
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675102; cv=none; b=XzLTty4hMadtDYbO3ev1TdGPYT8Wad9I3R0VgVJJrUBIChfcryUtYZVyTu1H5UZUZXo2NbHZMt5/MObzAeuzJqSd1pBf3lW5l/JENsiTo9E53OKuM9CmeDoi2smqgr5qB/9zRVBpp3OUyOfLT8EAvNV3kwWJpkyyUh+AuT7LSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675102; c=relaxed/simple;
	bh=DaDCIV86FBGAC/rbkh2NHxD+1mLwmy1qZOR4tf9H114=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuezrDcjfA4I+GkzaXv+IsHKV7Pe8lBgum4z5l45Da6FI2jB3+Ljz2yvi8hV5pwbkpn3SCdXsfZvbMR1u804KnLr8et+7rjLWQd76hhf7hUP3YSSrKTai7iLmcSVLg/CoACAEncGhiuNmplClF7EQ5s+kTHDLFlH+Ggrk4DPyY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=eKUV9IZ1; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="eKUV9IZ1"
From: astian <astian@memeware.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789675094; bh=DaDCIV86FBGAC/rbkh2NHxD+1mLwmy1qZOR4tf9H114=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eKUV9IZ1IBsM6j3sK5aidEQ7uR5h+VJl+1Q6gR5HcbL7g4pMaOt8yqfprEfa68se1
	 12jnRBc+xswfODyuCrNNAtn/b8lRAMbkdSbz+v5fAJpfMP+FzGOGGukUjHcKZT4HPm
	 dYfHE3l2lngyk/g65a9lprWHWRQFSY+qmm/UPjaiaRRGJJU5LEn+6kBK0OvzI17mAk
	 CgTL5CxWVF1uK8a8VOQLFANAetjoGyhjiYglYu6gyikDIskQGf/Am+DsGoQxgppbUr
	 LauHXHb89NxuoWYqoCxN1TuQsTwqg3F6giZo+Y5gVIlIquy3zvXAFyntUi6ngz/BZm
	 t+GqL4OGZ7Pow==
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man <linux-man@vger.kernel.org>,
	astian <astian@memeware.net>
Subject: [PATCH v2] man/man2/ioperm.2: wfix
Date: Thu, 17 Sep 2026 19:57:28 +0000
Message-ID: <20260917195740.1380709-1-astian@memeware.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917062039.1365378-2-astian@memeware.net>
References: <20260917062039.1365378-2-astian@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: astian <astian@memeware.net>
---
 man/man2/ioperm.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
index e4a058164f6f..a0d7bcb1c99b 100644
--- a/man/man2/ioperm.2
+++ b/man/man2/ioperm.2
@@ -4,7 +4,7 @@
 .\"
 .TH ioperm 2 (date) "Linux man-pages (unreleased)"
 .SH NAME
-ioperm \- set port input/output permissions
+ioperm \- set I/O port permissions
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
-- 
2.55.0

