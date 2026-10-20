Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.212.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497112;
	b=mq0RNdPbEcZRAexzHfVi8yOWePZ4yfA3n+cGUQJEcneMu1qdS9LesDBiKovsG/PVoUuL
	 wTzC2lca/ekHghg0eyy/geKMmTmFn7a0dEGb8fdlEpIEASdRkaerKD1NyBQSjnQGvZaZK
	 YsRqiGxWeLCgVzoot1UgfG+iQe6ZSDEP3iVzSZhxZ/QcmxYFavxAyVlJq0zfNlFphzZI2
	 wqfcylUd5NWhyM2/cLMsLxgKq6AZTOLsnyOEAYJauT+/ZyzTGJUpf0vfTldHmnYLKKqZC
	 QutGHGiUBCO0z0MzaVtY5EVR1kd0C9+x9mShiEFcku6fOQR/bLBD0W079A7NxF1/ihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497112;
	h=Received:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L9Qsv4dhH6ZfPJz4f+Y5WskkVnknwGZZozCrhBzO/q0=;
	b=C98KZ3mwIh/d2+s/mJuDwX3wHt0v0RinN3AoGk+t/tRSZAvdir45IpEDT/YVGmH5/Myo
	 4Kx9JpVcK2Iu5O4GQTr3Vn89ftXkZTmdJq+NhGFHcVB0lDEuz/RvnF4bO8NLbVn8SakBA
	 rZhqiMQQdrs9HlOQ2IxlcuNa3/ncWPRAjrlkAmupSZiUoZnmagHkgm40L8F5mMLLumhgv
	 8Nqji6S361qv6bSJrkm6fjLtXs1rQLLvXEpKC1EDIcCEU7Ly9ZxxTYxRfoyYc1mVMe6n0
	 yYiiXkgLl6tVpKILMDy49YGOBEEZySDaFAsXAufSQa/hO31IH02Mc/pmeC0JiOoDYIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=inai.de;
	spf=pass smtp.mailfrom=inai.de;
	arc=none smtp.remote-ip=144.76.212.145
Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80027606A31D
	for <linux-man@vger.kernel.org>; Tue, 20 Oct 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 65534)
	id 33AE910183E23E; Tue, 20 Oct 2026 13:51:44 +0200 (CEST)
X-Spam-Level: 
Received: from a4.inai.de (a4.inai.de [IPv6:2a01:4f8:202:600a::a4])
	by a3.inai.de (Postfix) with ESMTP id 1310510182FCFD;
	Tue, 20 Oct 2026 13:51:44 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH] man/man3/getnameinfo.3: Mention behavior for AF_UNIX
Date: Tue, 20 Oct 2026 13:51:43 +0200
Message-ID: <20261020115143.75371-1-jengelh@inai.de>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jan Engelhardt <jengelh@inai.de>
---
 man/man3/getnameinfo.3 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man/man3/getnameinfo.3 b/man/man3/getnameinfo.3
index 7db812948..6c2a08275 100644
--- a/man/man3/getnameinfo.3
+++ b/man/man3/getnameinfo.3
@@ -121,6 +121,14 @@ cannot be determined.)
 If set, then the numeric form of the service address is returned.
 (When not set, this will still happen in case the service's name
 cannot be determined.)
+.P
+Behavior for passing other sockaddr types to getnameinfo is unspecified by
+POSIX.
+Portable programs should not expect any particular behavior.
+For e.g. AF_UNIX/sockaddr_un,
+many libc implementations fail such a call,
+some succeed but provide zero-length strings in \fIhost\fP and \fIserv\fP,
+and some fill these buffers with pseudo values.
 .SS Extensions to getnameinfo() for Internationalized Domain Names
 Starting with glibc 2.3.4,
 .BR getnameinfo ()
-- 
2.56.0

