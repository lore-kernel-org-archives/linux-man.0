Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737368;
	b=P19NfDglbZo36XG9PQuITOhIgBFyGpJvlDVHa0gXFQcjF2MEctuCI/C0FWtKsrCq60ZT
	 qsvV8EYnaEKZ60iK8he83ko0vHXqlvqnOuOUrOnUglDHygdcO5sRiJCe1CZ4HuNFKn+2+
	 SfrueoY8CsyazQExAB6NQwSTImTheoKX2K1focJ8HE2DkdnE6yU7UlfRiG+fSFvOR+eGl
	 KxvS6LelF+/UorKarUpbaZWx6PlimsmPPgok6PCcAujdqaFXWjQ9TBJDOq32CYDXaw0Cj
	 13VWnN6ByrdIQTafmmLjlyd19fAIx2Sya4CWCJ+QDg6ADWJs5plo7q9eIyknGIU5K9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Cva/iyFF5aI9nahR+IEAXh7zuO6WHJXy17m/QDkCuBc=;
	b=luqrBy74e1MnEKTEZdw5KA7yU3sSe7Pxk/i9AgPlHHfs++e+QKHMbencvTb8jSif7pA1
	 LDqvy53+AC3bmlZmZvX8XuacYQM5oWCcYcEKmX/WU+zK/ZbL4IEnPs3IdwP2liNqZvFZ1
	 gsVjHQgTb3oQQSwEoG8RvoJDlJiVWf0AVZbHD14H5LzvIwz5mVSsLL7PJKKurnIfdw8yv
	 1ML0ed7rRGS4WsVYkZGW+9SfmRRAjMOT8Qr/xY4YTbTma4s9w8WNeMWO17/Ic9jj8nDYq
	 vd0rlScEgDadDUTVbNDPFkU7P7qOuSdNHrvYuIR1jGRSnqJfxJI/nnVs1AQEN7luAHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r34bCiLT;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C65606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C65606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r34bCiLT
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2841314f8f.2
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737367; x=1794342167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cva/iyFF5aI9nahR+IEAXh7zuO6WHJXy17m/QDkCuBc=;
        b=r34bCiLTbnGYertKduo2AQbBEzteFY0d1yOYCp11+lSQWYC0njLMBbx9ga9FaDzZVY
         rnLtlQsQPzwN8JbX+KOZsp0vksAzShZ5DU3BaFV5gv4drZbKqDFpiCgkVD/BNIw0xSEW
         iVaF5Gn9mMpLhLwTEX1xFX6TOA3b4YK3NcEDNXoH28h4xV4Qb8LacxNclsgoU+RWpYaD
         olATLYhG6JiqQT6z+gHQhoQB2T01BfTr2fO8z5iNrfE1LyQjIcQs/iKnevm0nKha6QxY
         XEsFLAkohY3q1JsTKF6N+md+njUP43pkT/75w7iY8Byoq209TnYJGOOHXs83199pLsWy
         a6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737367; x=1794342167;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cva/iyFF5aI9nahR+IEAXh7zuO6WHJXy17m/QDkCuBc=;
        b=CwjC3PzXhKkeTGLDp7TvZes/VlEWQQTDp6Ut/orY6ZUR3W5k5Owp8PAwl63nenOCZA
         kvlfkiyZOAe7lbCfj1Jz2l7jPYl2vBIPnwctQwIMMMDrX+FihHMB4nMoc3NYPrlquAPQ
         jXTaYZ/8nvi2IkjbPS5+pCh96KPgQMt/zTtJ2CFr0PIm2Byi79M3xRs8NnJ3EGSXI4L1
         4kHo9wtoIq9YJwB1Ls8Qrloc4+2B8StBIPd1kPsJKkZRZ/1CxfNZvCGX+KDFPvHftssf
         0OlTe8bwrt+I5whbL+T4x8f8N2+ENCJEhPfyMChDgXSVD/pu8S9TqqALWX2xYilWDOz+
         Ectw==
X-Forwarded-Encrypted: i=1; AKwUvBzqtpyTzI2ifY8V0kc1lnsMkeb3xsS5OlVuuYliOhE+WCoMsAWabqFWIzlGoRQe/phvG6HIjr6QStY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rOFEJbR3S0x//EXgC3MTmp5pOh331GKCllp75OpqHBR4EHXr8
	b0KTJpr8CfSvPCIYfnNBy3+kFmhTE3rSMArh+G0ehs1UhaeEPPRqNU3l
X-Gm-Gg: AYBFou3oiLllp5yH8zH+7PT8mC+9yyXB7Nj2YoXq1LrZQTJID2cLDoBkE9jbXKMwk1T
	2lK6bPPymDrPLIzSLDD5L7Ux5icM/nVMPIYuihj6w8w/QgN29MqHO510wPIDUpitXAn32wDEX1S
	f9M2c/dZ97/+j5d5XM4/uTohbDKqe5fjys4XmVEDhufVFaxfNOqCNobYgxj4jgEr3TfTVK+2+jI
	9ckczVA3XlvkibR3TBE/c4jod3Kyp5EdEE63/NosUATLLXQpVTeHUhFBeK098kGP2P7Ujj5K7BC
	lVmonfCTitmbQkhtRoYE5Wj1qc1S467OxilkdN+fKKCBZieB109T8XtKebIlUnhAtut0M4hI/GJ
	O8PjuMsy5ffwRre14p9fxCAVscFBH2c8qm/yjwyUvSbQLQ5/eFVf47Rs4EJT1WPBKdsL4xc99du
	JC8dAm9IGmqd3WcTFw2gX81zjJ2DGCyaLfpqqT0sAa0sYpKUds2j8q38Ik6psOf9+2mV4AuXV8G
	W7Fwj6+l3b/YlPvdptMXvbxyKYf5zzBPyDCsaH8uSrgsZVSovpdwBDl5QOQSKjqxSJCb/99TTi6
	0pHYMGOUTEfrIie5GpAnRr/opNiQUczKs1BYcdHZwmO3ycZzAiqaRg==
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr314612405e9.9.1793737366619;
        Tue, 03 Nov 2026 12:22:46 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm117481715e9.13.2026.11.03.12.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:44 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH v2 6/8] man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
Date: Tue,  3 Nov 2026 21:22:08 +0100
Message-ID: <20261103202211.13820-7-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202211.13820-1-gnoack3000@gmail.com>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
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

These were added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add
SO_PASSPIDFD and SCM_PIDFD") and 7b26952a91cf (2023-06-12; "net: core:
add getsockopt SO_PEERPIDFD"), both in Linux 6.5.  They are the PID
file descriptor counterparts of SO_PASSCRED/SCM_CREDENTIALS and
SO_PEERCRED.

SO_PASSPIDFD
	sk_setsockopt() and sk_getsockopt() in net/core/sock.c handle it
	as a boolean flag for AF_UNIX sockets (EOPNOTSUPP otherwise).
	Like SO_PASSCRED, it triggers autobind, which was already
	mentioned in "Autobind feature".

SCM_PIDFD
	scm_pidfd_recv() in net/core/scm.c creates the PID file
	descriptor from scm->pid, which is the PID given in the sender's
	SCM_CREDENTIALS, or the sender's own PID by default.  The fd is
	created with O_CLOEXEC by pidfd_prepare().  If pidfd_prepare()
	fails, its negative error number is put into the cmsg data.
	Sending SCM_PIDFD is rejected by __scm_send() (EINVAL).

	Since Linux 6.17, with c679d17d3f2d (2025-07-04; "af_unix:
	enable handing out pidfds for reaped tasks in SCM_PIDFD"),
	PIDFD_STALE is passed, so this also works for reaped processes.
	Before that, pidfd_prepare() returned -EINVAL for them.

SO_PEERPIDFD
	sk_getsockopt() returns a PID file descriptor for sk_peer_pid,
	or fails with ENODATA if there is none.

	Since Linux 6.16, with 20b70e58961b (2025-04-28; "net, pidfs:
	enable handing out pidfds for reaped sk->sk_peer_pid"), this also
	works for reaped processes on AF_UNIX sockets.  Before that, it
	failed with EINVAL.

Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 100 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 93a0a335e791..140e77ea12ee 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -311,6 +311,32 @@ .SS Socket options
 .BR getsockopt (2)
 is an integer boolean flag.
 .TP
+.BR SO_PASSPIDFD " (since Linux 6.5)"
+Enabling this socket option causes receipt of a PID file descriptor
+(see
+.BR pidfd_open (2))
+referring to the sending process in an
+.B SCM_PIDFD
+ancillary message in each subsequently received message
+(see below).
+.IP
+As with
+.BR SO_PASSCRED ,
+when this option is set on a socket that is not bound to an address,
+the socket is autobound to a unique name in the abstract namespace
+when
+.BR connect (2)
+or
+.BR sendmsg (2)
+is called on it;
+see "Autobind feature", below.
+.IP
+The value given as an argument to
+.BR setsockopt (2)
+and returned as the result of
+.BR getsockopt (2)
+is an integer boolean flag.
+.TP
 .B SO_PASSSEC
 Enables receiving of the security context of the peer socket
 in an ancillary message of type
@@ -362,6 +388,43 @@ .SS Socket options
 .B AF_UNIX
 socket pairs created using
 .BR socketpair (2).
+.TP
+.BR SO_PEERPIDFD " (since Linux 6.5)"
+.\" commit 7b26952a91cf65ff1cc867a2382a8964d8c0ee7d
+This read-only socket option returns a new PID file descriptor
+(see
+.BR pidfd_open (2))
+referring to the peer process connected to this socket.
+This is the process whose credentials are returned by
+.BR SO_PEERCRED .
+Unlike the PID returned by
+.BR SO_PEERCRED ,
+the PID file descriptor cannot come to refer to a different process
+if the peer process terminates and its PID is reused.
+.IP
+The argument to
+.BR getsockopt (2)
+is a pointer to an
+.IR int ,
+in which the PID file descriptor is returned.
+The close-on-exec flag
+.RB ( FD_CLOEXEC )
+is set on the new file descriptor.
+.IP
+If the socket has no peer process,
+.BR getsockopt (2)
+fails with the error
+.BR ENODATA .
+.IP
+Since Linux 6.16,
+.\" commit 20b70e58961b855e61f2c6a7a19a38a64ad1bed6
+a PID file descriptor is returned
+even if the peer process has already terminated and been reaped.
+Before Linux 6.16,
+.BR getsockopt (2)
+failed with the error
+.B EINVAL
+in this case.
 .\"
 .SS Autobind feature
 If a
@@ -537,6 +600,42 @@ .SS Ancillary messages
 .B SO_PASSCRED
 option must be enabled on the socket.
 .TP
+.BR SCM_PIDFD " (since Linux 6.5)"
+.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
+Receive a PID file descriptor
+(see
+.BR pidfd_open (2))
+referring to the sending process.
+The data portion contains a single
+.IR int .
+The PID file descriptor refers to the process whose PID would be
+received in an
+.B SCM_CREDENTIALS
+message;
+if the sender specified
+.B SCM_CREDENTIALS
+ancillary data,
+it refers to the process with the PID given there.
+The close-on-exec flag
+.RB ( FD_CLOEXEC )
+is set on the new file descriptor.
+.IP
+If the PID file descriptor cannot be created,
+the data portion contains a negative error number instead.
+Since Linux 6.17,
+.\" commit c679d17d3f2d895b34e660673141ad250889831f
+a PID file descriptor is created
+even if the sending process has already terminated and been reaped.
+Before Linux 6.17,
+.B \-EINVAL
+was received in this case.
+.IP
+This message cannot be sent;
+it is generated by the kernel.
+To receive it, the
+.B SO_PASSPIDFD
+option must be enabled on the socket.
+.TP
 .B SCM_SECURITY
 Receive the security context (the security label)
 of the peer socket,
@@ -1252,6 +1351,7 @@ .SS Program source
 and
 .BR seccomp_unotify (2).
 .SH SEE ALSO
+.BR pidfd_open (2),
 .BR recvmsg (2),
 .BR sendmsg (2),
 .BR socket (2),
-- 
2.56.0

