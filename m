Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737328;
	b=ymKuxubhCAVwYtHCZWD4fyobrQ4Cl0Apceu+LJsVf1oYpUAyXGBLRr25L8CBMU0lx4jW
	 5DGhrHTadHe7dZV3EYh1h1DBHvoVaiW3ZQOmzoMg+GwVmm2n94PkOq725vGOJ9XWQ3kNh
	 4piNdoe+vVpeQ4gWRaz3qAWAZUj7zCLKDqo5xLXYOgM90gAv1GQDQBklKxnfPeX1mRdHk
	 Kq0nNwbmRPzANXjF1DRuh9MOTsuloda9hR7l92amuco4Xb1pF6mKg1bQZ0MNpSszHUF8v
	 8FznMWKMjQIIbX9Ba6vMB2Twys45/3kYHvrxuvQ+Je/9vGjcc2S6BoMniUCPkEejhTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GZwCEzX6qoKzpL2lusDDg1LvRJSiR7eJf+gJF13HmGI=;
	b=ClQRTRfB8GQf3ZR8AjkyGjfchFD4KrbugxB+O4L9Qcke6rD7PK+VPkiOHOzV8URtgJ+u
	 38IRh1gC5xoLvljBLRNwZRkCAP9M3OtxaJaMT2ltZhzI0MaIfPbK4FchStpyxi92ZK+yx
	 WaA/R/FpPBhIACgBJ2OPxSSQCAfpmHtKtZd30lxTCQli14QcUWnONzawNe2yUqQ3EYGvr
	 LGn8L/EvjgJ4lFQ1a6w4HhI+mZSciDxKuZE0GkvuovaFEUro1s3xoTfJyuJ4fLwm/Btij
	 oEuvEnRgrb/MG0AneeCuloI7/4+Bi5Mg/0/pRtul73Nrgx6/nVwABxuimI1j/8MV2fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qhSzNZ6r;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F77606A32D
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F77606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qhSzNZ6r
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so49114675e9.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737326; x=1794342126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZwCEzX6qoKzpL2lusDDg1LvRJSiR7eJf+gJF13HmGI=;
        b=qhSzNZ6rQJi2eo77TkVfD5VD+b9D6z6r+Xu/EFYpY2gGcBTQ5l/P7btcP1lY50JjbQ
         45Uplg7KVDDcQIvHfcWLIy6x6iv8MzkWUehpYHx/6uRMkSUir/8HXwBkfvBJdU2Cwtla
         dwEnRBb9V2oJEcQATMxgwN2erIb8jkYnPkGpvF1jKJwRDnTq1piA5vCCbrFRMtTbfmyu
         S0VAi8t8RmhZheTkPH88u99FlkXNmCyEldnU9Sd7ghB8zUDZw1/ixvM23IBTGddxUtyK
         CqT5OD7RLy/HtY1ViIOx1GxIHEbYXCzXpccZqoFg8CJ8SazStU8rI1+bYlY1kEDYqFUY
         d5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737326; x=1794342126;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZwCEzX6qoKzpL2lusDDg1LvRJSiR7eJf+gJF13HmGI=;
        b=iB1o5a09F+FSDX5gRUX9cud5S3BJ9KAaIGqBMgczquanBurBG11IjYqqOUtTQMf9Xp
         LSOebagiGype33onzIiQDPC6QoRXVFaOW1vhdOiDwCJokntX04cUJIcUbF6SciKJW3To
         6WDztvqXB43PmJI21V8eDyAZoNHbI8O9gKvA2wA73bx5CgNrEYHcmmqlBybn+As6t46o
         wy+nfLUYrAc7mz2xgj0P6vGeJ4uhZzLUPZHoKrNKUVY4Jq1OAe8/7u95z3Idw9izQ8Pn
         B94PFWycofHQ45IS98o20IXW3DfI2OVK5g9rng+YMp2mOPd2z0xCOAuhuMSI30WpimO9
         AK6g==
X-Forwarded-Encrypted: i=1; AKwUvBywcEWSNPiF/0EuEuyc8r8DLcjuigZIoRA7NDGeFC0TaIKZA90mTwOF4GMZpql2dJdXBd3svOCxX3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YTwAi7qdLYUzPChar9++HaW77b3yReh4j/I+Pkz7yq8Tuicah
	R+UBTwmcOONU84QCm9wUMI/9SvEXBPXCbgn3rAZadQXKVWV3nrcCFTEZ
X-Gm-Gg: AYBFou1MvNIPv2y5ZOf+xeWa8yTJ/Tb+B+A+3qzSytWPjynzLiZDcD5VdpLIFivt7Sf
	SYUdakVhz3PW56SgQU4xbhB4GIETdFXGkiTgujY3uU4G6EoyGL1im61OR2/0d0KvIOpFm0/hsRX
	dBZP7KUUmiunF+Qpm3C1kPLYHjjlefw0bxMkn3w/801U8oGHGbiJimvWEzthaeuTQP2Qiyy/CdK
	5vwTMGuxP4Ay9EAyTmqcS9SywzOYqfQ5kZhEJXG3SE2vHxtVMryBzia/YzIjGPuMY0t/mAg3W8X
	AQd9Eu+FrymLbIIsnqnxJS5Mf1FbNq+Rnn7N/kLoqN/M53SGmSSK+DmYZebQ0DyGeOY8AQ2Pg6O
	ivV/3DHSA87LNJFdW5t2Fm9GoKqR9BcXXtHm4tD9U+5/znvG97xdS690ywuRv6Ia9BiPkzeGKrL
	JwyDYtE7LhtZHRCJgJpZvONLb8G3WwPd+G69T2qWXLHEi+fUdVajgmMserkx2AvssvsMvF172qT
	hrdTwIn7MzvyX0mny1+gy2A1sjen90Fv31XIxyRad9stbekWEPpjky6Cezkl7QgASdWWhedKaIa
	pQQyZ2rAq/6HcKVMC67GSFxq+sF1ivH+HV/8GYdLIguorR5/717krw==
X-Received: by 2002:a05:600c:a41:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4ac18c73d85mr311197515e9.26.1793737326210;
        Tue, 03 Nov 2026 12:22:06 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm124502575e9.2.2026.11.03.12.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:05 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 6/6] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC, and EPERM
Date: Tue,  3 Nov 2026 21:21:36 +0100
Message-ID: <20261103202136.13574-7-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202136.13574-1-gnoack3000@gmail.com>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
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

 man/man7/unix.7 | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 762bf0d1fe08..2163a91514b9 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -645,9 +645,24 @@ .SS Ioctls
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
@@ -684,6 +699,11 @@ .SH ERRORS
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
@@ -695,6 +715,11 @@ .SH ERRORS
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
@@ -706,6 +731,13 @@ .SH ERRORS
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

