Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450A3DA5B0
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345074; cv=none; b=ouPa1VvtRF1WfwxrId8MDHtcsFq7+TvbFM8r//DM9wxY4FLbMHJ6uGPQ1G2O+ZwEqkjvMCgmrNxu6UZ6Ge9UXnJdGUIZef1sJ6hRGXhRlNu1+ckauZjYmJRmrPgCXRZkbVaxq07jTR0fRSdvo3hgFYSMfZEgMQNhIJL+OzXP3S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345074; c=relaxed/simple;
	bh=VNpWYfoGG3xAKu089pvubHNp6WclJevwJKTw8EUG2QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbY2JHp2SCOuO6TA+AR/jbHLBzq1j0o5RDOcwoNYhn5lOwEK/Tn8VaZGto6Agu8H6as5ieHdW3M0T3eyVRPJTEYsGnB/1e9uZ6dj7bTrTXtWUw4YU4SazslCylFi/KIo2dmGEWBIdgKYRAvJSDqM3IncGEqrTagRTzoTULIavNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbcV/1J3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbcV/1J3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so2628465e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345071; x=1792949871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=omZatmKJRt2Cjt+ZeO3rqtDzbxfjE/LO/ezWXhMbe44=;
        b=NbcV/1J3ioiqyGY6ACnsNuc9/rUtv5/pcAnv8mqTh4vJEAefCmqmIwHWzWyTtXRJsb
         cAfvrGwoC9Yi/Q71vaDdExtlXxySpIzq3SQSRNYmgMF/Qy7/QqGhojFPIn5skXUJpUOk
         pMoPkl9qFU5FOpm42JZCz5f+Y3E5AqllqHXBXRsMPOm0lg1qkoRp5mqDh7i9nl6SI7v4
         LVZnII/tQxOWpKlxIAeFe0NnxqCnU/oIN7vF3SzDc/HGucyX2vvXtm2qZJtxF5is/JlC
         DW6V5wbf3tjVCLr7AZoDHoMOQc2c7FB8kGH7CtkM4qFHJjhJwjWXDc1J388BBsfdU5sS
         MyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345071; x=1792949871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omZatmKJRt2Cjt+ZeO3rqtDzbxfjE/LO/ezWXhMbe44=;
        b=0pO12VNDmy0NRjZWKM8jiBWP9atILM57ao9NMJntfUnIlLVV30ukK29ryEcR2hn0Vd
         YUUQeayOPvRajQfcd3UprX7HWMJ+xhlM5dr5j7MNSnHQ2WYrUmT/hLHfxBXnnLkMcXxa
         0Meoy8jVrFMIV1mbdfGu7lom9FoX51M0835IwjwjXiK4ru/jrpPqrcYuCCdAYXd6vIOX
         cDZSqPr5vw6ZqQVhLSbohG4CR8t38rV43eSHptezK8FPA+nRlr217vO0p8nCyoniagEK
         rrXVNQdFMO9UUZgFwT7/tQ7kRa2ueJl8q5PCjmS2KmFv8fG1oRk9cP46I4YnOJWt+7PY
         BIMw==
X-Gm-Message-State: AFq9FYKm44/JsslerO78dbbBxIrpbRElqe3DzIAPHmLBbI0vsAgc1p/1
	1D9U9lRcS0hfzDqRYEPJ2lcaNorrZUn0rYZDhLt84GmmlojmT61gLaDL
X-Gm-Gg: AYBFou2HnzPMd/ZYXccnvvLH2BYMq/xdl1TphJ8MxNW4p3ZTLuJ6kn92+Cn/yVy27J8
	OD5gl2tRHv+IIJXjwj4FSYMK+aWHOq2a7h1LfgCVRkBU5gYMZt08eSMb4MLqcu2IGukyrrBsjML
	MJOayLQXF/dpg3kNY/MMkAZaQTyGPUQO3jWZ4ogN68q4QsxjVw3pWaaC5KE542DmCjDwAo/hCgG
	EJxmDVl6B4YvKMPVlf2BSW8H9Cs5lELdVmOdif2Cu52xj/AOBLEgYg3wEYu+73qytxnJGnMKbea
	jDNlTxR/0Jh3Hy8dqcWyFlwk6KVWcB+JY4ZKnhuB7pqAuZZfAJcVohcslwjNBSrzbC4OIMZoegp
	aqSUygSA7x3VvUpDzuk3vQIHAvV1lKlukJJYxx3jYH04KDBdsgKfGxmyGDJN5Ui3tFsnPRCn8jW
	8TYqSQtSa0lJsalHP70p/eupX7UYYVyOvw6Hj8Mc+c7oLeGoxnKKuzr+mPDMWILxRjgrj9RbTJa
	gxsnfiM9HZ/awjWmlymxTNv2jAXe79Khw==
X-Received: by 2002:a05:600c:3f0c:b0:4a1:e383:6811 with SMTP id 5b1f17b1804b1-4a1e3836c4amr43241425e9.29.1792345070872;
        Sun, 18 Oct 2026 10:37:50 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm299068855e9.8.2026.10.18.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:50 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 20/24] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC, and EPERM
Date: Sun, 18 Oct 2026 19:37:08 +0200
Message-ID: <20261018173712.27670-21-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
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

