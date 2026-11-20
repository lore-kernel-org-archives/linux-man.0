Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191153;
	b=u+DcjQfL3LajRUK7gUQR8WU/68jyt5sFbMz7Lo1Sw8shgT2K4cXVU5aVopDaBt12oRiu
	 BGduy3je0tGCyC0uapY13Supudf0oC1EDzS0+7gt/AcmUaLPwVqLkN4Nir8PHpm+pdYq0
	 3rvp3YdBaGBoKF97hHolzvwj0B0WX+2dorsL+ntZxDBLiChXsQxvu8BIgyXAhexA91d/D
	 P/CnXXek/sHN9xGCFTi05UCxzeYEG+kSp+JSag1q03M7eAn2Zrt/rGXkDYHjKIdxmLGN1
	 737DwsmF7qMPjXfWm6gSVy5s7/KpD2VdJBbXqce6VlJ7NeILAZzZ4rqp1otoDE/WYfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hf1YBly9hBbmmseBnpg/JD4W/9wlsMQQ8anptyF2S9Q=;
	b=zlC4md0RBi44/WWScYZshlR6GiXuzZJWFN9PYB2A//SmTZVXlHx94PhHa2RHntv3soBW
	 WYX4QmPYuN8dszz1CyFTXZ9qL/XStVdbwJrxxxObbEv8YVFB7JmAVSTOIcveE6MZCVhKi
	 XqUSFcq+qWQ+uCJtPdOaLI4Ns1sTLrnczKqph5QLWu15NjxqparxUjcdJlKTsHH08JEVI
	 tJGqCzGepdwG3AnmAbzQkCVrYCILUF+/NSVeiiuIzr3CK4ZqNU7WTYnotgmHDJtbiNFkH
	 kx7lzUjkKB3nf2DNadoauw/QlnkueS89rY5JuPKiqnoFpEKEbwmt9a4WRgJ0OPFJMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/tYJqLu";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBF606A331
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 16:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEBF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/tYJqLu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso10041835e9.3
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 08:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191152; x=1795795952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hf1YBly9hBbmmseBnpg/JD4W/9wlsMQQ8anptyF2S9Q=;
        b=I/tYJqLuwbw+i6yoR5XgyIxrPVxEAYfHUnVtngtgKWn/xj7WlaQDEvNPWZ/EtMlaWe
         kx0cE4Z7s5jSI6olONe+FhAVDbO4aBDkB6I5cHqcauWXifMUUpd9v2crZJ3DINzs1N83
         w5E5R5kz47dNjhSWnCOQpqVkZqfaEcAzb5trfKzpilfKDBttE2eK1akcsdLbS03b4I9T
         xvfuIGHWlkjOwqj+YBZZ4GlglZdst8kttpwwhYXnxjPY0p5OdXttPqIqyOfmTNrH++Tl
         djTvc0f2LzqmaBzVak1eLJ3cnaUxcpkC34p0KT97gp+1mJGXGQpGHoUUpOOqM5AKBCwJ
         0S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191152; x=1795795952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hf1YBly9hBbmmseBnpg/JD4W/9wlsMQQ8anptyF2S9Q=;
        b=2kmBI9r8QBn5YKHGyHXEJOVxenMk1m2mR//y7SWl+F3ISssf2r5clzrbQPUQw8nMAb
         ppE6MiBJCkxC69SmAwxXUOWCK2vZdlx8YUYS96RjGgVaiytNS6ZmwvLf4O/TwtR/iLs7
         lz5Wh4jCLYS/9sL+D807HmhHpBAV/C7BWA/RjHzauTTzFfw5Gc5mC4zR2XiCv8jHrA+E
         F3yOgrK5ZbUzbss0bUKzupQGu3BiQ+PymmzHD6AEv2HOHz3mirhhfSvuDcVHrzpzRqfQ
         IZr7iGpCaEl2dLhBFedQt4NqJT0Xazpo2A6b/m+pJFRcUqfw+adbZ2Ak39N9PbySTZoe
         H0wQ==
X-Forwarded-Encrypted: i=1; AL+hErGcD7TPhAxDuM++/cAc3GM7qniZ3wyArgO25DisJwDQDq8f1NkgzqYOJogO40wUBKlngUKanGMs4Xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yR9zLhtBGAAfu/gz9XUcBUyqVieXQiFQ6F+rJ1Iknhc18tHx5
	pcTxgt2EeHVALg/BFgD1/MW2kBHydOt401S+vM/GraLzLHOlXe4hoFAa
X-Gm-Gg: AYBFou06n2zI7T6yjh94INshxxQ7g+ehyIrcPe+1bFMxeQW3o7Nu3WBWE581/suAnnd
	CDEvXquMw0MAf9C4jC5foV6a/upfVvnfbDk5/ZMZC+xSCRK+pxWGdnlm8HJ5hsOqmALA/6mlrGk
	7H1ooTGV4uNo7xlKwi36kmpkDtEhgc7xmrroMr7EFyJCltEP+jfw0BcDCTvgtB56or7YidP7Ztz
	n3DV8EIR4Ww1gkFt87KjDTeGygI+76i1dZ4P36XFWAM8DxoBOAsXsXDa7pQSJC2GVZhm99QLAJ2
	dTGSXVatKEpeITp737K1iii8rPQGS0fDHkwZKfyFMUnsWzRdaWVb4Z9ec3WjMXoBGUNqxIwoBJO
	AIJtT5TGEjsx3TBKzWP4CD4tV1kXiuCB/u9/+E/49aUMcr/9ffYc/6DW+ayNTebH2C9LmvwikQq
	Rvd2k+wQZLqs2KabBIhvPEQSz8ccFCAJaxxGSXp1egVrngHRDFm2X4Svgbo4JUfKMtforAqJPv3
	tDDV7FaW4oi/NABGW0NMvczLUV9GL8Xs7G8cOfeZ4T7Wfy1K56QfEPGIzudER//gBBGsYyTXt98
	JuG3vL0U6H2dnXx/RCZtGPX6kQbtL/N9mCQPinQ/LxLPYPWOo5OzEw==
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr75608495e9.9.1795191151818;
        Fri, 20 Nov 2026 08:12:31 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm136928155e9.11.2026.11.20.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:31 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH v3 5/5] man/man7/unix.7: Remove mentions of "namespace" in the general sense
Date: Fri, 20 Nov 2026 17:12:02 +0100
Message-ID: <20261120161202.27163-6-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120161202.27163-1-gnoack3000@gmail.com>
References: <20261120161202.27163-1-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In unix(7), the word "namespace" is often used in the general sense of
the word, which becomes confusing now that the man page also discusses
its interaction with the Linux namespace concept (see namespaces(7)).

Remove the remaining uses of the word "namespace" in the places where
it is not referring to Linux namespaces.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 0f014fcb1c40..f81611fa2523 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -24,8 +24,8 @@ .SH DESCRIPTION
 efficiently.
 Traditionally, UNIX domain sockets can be either unnamed,
 or bound to a filesystem pathname (marked as being of type socket).
-Linux also supports an abstract namespace which is independent of the
-filesystem.
+Linux also supports an abstract socket addressing scheme,
+which is independent of the filesystem.
 .P
 Valid socket types in the UNIX domain are:
 .BR SOCK_STREAM ,
@@ -135,7 +135,7 @@ .SS Address format
 by the fact that
 .I sun_path[0]
 is a null byte (\[aq]\[rs]0\[aq]).
-The socket's address in this namespace is given by the additional
+The socket's address is given by the additional
 bytes in
 .I sun_path
 that are covered by the specified length of the address structure.
@@ -297,7 +297,7 @@ .SS Socket options
 ancillary data.
 .IP
 When this option is set on a socket that is not bound to an address,
-the socket is autobound to a unique name in the abstract namespace
+the socket is autobound to a unique abstract socket name
 when
 .BR connect (2)
 or
@@ -323,7 +323,7 @@ .SS Socket options
 As with
 .BR SO_PASSCRED ,
 when this option is set on a socket that is not bound to an address,
-the socket is autobound to a unique name in the abstract namespace
+the socket is autobound to a unique abstract socket name
 when
 .BR connect (2)
 or
@@ -978,7 +978,7 @@ .SH ERRORS
 See the appropriate manual pages for more information.
 .SH VERSIONS
 .B SCM_CREDENTIALS
-and the abstract namespace were introduced with Linux 2.2 and should not
+and abstract sockets were introduced with Linux 2.2 and should not
 be used in portable programs.
 (Some BSD-derived systems also support credential passing,
 but the implementation details differ.)
-- 
2.56.1

