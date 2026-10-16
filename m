Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5859575E
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172013; cv=none; b=sQdYXIaQmoBenJUdGSgCs6tK97JGkUpzG98ohAnqea2H3Ly2BI6G5QCF2uZxfTgEFaomsp7z20LU6sSpVK0Q+Qzj3BE1WK1HdxGpvpi0THLh/qk+V71GJUd4wZxzcJWvECben+hRD05sDsdVWOGMETBWcYeO0iQeUIZmsIyzQy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172013; c=relaxed/simple;
	bh=VNpWYfoGG3xAKu089pvubHNp6WclJevwJKTw8EUG2QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XBTGtUhtiZp35Yfw4SOhW9Irc77sfqVLfl9Yl5fa3zAAr6aqUaNZ91T4hlZoIJrFk81MJmJC4RA7vyibkUlmuq7nWVRePA67Li/yfKyCN0Y2V2jhPdGKGyMxhko9yaoDf9j93il58Uwq7LonHDCFlLaWkHeh9a5IVqL5G6xHSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKmmUANS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKmmUANS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48870973bddso127556f8f.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172011; x=1792776811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=omZatmKJRt2Cjt+ZeO3rqtDzbxfjE/LO/ezWXhMbe44=;
        b=ZKmmUANSWhbL4V1YVf1jC3Gk+XOVOUghwGM2j3NPJpxn8r8h4WqQs4sYrLMtg/B00Q
         B8IF2SBZ210knmjE9S5pdBzl4pDpCBD3bXnrQHdCiTYN7BFy8E04z4acd3B8TLH04tkn
         tTgHNGGakSKqRBDWIiBCQehMpG62Bd5jlw99yaDEIFdsIqprKqUmiGogiHSWmiLcOuNv
         BM+b6jFKy6AZKwlxSb6thVVWs+qxB+hEkp2Ke5EW93xEBcmlUsnQR9fC3RLxvdF/oJKG
         tqN48C3lb2X/ZyQtsPVwAspO3gXq6qzFKAASbcHNasbn5vassWfyG6uNJV+egDx4quHX
         n6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172011; x=1792776811;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omZatmKJRt2Cjt+ZeO3rqtDzbxfjE/LO/ezWXhMbe44=;
        b=eeyZD7kJWoeIkBCoqFmmlgu8roS8pGfKOcoRvi88Yvrb30AZgW+kRhIzpTJ31uSZw+
         tdPtsxSvcb5HJbdq0VHcMntO1OO4PdnJO2b3HQwQ82zmxnh2qx/sHUHUxTVh2+wwIBay
         fXtCNp7wm9KiDK9pASxKnX/syZj9qO2sIiShWotrvRDwEoy33IwxZtzQ8b7Fzjj1+WyJ
         C04deOw1mTIhmtoNf2ZaYqOh6mPiPLl8CeEYZmi8jcb8HbHt4KcJYibVHfNXgO9uBEBD
         bFqyuiCAiAod79mynAmWnvusvGRRIZPFCQWOiolELSB8vHPywZJUO2f+JZUmhiTGH1rI
         Lk7g==
X-Gm-Message-State: AFq9FYJPgd3advaDWsIpEm3uSpU3dSkmw+jjw1rniDHRp3hSDRY04grF
	hTIeJXtUE7QJIw1MCfJdRTgxufctmN3F3S8Qd12xiibHvSnUtSNrdGCc
X-Gm-Gg: AYBFou3vxOJw4ydbFalbRZNKYebYk5rGHEXEgptSI6wj7LQ4iIfmkfxLxMJgyGWFt45
	hvRA/rhFZQeG7LRPNfrokBazJ8k8oShxt6lAGDn7vJ2riLhy3Z36wI0h+Qsof5jIUbIjtEZO+qk
	cOt+QwrXRHipwoJo5z8j4P0Oyq3ToDnLy9k0/1dHftsMStbiFzsiGjhPUCYQW82Xm4ms8fIvghk
	M3rLeAXx4cIMZ3uH09JWa2mX1FSYUTZ0lG+63TSTqvDH2kjqclRPCHGoLVT9z3cRIos9i53ZPDm
	Z6rOhIB9aGqZd/Dj+ZogUnmhuvT1zmYOAvjM3vPBtY3+sGTtjr8jO6uWbGHRhf6rIjXXSFRbqUV
	+Mxhk4r5gSF6ukxkDhteQN2V23clhq+odxkWKHQwWQzWgo8EijDrkYJRidrkXULgK/0qdTNaPah
	LkkqvX55vBVkwuQR6hEWlcVVzl9oQPgmH9iwysAADm8+pzRHaZfbwksjCI1yFOBd/l36ZKnwacJ
	LEjviv1bdWqPPdSbRRT3Kv7+Yso6tSirQ==
X-Received: by 2002:a5d:6f0b:0:b0:48e:6f:19b2 with SMTP id ffacd0b85a97d-48e006f1b27mr5731229f8f.25.1792172010758;
        Fri, 16 Oct 2026 10:33:30 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5813sm9718133f8f.17.2026.10.16.10.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:30 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 20/24] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC, and EPERM
Date: Fri, 16 Oct 2026 19:31:35 +0200
Message-ID: <20261016173139.13076-21-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016173139.13076-1-gnoack3000@gmail.com>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
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

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Verified in code.  Kept LLM wording, which seemed OK.
    
    Remark:
    
    The case where the remote end is connected to a different socket is
    obscure, but still possible with Unix Domain Sockets, when a program
    first bind(2)s to a name, and then connect(2)s to another name.  Then
    that socket can be discovered by another process through the bound
    name, but sending a dgram fails if the sender is not the one that that
    socket has connected to.

 man/man7/unix.7 | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index ca862df7cd95..47f09f16d024 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -690,10 +690,25 @@ defined in
 .\" and it may well change, probably best not to document this now.
 .SH ERRORS
 .TP
+.B EACCES
+The caller does not have write permission on the socket file
+specified as the remote address to
+.BR connect (2)
+or
+.BR sendto (2)
+(see "Pathname socket ownership and permissions", above).
+.TP
 .B EADDRINUSE
 The specified local address is already in use or the filesystem socket
 object already exists.
 .TP
+.B EAGAIN
+The socket is nonblocking, and either
+.BR connect (2)
+was called on a stream or sequenced-packet socket
+and the backlog of the listening socket is full,
+or a datagram was sent to a socket whose receive queue is full.
+.TP
 .B EBADF
 This error can occur for
 .BR sendmsg (2)
@@ -729,6 +744,11 @@ invalid state for the applied operation.
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
@@ -740,6 +760,11 @@ did not exist.
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
@@ -751,6 +776,13 @@ use the out-of-band data option.
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
2.56.0

