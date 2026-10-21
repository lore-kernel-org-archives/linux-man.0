Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616900;
	b=wEc+4xaPZL4rKzalgTBMFJ9ghes9nXikRg0T+LM31mVu8ztSuq00Zm4Qf2D2umsjerXM
	 gbddiwOKcUKS4bibEWH61nJv07RLvxwMpCfjrvMpG6oSrfIc+cDEt2ulqzaomurgWjWlb
	 xn6oQUZi0O5GddO/DaVKtO8MaarMpvZVD3ErQ/XmKrQK5P4UrwGuh5R+l7CCknzh+bXLa
	 zo3eHX/1T5uXk+FI0m5hqKlp6qDNGg8Yd4mBgNqR1PJ+PmnJNNVfuTOboenKS5YQEY0bc
	 DLWmNQOg/V51R0YurzlzaHsjB4YuZMei/+tTnveqfIwvKCy0rJmkDqlC3yFngY6gRlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=nyEheIULVdaA8MehsV71HhJ3RQXcAP1XMho8od+3HeY=;
	b=caO2w6OOISZGiKS/adZOL9Mq1KioG2kvZxY0h/j68jxhp8wZo5no60jK78KbBQuV7738
	 f5qrihVN+iyCIQ8zGqI1DnQGEaxQ9QWrZ+lbOj+U9U1FbibFaVlXQODEdYZSr38Sz82kc
	 aJ0K5fOUyzyMrXH+XobdChnxtkSz74qLPOMOSrqO9gWEtXWbGw4oMW+SQR52ZL4thePvO
	 xBxcXP8w9ejnU2CKPWZk8vf07SCKdgBYMPI1peFWUiT1GZAo8PQPzz7BF5Vwby/UgdOhB
	 NVDRh8XMLiFuKLnzZ5WPaUiwHOMoaKeVlnvLzGtCbidNUaHakLpcn9Xw3autibSZwPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjz5iXIO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B29606A31B
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B29606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjz5iXIO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso199938f8f.1
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616899; x=1793221699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyEheIULVdaA8MehsV71HhJ3RQXcAP1XMho8od+3HeY=;
        b=Xjz5iXIOZW0JV+fLk28FP/j/aNYqA5QvTmry/N3B7fPAosFczsV82BlHP0u3hh5bLV
         730+dSLWTOwhlbtbHwoisAOFr2BXQrmz/g3yoJyCqGysirOFFcShQGKz4RqZNOHrw01E
         OaBImfM437xNSPlCXr9SG93V4GtdFi3i3Sipn7q13Wp6Ikntpd4RB3tfZtSRyx3Ct93J
         U/qptbfVh8HxZKiPlTWKc1rQ9D7k2oLfalM/ZiwZxjlay8gOv5+bdqG5teJQ77vvZMri
         mBY+jTqzYancP18II8iJu9Ug9BfqOE0QR9XJtBVboTt6i1nA9CYyPPMNwnmdMllcWeNO
         Xd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616899; x=1793221699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyEheIULVdaA8MehsV71HhJ3RQXcAP1XMho8od+3HeY=;
        b=a9SwcuMsBC+yIo/3DDT3oURHvKJ6+sh3F52L4+4arSoNu7JQMvW8mbV0AH5jRVSfYM
         wnN77/+wF6gKgRbLec4CTkqSshHFbHpUk3hx21o5CJDBdckQK6gCGAT2kVRf4NdUikui
         U4CgesdrHgWhzObcOak8bJQfmxo50QTLDgkDU0XuBwi0/JMSGcmLean/6YMC2v/PzlX4
         wOD/FO1wRrHxdKEbMaAiB+ekLF3w0ZmhFFz3IMJjKwQY2XRyBRb6VvNPuOBivxaA8wyp
         ti8nWlLHzbVgyeaIOO8lARXSZpIllzJEeAnierhRbpPjO9Wg2AoZL9peZrb+LlRwALxF
         V3tQ==
X-Gm-Message-State: AFq9FYIeH37iMc1qEd4XGQ5bHifIG2cA3TluIM07JIZtyW57pIvYdiGf
	fEH0SHnjnYmgJVVaDxH9+fjB6C5Ym37lAZm2YncnD/odZCS2Xyw+rsrvyzf4gZRJ
X-Gm-Gg: AYBFou0w/wysCQ+Lz4uZM4CZbJuHNZ6OZP0sU7M/42MeCS1k62KFr68pyP5Ly/j1beW
	K1fmMajzdNKtYSdRpEBT9JBHAmjODbmlN7KI3nk5WVeFPfnP5ftvsu7IH7YyImBwmoHnLpZpZQg
	1d43DYy1pbW68CKBL9oiUArCLQpyxuAY7z47v0OJ6MciKnB1Le8IG+MD3slXUd1J/zGjd6wr0t1
	zgm7gwETngYtGbF5yVzTVgjIyqMi0MfMoBrtzLhev+b5gqcyX3olDpauyxzrOxesZm4nLyT2jmw
	krRVe5c0CVtrlArJ200BXbQtnD1fPur3qnhkoIsWEqCna9ohru/9QzZdIAGFdSrbjYdIg5L9NIZ
	KzM71a7P1zUkPlmIZRken4Lalv23mwKz0gaGFfAuGOmDOVhXnBsGIhbeM22MQRu4M519bNV4Mxw
	voZq6fqmGuT+ncHofvKyBkd9LYjRcU05OrL7/e0Qa4kh8xGsk0Ad9P6LTfIK+fRzFcHc08S+FAY
	sWlOBYWlqKp9vLJczlSzhOVdZtJhtwwSo/+M1PGAHh9PlyVXp5Z6ZYchY01xT933hsWj/xrmW5w
	TTiXT7zdTtmTshqIM6j/6O55Uw==
X-Received: by 2002:a05:600c:2604:b0:4a2:5ef:1400 with SMTP id 5b1f17b1804b1-4a205ef14demr5480055e9.12.1792616898861;
        Wed, 21 Oct 2026 14:08:18 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e54sm8153036f8f.27.2026.10.21.14.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:18 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 2/8] man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
Date: Wed, 21 Oct 2026 23:07:54 +0200
Message-ID: <20261021210800.27338-4-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021210800.27338-2-gnoack3000@gmail.com>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
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
@@ -342,9 +342,9 @@ feature test macro to obtain the definition of that structure from
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

