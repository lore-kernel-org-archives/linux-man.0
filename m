Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8430C299A82
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626161; cv=none; b=ml30RyCeiYA7oZjTdLrhF61uU/pQMMoIOLkMl+3fp7rVprVoXqaSNhU2Ys1xz+PQZUUSw1DgvyajWoULYk8oyIdJqcNgFC+NjfoY5CozQy3TxcyjwjmfsogYcgK3LaOmbcdWFlcWlAdj/jdca774pHTfMfnaci4Sg3428HAOX9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626161; c=relaxed/simple;
	bh=WIpL9CyOkJ8LdEJNdpRn9LLnObXKtv28KRGDXR4SHT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeK+JvSTxtyqewyuwI/mU+mVmTQ4ZDhkae7i+F6YO81aOGqsF3QGU/BsHCTI5dIilvcKSWM7pO5Mf7Pxv8fIpNcSFlnhODeiOqskHjGv7UjYYiMt6IcPgVBYrM1v+KI5occNi1lchfByt+DBnf62H0g8totfm301MRQs2/lV5AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=0fDQySo4; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="0fDQySo4"
From: astian <astian@memeware.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789626156; bh=WIpL9CyOkJ8LdEJNdpRn9LLnObXKtv28KRGDXR4SHT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0fDQySo46vRmtFKGZZxfraAIvZsOHYlIsayrslSQTspuO1MjLfD3y4ZGeM1k8UVoX
	 Y5yUMh1NPfx1yDc3+JKgTb0f9lM+MXU9tIExa/7zXFN7Go4LDQAT+cw5W+lchjg58d
	 JTw1G/pIiJV3pesVrmW125a+R8sNm+B6E6hyPgd+d0BbViqsvvsYoiMlsyJ/u2FxZX
	 cF03UkRERK9WeFXjnI1Q8doPdRYplupuWXlQi3ZWoSWfW+ekwYojXcnkj1PHZCZQsA
	 sVoYG6/ajXpcWFt5YlKaOXs5BghFHcCRh/zCK5uE4N/5ZjVT/5uAZO2gJL/C7Vhidy
	 qNRu1pUpvmIRg==
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man <linux-man@vger.kernel.org>,
	astian <astian@memeware.net>
Subject: [PATCH 2/2] man/man2/ioperm.2: wfix
Date: Thu, 17 Sep 2026 06:16:01 +0000
Message-ID: <20260917062039.1365378-2-astian@memeware.net>
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

Signed-off-by: astian <astian@memeware.net>
---
 man/man2/ioperm.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
index e4a058164f6f..9b9aaf3840e2 100644
--- a/man/man2/ioperm.2
+++ b/man/man2/ioperm.2
@@ -4,7 +4,7 @@
 .\"
 .TH ioperm 2 (date) "Linux man-pages (unreleased)"
 .SH NAME
-ioperm \- set port input/output permissions
+ioperm \- set input/output port permissions
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
-- 
2.55.0

