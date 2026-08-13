Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7CD48CD57
	for <linux-man@vger.kernel.org>; Thu, 13 Aug 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637207; cv=none; b=YGW6VDNAs1HHEUrsXe5v64T+wHrHMc3pleTI2IrEgAmXg0eSByQ0eAOyvdIK06pWWmMwy9N+5gNGYBeTE1a7C7TJ2wkpiAlAf48XYfCNGgwmNX35P4YumYJaV4/nMq/kYb8uFRl9y0nwEpo30I4IzeuaUODysoeuVHzFEb7SZ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637207; c=relaxed/simple;
	bh=lC+1DYAV00O1LwBL0CZ7to5DPwFC+wzrPcawLxVe/W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C8bWraaWDf9bU609ZiqgU3Znz/GXMex6/H3BDNDYzCW/br+U7wmUZ4ekDw21pSZjVXg9RSj1G7YhXpAg3DEIE0IcqfX/s880yXUBJXLD6B6Vn7bsFUNoOzUn0g+Ir0T3CeAUUGV+4RHnVdg/i0Lw+h/9pufws9KuwZXW3Vfo4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=E6bGGMMp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="E6bGGMMp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=o8pZ1TeiWblHUZxGkSugyhSedeE1+yWjrSfKd+cAL+k=; b=E6bGGMMpc7ZKXCYHfcUu+H3QyC
	ePmVv5hlOPqCXEmfJ39fmN3sDAWqzW1nzYoWZ62LRaXesCwIZ+3Fn2KJoYSvo5SK/cUrTH3iOTXuT
	JMgdNY1N66B5XjeqlscelwOj2ngYKs1Uch9gkp4JnDmMv/Tke1aCmERH2zkbjwpO8ftQy3obiYxtF
	EGH5LeXBqePJJTYYmGijMz7N3ILaO5GHdFKd3IYbDbn+2/xPCHrpPRcajf9sJ6Rd93dg96KhR37nj
	x1EfO7M/Yo3GFk+5dh/RIz21WyldVSvWKdm0NBQgIzc3+lIujkZt55aCGysob6pYtLFhTMmIWHqdx
	sZwMGGZQ==;
Received: from [177.139.22.20] (helo=computador)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wuXwx-000uko-IO; Thu, 13 Aug 2026 18:06:35 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH] man/man2/futex_waitv.2: Fix example compilation
Date: Thu, 13 Aug 2026 13:06:19 -0300
Message-ID: <20260813160619.52416-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The example doesn't compile because it calls the undefined function
my_futex_wait_private(), which should be my_futex_wake_private().

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 man/man2/futex_waitv.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/futex_waitv.2 b/man/man2/futex_waitv.2
index 9dfad84ce..4158f297d 100644
--- a/man/man2/futex_waitv.2
+++ b/man/man2/futex_waitv.2
@@ -352,7 +352,7 @@ worker(void *arg)
 \&
 	usleep(*futex * 10000);
 	*futex *= 2;
-	my_futex_wait_private(futex, 1);
+	my_futex_wake_private(futex, 1);
 	return NULL;
 }
 \&
-- 
2.55.0

