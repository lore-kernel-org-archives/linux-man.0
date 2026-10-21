Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616911;
	b=lqkhVRIsCZUefSIr4xv7lgWuZfuJ4oaIhM1zTC+XQ2yfsgjjkNcBLAJn47Lx7fV8lgKE
	 9dL7cgEiT1O1ro1RuAKHxfN69ImcPaDvSoi8/D2K2wy9Z201fRE7O9qa8Q6NquU/LJJM4
	 5dZQ1hsd7hyN26xdzB5LVTwuIPOv8KSBX8RRh1fAaiV5pZ06L13BhDez5XQiiYOio3xGC
	 0UkWh0AUDq6JVAAKllnPrdbFcGLB4YLDkbOKnwIHNjO466Fh98/bxU8Un0iyz7cuVR51Q
	 kAqJu0w/1rbuErrGPPwdJFic68BH2lCgUhL3cs3ShYfImhUL/m7a5YcneROMG6EN5Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9f+FUHBjtmpU67udwuRG8SafhXI1ojdsPd57d2IZDE4=;
	b=xplaIcgzeNT/f67+tXMZJTjvxTCWjHTheykfjgnWgQuaZtx7sA93Dc7i9cT1DrLpoS1+
	 /Hpzh4/3ZyOujy2QQ+XyjaCjRGKsuxd25u8HWGTUwGhaYb/8NiRKS6Qt/UnoqJ5Ze8BO6
	 rTO9Sl0QFC/COTU+eipGOYM5tE3aPuzrZhTv4TbhS2w2+MOYvhFqAAn6MhNUFp1J4zoZV
	 N8qQeNXWFRtSSaazCvzWLc3aBYaXzD98MvLvW76iVoYSdKS52m7TS/54DHGUaEWZPtbkx
	 OJRVleIXrvOXTmGVKC/UtKR6tGc3ws8UPfIa8aYgk5+g9/aibinS+JqLV7MoqFpXYjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUXLp62d;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F196D606A31A
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F196D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUXLp62d
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1df146015so9524495e9.0
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616909; x=1793221709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9f+FUHBjtmpU67udwuRG8SafhXI1ojdsPd57d2IZDE4=;
        b=pUXLp62d4DYyQSrQOO4XeXRmJE1/J+QBhQ3tcw+Pa4aXIMFs+Df+gmrxPodD7Ypcya
         H7HT/Ke/9ymSfr/u7J7S3NQRFAXJg0jehg1nzbRrrMzBGpdG5RbjVJ8BNqAOxFASR9GP
         TTwF9BvVL9hZLJMN1zCES7bCp4XZO5mcz6r3gT+S4se1R1/hA641BOzi2S6JzNOocz2W
         np9LsoyxI2oYyEP1Kx6Lz1+o0BTvxKPT9v8ZWIliLdvPEGXpyKVIm8Hfz/4wkUbfA9I0
         kfRjQaXZDCgkO8rvOYn6jfXzuD7qdNZ0AoxlmO01lpQqx5pVSyr1K4YEYgpnrB1vmtFI
         y2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616909; x=1793221709;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9f+FUHBjtmpU67udwuRG8SafhXI1ojdsPd57d2IZDE4=;
        b=ZGsgaYWg0vHd8drfziy7bhmYPII11ex/nBlgyA3I+ST7MhYYkO7IVBsRbnDP/UrERA
         4UlKeJ/OVdYajdMLNANH/Ot/gXs2l7u4b+oHEraZprM7SoBmYXPJWa1fvWh5q8mHLqWb
         q6XkvrwD9U1183TpbDAqAdzyZw5DygMPbOJ9akV4Pu4V43MdfEh7wxIeIPANmt4v1Cvh
         qUWi2sUslmg31YfOJ2vABYHntMigsnQJ52DM4Pli7pEaMtYU6ONjF+DASiH1JJWPhl0K
         52T0T5vO6ave5DaKGtS1qWRhPCSFVrrxKvSuOhscJjpXuG/5FARJPI60IgYl1DVmBved
         Q6fQ==
X-Gm-Message-State: AFq9FYIqcjZnzWZpker8L6xmzSlfyTh8Zax4zOG9ssWdlttqN9nL1iGf
	oJNZPcD0LJQFFt5gzXtej4D47RJhECy/xiaTkhn36AieGhcI0l4nKpR4iNjZ7WBZ
X-Gm-Gg: AYBFou2qJ6Xx+hHT6JvmXvdqpoCAHJ1XwkpAXiP5IpVKNZwnSkNaAED2qL0GIOTGLc+
	cGgo+GYh4iF+iJKYtWIZezB674jJVt7A3oMvvQXG+Tng72LW/TP1kzarQIjtWVZpd0tMVTl7X7M
	DfndyD0Zbj9/yntEFdf1WqDLRS7EKENJazvORSO1DY2XnLncz/PW9IAeWkX3Zj3J84tVncAauja
	KIeFesfpZ/GrqAy6EYguQadcWdEH9mmBBSwNhJyJLflDp3mb1ev9Y2xg8QhuqTak2zykzorYTPu
	Hm7OCBUw+y7Dqm2rXob9xSUCe8M8kXrBvdULLQknf7DTqYfgo3RckkvmyERAU7R6+aU4SQIYrwT
	ZvHFH88fhtnlq7TXAZ/gCMYW0yAHoBJobWx9Ha0KEk1wkDVCWxAEhBkVyCbcYS3qoYgV8LNPgW5
	1tHcDijxrERLeTmsj92pLmee2PubPPp6cRsts4xJ6Vcj/9mAizRfRUz9dekLNKirR01G4EspKN4
	mUz80Ap33ppjN0uJMToPw7d1atRM7KNOMjqPkNRRZ8eF9FbdRqMxF/1K46Y4w9o/rw4tve1ATJi
	SankgQAAduR1H0UZrUnSUx7tEQ==
X-Received: by 2002:a05:600c:3ba0:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a1fdb078ebmr83682035e9.5.1792616909260;
        Wed, 21 Oct 2026 14:08:29 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm8716874f8f.42.2026.10.21.14.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:29 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 8/8] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC, and EPERM
Date: Wed, 21 Oct 2026 23:08:00 +0200
Message-ID: <20261021210800.27338-10-gnoack3000@gmail.com>
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

Cc: Kuniyuki Iwashima <kuniyu@google.com>
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
index 054f1af75dd5..79198445c581 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -655,10 +655,25 @@ defined in
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
@@ -694,6 +709,11 @@ invalid state for the applied operation.
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
@@ -705,6 +725,11 @@ did not exist.
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
@@ -716,6 +741,13 @@ use the out-of-band data option.
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

