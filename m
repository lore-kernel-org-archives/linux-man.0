Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617801;
	b=t8sf80vnrdav8mMEnMpIqy3P0UNjO1YYk3j75Ia7Tl+bUFLs7+F69hJjGRypOIaaO+nb
	 bhs4dlhR/vNU7pYqd6dyXdZuLhIs+qZgmMKK1LRsTbWRo10LVSMdcOyAlwDJAU+g333kx
	 e/KUOUzAYPEUuy2EKC8FReQ2jC7MjA7i0DgVcT26BTsXGZ12uqbxJMQUH4ZfDBuXJOs+7
	 PAiX0Fa9mezIuzyp/QitsJbZcQjK125hQIKCKJ1PDCTVag8WejdRV+AnRu0QuY3Agot/2
	 Fu8JyXJBHuk4b4QR6tkYM+csVpsrcUbLjYcPl/kSzw4a3gGdGwocuveBpJrsyJZitkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=b0THLHHETV2+i7m7Lr5r7zPOqWRlSmJiZ1cmWcrVWyw=;
	b=wWHiheLo2WLWxcnYgopkFj74YnokX9t3c34nf4F7wiyXkq28NKlELpAcbR35WLvPF3pf
	 i9ax+PSicBW/OBMtr5ZfL7LcBwccXvoxRbzABSJXGGC/FOikK5LYicvLoYr3rgeJWy5UM
	 yMNAVKWR5Q9dmPSY+QEicvzN2x3EVWXYgEamZ5jviw/yxdSwVvu0CW/o0Ig2NsWew0frf
	 aR5z39KKM+rn82oCkIY0422TzwtXAE2GyGvWNP024roEAWUJHrrs6E1z6uCwfAtayJWPR
	 nDeJO2/7bqDcpAz6dUnKz4c04IwDw+JXKUiKa5d2lifedcE+V7KmsHapF8Txodaf8NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="N7f1vp/+";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1564E606A31D
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1564E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N7f1vp/+
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so10072865e9.3
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617799; x=1793222599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0THLHHETV2+i7m7Lr5r7zPOqWRlSmJiZ1cmWcrVWyw=;
        b=N7f1vp/+KIlHZlz90VEd9cEtG5yJ1HrTOOOTZ4S23FM/Tw6MMAU04R/+DqoWMMDJy+
         UZUPkG2BMxtAXwizXJG6gh5LjBDzre+X7v3xbLcbfG4itoK+ETbq/Ug1u4RzYEjIWeIj
         f2TDsr87Oe12pYEmgfRZ62vdcyZ8GRn6Ws+dTDDisCklh5fzzJnWxsdTedcdWl0wMqT+
         OPyiABC460CHGXYZWsxn5wxEfEk5lPwjzRvSk2ADcZNjR5FCS39LsVE3SSSX3MlsGWZh
         KnVoK23CRVY4IeTl3kd9taum1+wiBXlWTciJWaTM0l168X/ZF2huSqG3J42HJ2FtEAEK
         JJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617799; x=1793222599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0THLHHETV2+i7m7Lr5r7zPOqWRlSmJiZ1cmWcrVWyw=;
        b=vTUQtcmbC3DRueQRkOu7eLPHGYGJwc8LZYcuXRVoRl0cQzR2Ajo7xVyMNE7bIasI7N
         MoVcjhJqlIuOPBpbI2MPbHmDFNCqN9mD8xQ2BUozWvnJkY7Ag1KnmIsMaSOdn3/kOFZd
         bqlNaaawvjaFtMjIBocv3G88oqsxRv4XfWr/RX+g2roine6f8A3BMIrvHnyJ/GZfBS6p
         BdUbdoSKfRbMF1LJCcJxucyqzKzBYAw9W8BwivtDhdofAcnrZSqzO6TjIRtBOOc0DfCe
         DkpNHv05bhLNbNPnn3nHFjWXUXiJcHf+V2b1tV8Q9ovyFfYIaiw+Bb6uwCuHGgybjhCw
         gffw==
X-Gm-Message-State: AFq9FYLW5g79IzNBQKCm6ZBIlLkLdccQZeK5bllCoLoPEBOCDKM19aZs
	0zhXS8d4JYwNDnsFZUhY+mEKWouSRiEyu1yxGg8BGowB7Tw9R4CmD8qykQUKIYoj
X-Gm-Gg: AYBFou2iR7ZlS5MC8UIvSL52xFAilwImfJTUoDjraBmSHCwxV9RGbZ3EyxybZIzzFK8
	asGmzD1HVLxYhxQMTkZmDdBM7OccZfmxcqVb5EQxlxSdQsJY4RUIDkeaNvpCwQ+3CDoXKLRCNLn
	+kUxVdtnVJKfe5TuEd1bi/ns1wYBUKWumiIXNwpcZAzJLSHrX8KHTFQd0Br3NFlkII6Rhx13rn1
	VD2/z2rwWG3JABwmhcXyoPe30Apjewg/DqvTme2F7EUfz+6SVglwjhmi4QxhiC+zt01h/rFMI2E
	+/ANE2FFGYI7HUusirwwr0wLN7sNW/gzwK8NsjFHI/Y/ceTBYJZdcHlONOcKkzGmRDELRqqCEoz
	RLiwLbbBFR/Uf66XjPDWyS2YmB3mHLMwb0Yjze6G+JaGpmNUZ552gn5Vo7OiR34Y+lbg/k+esUR
	5q9netSBTr5amrpPMBgnRorGfnuUYSKPDGrkBx9UQydcTnGLl791Jpp9y5looX6IX5PB5LZbTRT
	01aGW4qybvIFv2/MDWY97vkURLj+sP5X+TqjVzTqPZfMW3dABZ3yLPmIjvCHAjj+PHiPeiXn8w8
	gfuZ
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a1fdd483a6mr69915265e9.24.1792617799309;
        Wed, 21 Oct 2026 14:23:19 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b63e35sm23271625e9.14.2026.10.21.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:19 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Christian Brauner <brauner@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH 6/7] man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
Date: Wed, 21 Oct 2026 23:22:55 +0200
Message-ID: <20261021212256.27961-7-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021212256.27961-1-gnoack3000@gmail.com>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
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
 man/man7/unix.7 | 101 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 67dd10cc146f..a4457508fd2a 100644
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
@@ -543,6 +607,42 @@ message, the
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
@@ -1273,6 +1373,7 @@ see
 and
 .BR seccomp_unotify (2).
 .SH SEE ALSO
+.BR pidfd_open (2),
 .BR recvmsg (2),
 .BR sendmsg (2),
 .BR socket (2),
-- 
2.56.0

