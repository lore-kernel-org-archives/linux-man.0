Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902421B4223
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 04:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778907459; cv=none; b=JIzz7YIdBUePzGUDFVgcEOS6SkYmd26UDpMxQoMR3jxs+62eiqmctcHch7zxrCnxA5qkfb8bJ9DEqrFpcQYcVAc2nNznOsc22XuVbz/ZK/4vtXz6VRzImmPGfpk+eTR7gaMYoUJrwz4LOcFHT+IBPkcuHa74mW2h+dZ0ozHfbfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778907459; c=relaxed/simple;
	bh=RAWrt2ESpef7+yXNnaSmwuXVihtuLjccNsk9VcWVjQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSaTH5jr20/+FBeXx+wZh4EQIMQmTHqXOREiT+bTyh0pMN6dHCKpW0MI/2AyfwvRkQRffBiPtIfsyEKXG5PsPe4K5yCt+TgVfySyKssO9+Z1UzRnK6kFvYgQ0fiA7WbXsCKYVvNZRID1GZ4QFT6aZGtCK90qmeUTxASIe3+kU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=disroot.org; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C3B2526F66;
	Sat, 16 May 2026 06:57:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMZIyJ5bYPb6; Sat, 16 May 2026 06:57:34 +0200 (CEST)
Date: Sat, 16 May 2026 05:57:31 +0100
From: funsafemath <funsafemath@proton.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH] man/man2const/PAGEMAP_SCAN.2const: fix typo
Message-ID: <agf5NqqQzWRde7IR@nix-mail>
X-Developer-Signature: v=1; a=openpgp-sha256; l=532; i=funsafemath@proton.me;
 h=from:subject; bh=RAWrt2ESpef7+yXNnaSmwuXVihtuLjccNsk9VcWVjQI=;
 b=owGbwMvMwCV2QvA6L+scLT/G02pJDFns6/8ttzVbF6nGM1Wk4LOmwIvmeD/T52+Lwzt+/atyC
 Mvbr27VUcrCIMbFICumyCKx8I6vlK76Z/vPqaowc1iZQIYwcHEKwERY/jIy3OEyDQlbaTbV19Rx
 /idNt52Gv9/e7XT2lEwpb1185OEmYUaGA9ffla+/UGNuXSCbezB5W/tjb9bZ4eyaSaeNGmau3Zz
 GCgA=
X-Developer-Key: i=funsafemath@proton.me; a=openpgp;
 fpr=B07EE98D22F23DFB077429C0DF66F4774CE714D5
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: funsafemath <funsafemath@proton.me>
---
 man/man2const/PAGEMAP_SCAN.2const | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2const/PAGEMAP_SCAN.2const b/man/man2const/PAGEMAP_SCAN.2const
index ed2f6b72a..ff6436ec0 100644
--- a/man/man2const/PAGEMAP_SCAN.2const
+++ b/man/man2const/PAGEMAP_SCAN.2const
@@ -197,7 +197,7 @@ .SH ERRORS
 No memory is available.
 .TP
 .B EINTR
-Fetal signal is pending.
+Fatal signal is pending.
 .SH STANDARDS
 Linux.
 .SH HISTORY
-- 
2.52.0

