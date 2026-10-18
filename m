Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03853F39D7
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345079; cv=none; b=aTJikrNAH9Hb2rdIwG5c+/n8ZosL0zaL2dxsAAdCgkvmM4NXGJAqpydFYZtUYOsLaL0guQc/Jgp3Bi+T39hqUQ9C75N6adEWkdYvxI2x3syFt8GAuqqMTTeBfeUBlkjd+Nri/61O1LqY9TewqXwBCr6893q7yonyCd3pR3fYWhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345079; c=relaxed/simple;
	bh=q2tCH+U0WHkNB9QiQ4M+rLbw+w95tJSEX6x344wLgsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xq6brNgGDA9P1CnnA863ltC6IM/TUGYwd2//Vg6ggbssySxPlEuQteLgl7y2+ZgWyUFqfbHAN/T+VxPSikP6xLDI11FRPsUs7G6UVLC434BYGo8obfSQtNnK+eAsTq7ji7NlNBMW2rzl58fMTX/fmhbGpbxV1Ib0IVYvi43ahc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCmhQ9Qd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCmhQ9Qd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so3829835e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345076; x=1792949876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+NJZuIaCehidC3GickJ3/eqavsfaiPEfZRoP/aaduDs=;
        b=CCmhQ9Qdtpd5a+hyE/7KBe15O90qzkCXVhmoPxytCmRTBOrm4AY8pMQbLIFAyQhZpy
         p6xN3JhVIgLS56gxZkEWDvFqzWAxR8c926yqc5fPTTydQnTcnAwLtn3O9uIUUs78V8cM
         sAulOgRsHY2jrtdfmruvZqLiBj7n1EgMIPnsn1oUwNmyU+Xxu21Vu8PbaCEZc6bkt36F
         yQd1qOIBuuSkD6wMlXhQ+zk/i9dKkgSdG61mwrTsWaMdTB+RpQcMZjvLbX2yGcH0PhHY
         7evBYfro/ZtM/LpuqdLacWVc/bSs9rOSarlQdTdDuzYUghOXt8JV21bI1FGuTimykdH8
         EcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345076; x=1792949876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NJZuIaCehidC3GickJ3/eqavsfaiPEfZRoP/aaduDs=;
        b=DLOpV/R09ebzKk2zUUzXMtXRgZT/eC0/5keL66MrR9CBRofCT0DKxE08jbj+7xUyMS
         LRK07RpyWo6NLQBls8dueMKPMDn/2TKjko+EKg9zrTvMx+dV/4CYcar6DLlcU3fmbeau
         KG0nzZPu3uwKuw7OreE++9W2OULDM2AM8BplPDgoyYrSFkeIv7yhdjy1IWjGv8r6hgHN
         AbdCnrMrjPnK+yMf6EP2KPKSGaywPpMyPcRqZqIghVxFDpnX3pxZKIGOk50TmjS9W0KU
         Nhu3z1WriDfPi4cL/l631yeJ26jhg85ZcbuRz/lemtYHYlQ0RFXrVb7sjhOpd4rRouKr
         Wu2Q==
X-Gm-Message-State: AFq9FYJ/6LSIF3XjPaUQsBJTKND+d72UKqFOY+gSwoiEZpLh5LDw4z4z
	uyTxyZBCU2/M5GxyCTWlSjunfO8s5UDpQQwNWAsUNIMlYrKZMo92RWJ+
X-Gm-Gg: AYBFou0YFXPmaytherL47B1RC/rXdH3tP9BQVdn7UMHlJsJ/IVydQYi413Yy6GC3nFU
	q+Ra+46JV1yIJ8gr5LYeC9yBLcj7ffpf82iR543YdL+hYHI6PlnwNFubhrbjyCIZsJq8xXOpSEI
	BSRYyMpv3ptnR6Ujma7oN+Vp2iQTIdv5xh36BSfsqt7I+z9IUmpoecu6WiANZUkti6HLVhWasmc
	r8cIZRsZ3m4uIQcu8I83dIpCxVwze1VvqQUJHINfdnhpfeT9/DXEAJdzGzShHtmBPLsmL7EGKic
	d9SfSYWcHk2tmRigV9Q4VH4M0mnQ+GxOUWUZFjZAgsiRbkBL/jDD29TKFbK52jDzCKmrdvsUXRO
	1EPyYjeF6h7qqPY4Ed9sbDnTfBYjI3rkJq1rq4TNLeDrHf8040S6BT67KGBT//vKcf92IajXuPT
	B/t0h+ctnczOgGgmyZy0qk+mFySuMw4T0u992tBB6wnE75S2tRjSVun1oWdu8gusSo7DM6GxTcL
	qhhJO73FoTEmqjskDhnlX8=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr117822915e9.34.1792345075936;
        Sun, 18 Oct 2026 10:37:55 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm339620735e9.9.2026.10.18.10.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:55 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Christian Brauner <brauner@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH v2 23/24] man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
Date: Sun, 18 Oct 2026 19:37:11 +0200
Message-ID: <20261018173712.27670-24-gnoack3000@gmail.com>
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

