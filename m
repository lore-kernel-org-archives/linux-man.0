Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181159;
	b=uhL6/ZBtYmKx5JD46VS3QcoazpNXmI4iX0otUI3NQCo/LaMmuV/DW3uRA6JAJeoegRrS
	 6b0xAU6lGXuPPMd7ZNX6CdNTuVr+lFgKAB58cL2XOABzW8Oshc0ynb+nLubCN+9WjiDFW
	 d58YRrtygQseM2hvl/GwboxDAj71KKx4kHEfP9XR8wIcskwNlS1NyV7kY4J2/3KuoZQio
	 3sKWbsjUp+9XSkoEZ2nxcTbGb2PJFxN6ReXiS0DKufaPcBMgm3ZkvoZjnT1engnq5fUPG
	 fwPXQ/t7LAOgwH8xRiT0HK3ljNf9B33Ok4oISyWuccVn9jBVg9gBnAoAwAE+JtC+PBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uG4A/Zdt5W0lBThcQzNxmdvJZS1eY1IFBFK/WOZ0kSU=;
	b=Sxs8r4tWsh/HmuR34LFuvIe6Qo6YawLrYK+Uoy8KytoFeff6sL1U6jQO4MSK0pNc6xgQ
	 SIrC8AjtSR6izPuhsrfLufkTpmjFcjrofGtbmiM4OerOVXHon0BHhs/WE6lQZViV6G1FP
	 L6JZDO+HO2lvUHjYXj4wskxZJkZpPsxaYm+W9UKmBl9QEpGNHaueCeGqvB/zBI/uxVzc0
	 ZqXcOBHLSt8K9DA91EvYJIwH1Dur/OxhxikIx88pVzLPzKcecp6gX4TivVmqTxT2jzFAv
	 A4mJj4RZr+cTnphFb+8h64bQdgmFvsTx+9dTGVLIqWwC+4ZoSr58cWvI7hMvTrLLacg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qg4GmelK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80388606A339
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 13:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80388606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qg4GmelK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so7766915e9.1
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 05:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181158; x=1795785958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uG4A/Zdt5W0lBThcQzNxmdvJZS1eY1IFBFK/WOZ0kSU=;
        b=Qg4GmelKxdvPyOtAr8CRa3isJO4RCDPwzba//qU/j0p0StRJwZtuSQjUaVxCAMpieS
         XgL1FzIPw26u5+qH8vtvUImRgd6O7HQqhC3/wmYFKy160rQQmTNmyrAqiXIuPCXZEPWl
         vlSc8+ZQykcQJAdSm3mpwuLTRuwl3WOA7N3XG2ufDv6ERCwLhcX3tCEnZSdedmdd7mNp
         elOmeDWLQaVFfqGTEZlvSca93/BjingKjrIEIZY6IjZ8uiE5kVamM/SKURzwhUqW18e4
         1vm9gpTvyk7cKAGy+227xiWpR+vw6DvGc4ZP3hxrzbwZv0g2kzfOSyaGyNGveEzC3+Yu
         VP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181158; x=1795785958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uG4A/Zdt5W0lBThcQzNxmdvJZS1eY1IFBFK/WOZ0kSU=;
        b=1K6ftf5Cfgx3+yYLwH3SKaGgqtKX7uxfq5Vg+QJd6alZKolgr4O1JkDDzxSPisX8bK
         kJiKdUlSVweda2nXiJJKivf0GZzwpoQWbQsj/yvZakdD7tlyNDOv11jQikPI8N8+uiZH
         FO3sOgaKv0QuaNZ2ni16i7B3qBNvDUT7aomvvtR9n1YcQXyFK3RIAkFsyQ4R2URjPoWX
         7FtIuBqdMNf+Okr+elbtryZs/5LeFBHyGpq6oemNcopopKirBplcPPeu5xOz7sGW2/dQ
         G5JUOSi51SLct7ElBmgW6HKv57za8QcOUqWLBWH68qgTj6G2joRkbAoXbF10oPiPGB6B
         t28Q==
X-Forwarded-Encrypted: i=1; AL+hErE5PKxOIj1N7XyApGL7H4Z+Gubbz1yZC8vcedhegjwXKtsSc5Y6kYM3FNXGZiFKooDfEDtHY+2PkfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TjMS+kUkhNoXCDh+Nat7v+CSLz/HA91NdaoRNsYF0T/WkBJ45
	oSKJrSuuCBeCKTrIVzDxLevemx/n3FT3tAPhzBiroMcH26vWl8enP0/T6rD0bRNF
X-Gm-Gg: AYBFou0NGiB2rHYwGkTk36ZkaBXlR73yY8m6xACYOBi7SUPa702F4zUPTn04JKvjIM/
	TTRAopQLaI2YVdnPEZ58DG5Fcm54OOK5eBeP/cV5y1UDgtL1YozxHG8laBwefGxCdX0x+Y/0vYl
	DrhS1WueRNjFyqExZv7vZIUdDy+Chhjecyh3UHXCZvRhfZvgV3RNDIhn51oriP8F47RXlxjLo/E
	DmXsodVwxMr2U9mNGY28knY9kVkttgz9EKBdZCw0s0CBSFOYa0/n8yP8HHzsq4ESuQI3xfu9zGr
	CkPR89EF8gsQYOpo3wpFLXKzn2jE8LIaoFFy6r2Rlh7D+OosBmsgbmvwDFcAxMwp0E0o830ytbP
	5Jw1pJYpJqmxzGo1psevkRVtTomSVqJmF/BHB0eDf7dWJ2o0DuVfO6zEoHfsBBh4VrbQDhHsxND
	Gbw1pX9YrUIKOJkKKJ8RdGObtfNt6wZEgim+pqMVD8MCMNf5t02+8SbK2B7lKH0SorWvquw516y
	Dfc4d5HSu4irLiEa5Ck/yR5ORPA5AfXebWUkaKmlSX+oj9jRcMM/A5eSTEEptAIu4d3BLvzdfPs
	LbqFZbkDxjW3HDx4LN3a5cdZRM62MlXu0zL22OpNvvXbAF88YtruFg==
X-Received: by 2002:a05:600c:3b0e:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb8882508emr70581525e9.35.1795181157849;
        Fri, 20 Nov 2026 05:25:57 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm122879355e9.11.2026.11.20.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:25:57 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH v3 1/1] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC, and EPERM
Date: Fri, 20 Nov 2026 14:25:35 +0100
Message-ID: <20261120132535.20557-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120132535.20557-1-gnoack3000@gmail.com>
References: <20261120132535.20557-1-gnoack3000@gmail.com>
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

These are all returned directly from linux.git net/unix/af_unix.c:

EACCES
	unix_find_bsd() checks path_permission(&path, MAY_WRITE) on the
	socket file of the remote address.  The rule was already described
	in prose, but the error was not listed.

EAGAIN
	unix_stream_connect() returns -EAGAIN when the listener's backlog
	is full and the socket is nonblocking (there is no EINPROGRESS for
	AF_UNIX).  unix_dgram_sendmsg() returns -EAGAIN when the receiver's
	queue is full and the send would block.

EMSGSIZE
	unix_dgram_sendmsg() fails if 'len > sk->sk_sndbuf - 32'.  This is
	the limit described in "Sockets API".

ENOSPC
	unix_autobind() fails when all 2^20 autobind names are taken.

EPERM
	unix_dgram_connect() and unix_dgram_sendmsg() fail if
	!unix_may_send(), that is, if the target datagram socket is
	connected to a socket other than the caller's.

	This is not something that the remote end normally does,
	but it's a possible corner case.

For EADDRINUSE, simplify and shorten the wording.

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index b7b14793c794..61f06a74359b 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -676,9 +676,24 @@ .SS Ioctls
 .\" and it may well change, probably best not to document this now.
 .SH ERRORS
 .TP
+.B EACCES
+Write permission is denied on the socket file
+specified as the remote address to
+.BR connect (2)
+or
+.BR sendto (2)
+(see "Pathname socket ownership and permissions", above).
+.TP
 .B EADDRINUSE
-The specified local address is already in use or the filesystem socket
-object already exists.
+The specified local address is already in use
+or the file already exists.
+.TP
+.B EAGAIN
+The socket is nonblocking, and either
+.BR connect (2)
+was called on a stream or sequenced-packet socket
+and the backlog of the listening socket is full,
+or a datagram was sent to a socket whose receive queue is full.
 .TP
 .B EBADF
 This error can occur for
@@ -715,6 +730,11 @@ .SH ERRORS
 called on an already connected socket or a target address was
 specified on a connected socket.
 .TP
+.B EMSGSIZE
+The datagram to be sent is larger than the limit imposed by the
+.B SO_SNDBUF
+socket option (see "Sockets API", above).
+.TP
 .B ENFILE
 The system-wide limit on the total number of open files has been reached.
 .TP
@@ -726,6 +746,11 @@ .SH ERRORS
 .B ENOMEM
 Out of memory.
 .TP
+.B ENOSPC
+The socket was to be autobound,
+but all autobind addresses are in use
+(see "Autobind feature", above).
+.TP
 .B ENOTCONN
 Socket operation needs a target address, but the socket is not connected.
 .TP
@@ -737,6 +762,13 @@ .SH ERRORS
 The sender passed invalid credentials in the
 .IR "struct ucred" .
 .TP
+.B EPERM
+.BR connect (2)
+or
+.BR sendto (2)
+specified a datagram socket as the remote address,
+but that socket is connected to a different socket.
+.TP
 .B EPIPE
 Remote socket was closed on a stream socket.
 If enabled, a
-- 
2.56.1

