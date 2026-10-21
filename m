Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617803;
	b=xmR+RUgTmBvkFFG6gsXuiG2m9IkOhT1vmMjCeRLfL9BqLalZXLy7X4szfm3QB9ofj2vA
	 n1sRU/laiojoc7nzSn/fGNJDNKT9iPkCoevNSqOKZVhfOz7u59LDio/D/kvxyh3o4BkPy
	 p0WWH2QdxEZ5GTqeJt5ErF2OFbpDzUK9WmZopJiHJl04VRCX8bmMKXpjamXM0ye/K4eS8
	 dBtYe9Ko9+lPSPUuva9DBfFFC0zaBP/3FPZQtlLMLRAw4rnG686hDGcp+FvgAgMtu6G5D
	 /mJxWdJ1ijNOqxFJ+Wf3t+wK7MO/JmveyVYImuByCwzmW35MLv2zHAeWnNyAZGUvpsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=f5Dg0Qj+luJy8ieWJzyLL7XNJYMjoGh3J0i/evPSze8=;
	b=B4wS1AcklD7SjM1GcoUj93bI7TweoFkKX/fi1RauCxovgNmH49VHZTo/UkILJTEWNoNE
	 Kce0PHoHPprkzjhFNZ0qCnFUvz8ykFZnhZ+nHZKRoz75aNT3Ey1Tam3KeIpZJRa+Mk5qG
	 CveFHIfq7T24QZcs9qdykijeYYFecOR07cUQmYG8QkRsk1iM2+S/vLj2Ut+Wy88C9R9Be
	 uVOOf4T81q5HGM2EAeTKpOVbaBdBpfFTBoM/vookzo3KPNjnfPNlhPk2tVrotCNWeO5xu
	 OREus9LsxvJCZN9vIgtEasB09L5eURLCsLK+UN9yfHSRsGrzmA/9vnVZZCh478PmmcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="HD/7iXpR";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFCE606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFCE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HD/7iXpR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso12169555e9.2
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617801; x=1793222601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5Dg0Qj+luJy8ieWJzyLL7XNJYMjoGh3J0i/evPSze8=;
        b=HD/7iXpRMCL8eGuLFS27+04B9hm5dKi1UJam4jtTQx5WrV8443fzzLKlPgUeM7N+KK
         9nE1nGeB7tTGkvMGqk1IYprsKZokhHOCNxgXdICV8OaWnxNUlCDW9Y0AR+pVBSYvK9nA
         Yd8r281fOFlGblXcDB0rIwvYcxYq4aqk6D3B1rXxTZhYAiO5oKNEFn2FDEWUaaiso4iv
         8ZntuIJ1aa5LFERHF7onrMc2LuNEGqGkfy/xEDXDlQUGARbYydYj4lEmBa7zw1y6j3HI
         KosmxkaKq/uTXgI08ud3oOG153sAq8UZ0U1Z8ysEWkpSnCpMvf5Act6ndKyRptYBeh3u
         XnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617801; x=1793222601;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5Dg0Qj+luJy8ieWJzyLL7XNJYMjoGh3J0i/evPSze8=;
        b=q3kAcrVaBqxKDgOsqA3zlvB1nJt9FUyg5LTFkJ8PVN3CkJE8wHRFQhm+mItjMYmjFa
         mBK4a945EXb1mpshx/PNnKXoWzBQwzYeqRl1Lrh945mPL2vi6r+a/UOrC0LqUuvEItzC
         GoyT+ydtR2UgAUZ+IurGHqADHouilwz3XV661Vhg33dNfe2F/tOgAAIsifSJYRdkxYWt
         464JxGzGJ7duQh+XmOr4iOWLaau/z1PLgPaiWq6w2sdZGGXzz1ZSxFxeF+taKBcPwL8B
         +eawDT3c6bcikfE6RujivgJGxZYbdoiSAPdOWIyOftYEhMymCMgzIzTCr/7HcQkmaRsn
         4mUg==
X-Gm-Message-State: AFq9FYLsr9UsYn8wddqW3mMVhmvHWoitcQF4nVQjYIsmRSkpvbbLkfBi
	R1uHD2TXVS/OI3HYEkozJPgOKXYy3ZinVpAwLvUyzMcOfFJuDEKPhhVe
X-Gm-Gg: AYBFou17dEgNch89+UULo0Ajzk+QwwpWM9URnm+Jlx+qPFhzENnKdAJO4OC1NGu0ncA
	uurGpecSR06WzqFWVDut3jAqgBa3DXJreM8VXOtu1o3eQa5GPnimjBH0zva0Vwpm4QXisyotOvE
	HrnyOskVSdqYkU/MksPLvynkZJ6YUU2CRZwXc+sSVA3Wo4FZoO5Xp8xb30fettO09zhrWBAGgEr
	B8o9H3ZYtye/3ER7WvclWiZkbocRF+3qBya/pqXt/gBpcMLrlA5winHcLZ0PjrA8hDlTcvSvBGk
	LEnEyrtoFADCW7GoYGQsteRTgbzcwNkJSQzeT4pa7qlZrIzWoU9v/KNaIACeJBDVyH6UPrKl652
	Oh56H4nSYxxEOzOWRiw+OYckJ8fWjDeEYetgv8L5GOYk6id1ui8+OLYNrwtVgosE7oRBTRSqzHG
	z7Q3eO8UTGssLFzUZA69FzqWDhqPcKENEsMCUljlzl8yfXXn96WwmNbDeYqwAWB/g4ZqoapaNIM
	XN0Y75rfRD0l/N0L/y+W3QvrMvMdNKeHt5KRhQ75/Z65c8KJZSCSoLyN2Lu6Hia+RO+J6tiPIwX
	L4mijKvCzN1m148pYcOT/4hULQ==
X-Received: by 2002:a05:600c:6304:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4a1fdd46423mr66257415e9.34.1792617801044;
        Wed, 21 Oct 2026 14:23:21 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a56ac9sm20245175e9.14.2026.10.21.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:20 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH 7/7] man/man7/unix.7: Document SO_PASSRIGHTS
Date: Wed, 21 Oct 2026 23:22:56 +0200
Message-ID: <20261021212256.27961-8-gnoack3000@gmail.com>
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

SO_PASSRIGHTS was added in linux.git 77cbe1a6d873 (2025-05-23;
"af_unix: Introduce SO_PASSRIGHTS."), in Linux 6.16.  It lets a
receiver refuse file descriptors passed with SCM_RIGHTS, so that an
untrusted peer cannot leave it with file descriptors whose final
close() blocks for a long time (for example, a file on a hung NFS
mount or a FUSE-controlled file).

The option is enabled by default (unix_create1()).  When the receiving
socket has it disabled, unix_dgram_sendmsg(), unix_stream_sendmsg(),
and queue_oob() fail with EPERM if the message carries file
descriptors.  The check happens at send time, so messages that are
already queued are unaffected.

Also add the new EPERM case to ERRORS.

Link: [1] <https://uapi-group.org/kernel-features/#disabling-reception-of-scm_rights-for-af_unix-sockets>
Link: [2] <https://lore.kernel.org/all/20250519205820.66184-1-kuniyu@amazon.com/>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Willem de Bruijn <willemb@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index a4457508fd2a..1aa223b2c79d 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -343,6 +343,35 @@ and returned as the result of
 .BR getsockopt (2)
 is an integer boolean flag.
 .TP
+.BR SO_PASSRIGHTS " (since Linux 6.16)"
+.\" commit 77cbe1a6d8730a07f99f9263c2d5f2304cf5e830
+This socket option controls whether the socket accepts
+file descriptors from its peers in
+.B SCM_RIGHTS
+ancillary messages (see below).
+It is enabled by default.
+When it is disabled,
+.BR sendmsg (2)
+calls that pass file descriptors to this socket
+fail with the error
+.BR EPERM .
+The option is checked when the message is sent;
+disabling it does not affect messages
+that are already queued on the socket.
+.IP
+Processes that do not expect to receive file descriptors
+can disable this option.
+Once the file descriptors have been passed,
+closing them is the responsibility of the receiving process,
+and this may block for a long time,
+for example for a file on an unresponsive network file system.
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
@@ -893,6 +922,14 @@ or
 specified a datagram socket as the remote address,
 but that socket is connected to a different socket.
 .TP
+.B EPERM
+The sender passed file descriptors in an
+.B SCM_RIGHTS
+ancillary message,
+but the receiving socket has the
+.B SO_PASSRIGHTS
+option disabled.
+.TP
 .B EPIPE
 Remote socket was closed on a stream socket.
 If enabled, a
-- 
2.56.0

