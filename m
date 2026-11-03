Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737319;
	b=Dbdv59MlAp6lJmDE1g0jP+ZNXlFC6tOCLj8X4/cG1bEVUhj5W/9kn4otf25PlMvC2yv0
	 MBxWHoqzyh7XlqJFwKNeesYlaOmTlOmuk/QkSLcMu3yeSJCctlzA3lBAulYKUHtLH4RoT
	 juXI4GnAMtfe9aQUPzHqQD31VRV7RLqyBilFrqjqnABf5txe8K0KVhGRf5k2VJUVEk2kP
	 3/QdY5guaFd0Ct71nP+m65baliGl4qfwC0Eo57p4AL3qO8CJXbwrdHibZzrFrbWyZihOw
	 b3vywpq25/u7YsKTpdm88f97ewWBDijgmtHEd3lCJIGpICmsorTTojr3WKKX5N8Q6Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GtSEiWAJO/Jb9xSEbdp+FXjmXbKwGcE0wXPgh3UZ5PQ=;
	b=4ZRvahbUZYgcGGElmZwiO8lCCk8NXjSEsJah8RTJKOLtkRd8/EkangFGCizW2XdYGgyd
	 JNNEYzxvvEozfWz8kgGZsCRay+fGzoBfqRrq1WzCv13nc6/eh9wwsYPAWc1qH9ijV9EPk
	 kI8vaiZnONvx0DSK+hFeEVcVN1WOG1jeoZkFcmPoD63Y+b9k289EmmrlWo/QxCLHxgB91
	 btpmzTB0i4IReCPxLBjmWJNMJ71UThF0Pi0btieNPIDOYmB2fhvEt37KoExx3ngy9F+0n
	 yHrXSDpsnl1CWYINTqcKqPAXHIyXdW/5e5s7FbQMAMpTECxpYzBdF6qrZklxGq5cxug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n+DAY/Jq";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBCE606A328
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBCE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+DAY/Jq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso46267545e9.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737318; x=1794342118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GtSEiWAJO/Jb9xSEbdp+FXjmXbKwGcE0wXPgh3UZ5PQ=;
        b=n+DAY/JqyX072UcsUU46qoYxCahpN0Fz8+klstcE4T9Q+iQ25Su8Q7Y5rG7j8SbagD
         abzgK/mPWKZQusoNbxFlqWxgE/d7By4dCZM6FowU3JD17xcfjRYqgaleklmEtdEzaUSZ
         Gv69pWbUicLvROzBW3en+F8n1XrijKbUPBQPLAYXBK7j7c362X2Jrxo8CLNjQmT5sF+I
         LwM/qfaAvMm83FiPfyG9cbIGyzaFhTE/yt73lpUWcK6spccRmL8OuGNv0UffEe9UkjBv
         cg7EDEf4H82KfQmfmiJQOZDYpEdLmeH0ooqd7Ci/HdOZfsKuKl9/YikbVBha37opR+6i
         Cy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737318; x=1794342118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtSEiWAJO/Jb9xSEbdp+FXjmXbKwGcE0wXPgh3UZ5PQ=;
        b=LnWhDcpQ+HZza6xMGtd7RH92q3/IxNd04nJJCkClwAzaF69jQTvGh5a26ux6DK6xvp
         M76fciE4JfoGvneK8F+8CXP0Ibi8c8902C+7IeAuLsJWSpsvgcEVS/5nvQYSqh3hljoa
         wtu2hWUcKNk4n0iJMtOMh+qk1XQcClqcy8s2GFqh42QfP2Ixf+x3DV2mVICQk9wXGLVg
         5MSxys/yvLwm2LyG0MErNvlpToZNY/iI7UhcxoYNts1Xe7tH4nQ0eONJ4RTASqIZMH+4
         BfOh3+950f9TtvWKLSXMju/jZc89I/eHZYT6Wsqi9BaNPCE8d1ptCU7hQdSPNJizSS4P
         VfdA==
X-Forwarded-Encrypted: i=1; AKwUvBw1gfHA4xRvQQKdyLh/ZYstlNpU22ogia/9nt922EIsLXICbHvcuV6y/8U+PozMq0IySU4LNUpmc0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fkh5p9AL/kFB/oqPccxPEOdV5Ovdk/cDH7n7UrstSPL/hPGn0
	7eNAkeBpaWfR27D6WSyrHVbe1eCHZNVg5M+Os+9CweSl0fRyTu/x5u5p
X-Gm-Gg: AYBFou0LCkoKzBlrr2b1eglvptdvgGmBQxIzZMjPzw6y6Bo/q8qyUgHrYL5PPRxfpXP
	SEc508YVwbLxTgA66nmJOdLvnCNZuRV4iG7d87gHA+2+jlopn2PCjlHrRJCATVOEtoO4rMzj6fj
	Bb+TO+ACAkNcaNtp6SH3kqFGOd9Ihb4xn6hVMLhJKaiaFqp5QzWW+rNL+4wqjrQCZnYcjfHV5/U
	zm0lgEF5KfV7/pL81kqbiCmLx1GwFU0hjj9TL9hK2VoHTpJg4NZ12LaZB+0bNWfHCL+mKiAmVgX
	MMMRNo7eBR+UTkABYM0ksy30Cu/oGgcLars88KspNBxRk4ZvNHsf0CByXudAT56HOVhVQ2Y5k2E
	4rOsDCgu/sD5I+nkRNOwwIxA+h4gVVYFFjeYJKU/UUwsjSpchM93BBqWPSWrfeOwc0qDFLUCAKX
	CKTE8lH7GB9WHMLsqF2z4tLkIKa6xzSnl7t4syED8l1BMQL0wS6AYXvK4qa74iGFcRwDjx878es
	enWwv2eJsqcbMDS9ZEIds68Y+G+BnglbBR8De0Tr52phZYAgbjG74cUCRIQ31dPyxWQiswfXykH
	FoX9fBW3U0zCjtetk1x/NGM3Hqj9MzbUUP6EQ7a/RSpjVa3XziDwHQ==
X-Received: by 2002:a05:600c:4e48:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4ac183d16eemr309299185e9.23.1793737317637;
        Tue, 03 Nov 2026 12:21:57 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b91esm77290865e9.11.2026.11.03.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:21:57 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH v2 2/6] man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
Date: Tue,  3 Nov 2026 21:21:32 +0100
Message-ID: <20261103202136.13574-3-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202136.13574-1-gnoack3000@gmail.com>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
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

SOCK_SEQPACKET sockets use unix_stream_connect() as their connect
operation (as defined in the ops structure unix_seqpacket_ops in
linux.git net/unix/af_unix.c).  That function records the peer
credentials for both ends for later lookup.

unix_socketpair() records them for socket pairs of every type.

Connected SOCK_DGRAM sockets (unix_dgram_connect()) still don't record
peer credentials, so those remain excluded.

In the code, the function that initializes the peercred is
init_peercred()/update_peercred().

Fixes: 73b3a5686084 (2005-08-16; "Clarified details of use of SO_PEERCRED.")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code.
    
    The unix(7) SOCK_SEQPACKET socket type is also connection-oriented and
    shares the "connect" logic with SOCK_STREAM sockets.

 man/man7/unix.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 1054d7f52a30..d0c1765dfd79 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -342,9 +342,9 @@ .SS Socket options
 .IP
 The use of this option is possible only for connected
 .B AF_UNIX
-stream sockets and for
+stream and sequenced-packet sockets, and for
 .B AF_UNIX
-stream and datagram socket pairs created using
+socket pairs created using
 .BR socketpair (2).
 .\"
 .SS Autobind feature
-- 
2.56.0

