Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191150;
	b=SIXpLQLKFr2+5FC8qtrxe1aont29OSXy93iOwT8yalo9gHAIZDMn1TkGxO++FJHg/LQu
	 2c5k1xXUe3cL6ka2wYKpLJeABXIxMk2l9ZzIVZlyLexvfsU/SvcS+F11IVFQy0yG6sAAG
	 u+qG14b90XTbBh2d6G7SRXu9a8avJWojcLaMzX4K+H32Fml4fP8NYayMBObGftI3BQ7XC
	 QGgKAQ4TJiFKkoGVdcr8i/Co+Z8/5FZnECFXcjIlqHdyCx/RtBF6cFHlFLx13GFz1kus/
	 RT9ARHBTkRBG0pshPDQGV325OCESQa1sqEJWo9r7O34OIXRESlZwX3+eEkjjaM1cxNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Fl2sAfy8i3bd1wm45EoPhkGvXrPasv7lD2PS0v/c5/M=;
	b=cefz/ViWorDpRC44IHp1xrvpqbb1BtYttRb9PDe1bchD9zbI36pZ/wBmPcoGPUEsR99i
	 9HqSRoTrc5wlOwMV/6DLtZcEk35zzfXJ0imvyK7eO+clAYH7Rh9ldlospxiwIoJZa0SrT
	 eVE+YLbp+Jo1OmKvHaHyIpdB+LtSQrrWRetKoP83FMBCU8gS9KZ8ga03L4nLciYcj0tvH
	 3pES3TstAoSJOsOolFlpdctIgaHojPCy0oATvfN40vg3ZV6SbaAO3a5HY94UWgWaUa3cq
	 XgkTEX8+f+hXJF0nU7ptgBMqFUz4HqxluKNTQ2ObYfuDwW6LjTUban3/9WD6mNZIGQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdABvpL8;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB0606A33F
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 16:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCB0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdABvpL8
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa5103so656803f8f.2
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 08:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191149; x=1795795949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fl2sAfy8i3bd1wm45EoPhkGvXrPasv7lD2PS0v/c5/M=;
        b=GdABvpL8qBMfNE0AnaYK88bBYejHKyHyCPZn/8lHlhgf3JLopleBLhaZGZmumR6DIK
         5xAdimb1NWNrzalzAFh/OtKmqWakOOnnRvU1rlf6rggeigkF4OMuG+zHaVIHg53FjdDl
         bq/yRW+9HixoriehRNZOXdXbIMM7FsV4t1f+lsTImYw6dJjABl+WG2+TUgTGQaZHYTmg
         ThkMkODYeDQmPlm/YyblvxUB3nxUl18fnUovK5wXpZ4W1i6Je0ZS5s/kbI2dXLGyFcTE
         vhZIN7t1KIoFe43SD2ykuYQBTr1TFlRSSzuxw62wRRClHDqRqPjElR1sHCM4BtiTZQvS
         ipmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191149; x=1795795949;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fl2sAfy8i3bd1wm45EoPhkGvXrPasv7lD2PS0v/c5/M=;
        b=ZsSbwekxaW00Gf1bvDGGeNfbB+VGS2/5dNyOc0jmTRxOWemQr9QJcyibP/7QBMaEMO
         rpWdcpwOFxex4I2Hu25Syr0zRfv5a0aGipe+lCRHSwjr92PvhH1zSskxTH60kDpEMD4n
         dVAzBWAPF1FsdFtXAY0WsCwY0KtgFpjXO2vRKykfW3JrrbZK8nshNLjxluXFA/ue5Sn4
         W3rOUGnk8qYZVQiB0Fo83vwxSZgazms9NxgwGKS/w+9rZU8GMw0ihlSf3vNis3rxpX8B
         /I9W0ZPpRBmpcHCdAiq30uibmY24Q8G93rJSoD1rS2SiJ+aJMuc4+SlcoEEUKtrgKmbg
         5etg==
X-Forwarded-Encrypted: i=1; AL+hErHVu3CUCHxld3ye4law/OzZY86EoNx3lF9Bd/0qIAaBLGS7/9FDdA85SSl42+oz61yr9bsnqp721Gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DGy80g5LW3Jez/XYTFZMaQIY6ClVYesex7SiVoyNws0TNWHr6
	U0gcR+dcFDZhT/DDPccY7pO7jVwwFWliDvWoJG5C/rscfIpEb4pe4t8x
X-Gm-Gg: AZFdTZf0LCCcrFuLfdOPIRiGre5iCQRX9m6+G/rZX5RNLz9OfsdMvWnVNw6hzDtlDRc
	9LTfBW8iNBmGFH8hMk7mhC+7tgo8oDE8Tl7itebmYqJSSJjGOGweTopIscr8p3uSfnKmBeoCryw
	LIS1ZZ0riaWL8F0ayTNCRNW/pPYVB2tIG+HPPyLmgXh7F8BmXOxOYjAGAhFMqHxWJbZfMQYeEgl
	S3QOamSKeoENYpwdNBc+aKQ9TkE1X9DCxsXZgqXcpIhu0lkGAe3VolrGyjPIowl55Qd+ixhnaRZ
	y08r6Dwg3CNDQ6YJnQtgeJZjBHAr50YQnwzxLjN31SGBQXAcCjk7NnF6yrHsnKCYx2vu8w+gFHM
	C0D0KN0bXMYQL068Qwi9gmV9u8G03Euixx4Kk363eCFZQEJ8vnxqAa1V12XtTBd80TFyfQy/jiS
	Rs9rryq1bv6pu0/2kclQx3oT5/lo9Mik/rVgf03Zid5qTtnkZ/tliGgBaFyaQndTKABGdR8KhdQ
	aivODyeYb2oBU75F5XOIlOmoquFHVVTveT7EU0Ehl3ofXtH/Xo6o1uVdWSKqOPmTwfp+el96Joc
	PhZM3f3IIJhXCycqTw5NeuWJr3gS365Gu3lcy76c27PfV4ru47asll7fhFprZ6QquP/Hkf0LiF0
	=
X-Received: by 2002:a05:6000:2883:b0:4a7:a52f:a2be with SMTP id ffacd0b85a97d-4abb3678d88mr6631098f8f.13.1795191148431;
        Fri, 20 Nov 2026 08:12:28 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm6447311f8f.37.2026.11.20.08.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:28 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Christian Brauner <brauner@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH v3 3/5] man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
Date: Fri, 20 Nov 2026 17:12:00 +0100
Message-ID: <20261120161202.27163-4-gnoack3000@gmail.com>
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
Acked-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 100 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 532c50b94ec3..22fd3b3c6738 100644
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
+ancillary message in subsequently received messages
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
@@ -1255,6 +1354,7 @@ .SS Program source
 and
 .BR seccomp_unotify (2).
 .SH SEE ALSO
+.BR pidfd_open (2),
 .BR recvmsg (2),
 .BR sendmsg (2),
 .BR socket (2),
-- 
2.56.1

