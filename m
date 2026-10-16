Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4078B58B6CC
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172022; cv=none; b=BuYG/1nwmtzm833Ps5oneXUv2rS06B4CVO3eDn7vo4vgsbCOrxKWzARfZgMLwhUrFcQU4mMQd+Vl3ti1Kid5jjvvWzhBafm+CC+xJLDJgd9S06a98/VYKk/Ga6H0ndeAgtu1DbH098FMb+rOVVEomZtcijTNax3DsFADLaJWDc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172022; c=relaxed/simple;
	bh=qOz0jgJnYXWy+GUhedP+NSDSyCfmiUdW3zcNso9uq9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XWFzjdBBXbjYOYNmk/GceL7RNkuKPleFf+FvN1kaZ3N0NcPyy6qyQN9TPhNSw83mq1pk2jPFqMGrzvbhRKdDCRmFI4FLRfdFNR6+PZxGbkn4VfcCHvwWTOFE1MQds8DjVb0CZsjM/Q+PPua+/3iuFfvz2Ej6EH4ZnqoaUcou4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leQ6farm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leQ6farm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso2210445e9.3
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172019; x=1792776819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cN53ORie/jt3MUOU6X5fNkz0npZqzRrBZMYQHNFBHRw=;
        b=leQ6farmp+NLiWRCT7vUXcl0a87CYInY92wxfrjL4VCVC7hVET4VmBwseoU2G08l+C
         519DbuiZDakTgXo6nk/VppeRQklOM/HDguba5jyHI9L4LLkRY/eKztp5ZzN+wtX2q4Hb
         L1xGD4yX3cNu8i9c3JUn6pJxqlYUOOP3AyIYcHsOfnJb/OKwefqdOXw8ssgQZqLroCVf
         KYO86wn9bvcizmjY0dKBgI1zCewEeZMWS7Kv6Ogn5RKoL46I85gDpPXDAQpDrZ1VHBcS
         m0z1x2Bj/LbhsGLIlLdeZvb5WLtn92npyt+/X2b7CrPLf/6SC0Tn7X6ZXQ1/sHrzs7BU
         4Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172019; x=1792776819;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cN53ORie/jt3MUOU6X5fNkz0npZqzRrBZMYQHNFBHRw=;
        b=UiiIgk97CEA3zgDfETFlN6rnfiiOFfv7aY99r0eo37GA90llktIPWB+KMRzeTQj04I
         Y5TNw3ZByyoWPfJz5ETZqI1d3vqZp6crb8YCjcxs7WBV0G+2wsMsIOrBURhP5McG8T/q
         2pWQTYqNegxmEDucQRcAvbGEACUC0a5U/J5mapVMBKcaxBJL8LWf5SQIUds5KZFIqm5H
         bzvVLET/vOjIyKZy7SnMt7AwEdad56sEvjhldOddQqJznzPqbn7iIEBxe24096QJ5ctC
         sceQ48IIhWIMuIm1v//D+ITLGDjoCjpk8Zz4VcgBlAGUBbHHLfg0oqIulotwjVINkQ/M
         HM/A==
X-Gm-Message-State: AFq9FYI0I7Wku/ZbrAKmZR67jcfKAVRp6IkNrRDrdNmtuqn93lyLV7XO
	C0ezBOLHnVPQtCOcD9e5Bah8Mo45Ufkga0s6JyI82JHlEEjTnxmP7yQp
X-Gm-Gg: AYBFou1sJLleZ4PRWvW5uxqG6U6q4sF2Fz4hLFhaYkbsJ48mTMwlJnpSys8DywCHcwB
	hSZnWyYNSou28lr5O4QoySo1r4caV9FWQbrdVmt4SnPee81/5/4BmqL8MjmkSvUcn5MP0mDxoE4
	mgt/hGcPgLLB8FWcvBL7frFT8r0yAEsT8q+Zr5R8lEjXP7FWV+dKBieCoogKpwkxyqfZSLQGUbu
	0wH7ZYU0aPozmrpz/6nHHWuLXLYCzIcrzDX1M7+hxAHeKbfHPNFpLQwGmpadr5qaPSIBV1gXOUh
	NvKpzYb/UrCrOzj8bFGKrvjp5SNU4JmGMEk/84SCiE7MTrNIWKqKgxCL+Io4wKAiVZydHdTSXLO
	mhD7yr0UAgIHTNdORHHvyz2HNWboz0EQAveJKbilwhN+YfOSOZSBjbXsHDE8XBkPNU7GOblLC36
	vR/mJ3rq3V6SM1RvuCP6qRgV2urFwUsNglfvmD6pr6eMAS/TOsCMRGeQ/AleFdE1p/nA79XLrbf
	Xtk6z9m71tY/ddVPSlK3OA=
X-Received: by 2002:a05:600c:8b6f:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a1d75f23e2mr10255605e9.9.1792172019346;
        Fri, 16 Oct 2026 10:33:39 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm40636285e9.9.2026.10.16.10.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:39 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Christian Brauner <brauner@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH 23/24] man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
Date: Fri, 16 Oct 2026 19:31:38 +0200
Message-ID: <20261016173139.13076-24-gnoack3000@gmail.com>
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

These were added in linux.git 5e2ff6704a27 (2023-06-08; "scm: add
SO_PASSPIDFD and SCM_PIDFD") and 7b26952a91cf (2023-06-08; "net: core:
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

	Since c679d17d3f2d (Linux 6.17; "af_unix: enable handing out
	pidfds for reaped tasks in SCM_PIDFD"), PIDFD_STALE is passed,
	so this also works for reaped processes.  Before that,
	pidfd_prepare() returned -EINVAL for them.

SO_PEERPIDFD
	sk_getsockopt() returns a PID file descriptor for sk_peer_pid,
	or fails with ENODATA if there is none.

	Since 20b70e58961b (Linux 6.16; "net, pidfs: enable handing out
	pidfds for reaped sk->sk_peer_pid"), this also works for reaped
	processes on AF_UNIX sockets.  Before that, it failed with
	EINVAL.

Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 101 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index bcb58336a1d8..6283d455ffa9 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -316,6 +316,33 @@ and returned as the result of
 .BR getsockopt (2)
 is an integer boolean flag.
 .TP
+.BR SO_PASSPIDFD " (since Linux 6.5)"
+.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
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
@@ -367,6 +394,43 @@ stream and sequenced-packet sockets, and for
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
@@ -535,6 +599,42 @@ message, the
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
@@ -1264,6 +1364,7 @@ see
 and
 .BR seccomp_unotify (2).
 .SH SEE ALSO
+.BR pidfd_open (2),
 .BR recvmsg (2),
 .BR sendmsg (2),
 .BR socket (2),
-- 
2.56.0

