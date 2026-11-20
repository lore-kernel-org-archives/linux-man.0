Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191152;
	b=t10K/qYgbqwB/GbVGL3nNzauNI+R69crBhagGGtNQ5dLPuqB5Gh/Y6nqJb6utW8YQe8q
	 vEzaSEUbRA655BhRjjvhJSJ1OyiyNEpJBF8lMYPvxdnT/f9jYG6VN3Qiw1OzPX0TZ/gLS
	 CYfUaj/zPhnx7tRu5aCi/jaGTEqzjBxgk05iJ7a4q9Wj7yHfIH9yJ/sJYQeYK8OBAsGFo
	 8XdLRE1WjH28gOs2z8Sk2B+6TsEPoSsTB1mrgHeU2M7i3fez+LWa1pthojvOC+Cw2cG5C
	 tBCAFjy2jni13Te38YMiC4fn0DMUWtiNR9xqrH7Wga42S7ObffwUMnch1FRR9GYu7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=U7HrHQaMElKS4r0sB2P7GIQk0oSkMBVEjYAYdG5VoNo=;
	b=nKB/vrl2h+/yFA8oqOfhdqYkooUa3LlMIBAbLcTILkgWOtUZkVFtQsfVZ/iIEnir0FqG
	 LQEJ6uJo8o8F7kOA7OyH1VhX1hJ+Q2mBxLibHmHPnK7EQDVCV2qGX1SUXl5tIfQRgLCfG
	 4sPB1cnA0zpRLVVUbyBxcBLpl0qyQrQPrcT3WAYA0Kd5FZz9nZNX+RC/VAeG1TjP1ne4z
	 Dxu6lacr0Re3TmZgr/mb7hDkZDuO7RKfAhMwHW7+9fKl4uP1hXhs9IY2HqQKUFUmzc6Nu
	 3Zh2zWsu1aRiE5RhIgXxb4KC7TVc4xqNgTm8zpUisYtF1Ju/iS/tgkUPDoo83ZJBGrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFF5IpFk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E3606A331
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 16:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4E3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFF5IpFk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8449845e9.3
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191150; x=1795795950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7HrHQaMElKS4r0sB2P7GIQk0oSkMBVEjYAYdG5VoNo=;
        b=cFF5IpFkc4/noqReV/gqhrfO25jNWp6PogTE/T8mILtAP9smr36mmafX80g6q797Pe
         T48yqowx09bbvM4Qx8KiN3IFePZg/H4P/v7EvWeIR5rvvBOLyf/EhH+sy1zD6kXtv8n0
         sSlcdqAxmjUWXMONWKVQzPi60GX2tAZH31rqkQu2cejGX1FrfEMc/4OjPeQef6J3IAa/
         bCF7ZnlZmVn0dbGU8bugLvILBQhzXuGNxc+U2fNleNXvvqHeqoiyKbIQ+avdLTMMAHEP
         DobIqAfcPS5nJGXAZneFetq5R3Q//eaaAmvHRNkUfMmdOsn25Zkxyst3mvgCc58r3CGH
         Yx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191150; x=1795795950;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7HrHQaMElKS4r0sB2P7GIQk0oSkMBVEjYAYdG5VoNo=;
        b=aPByG2slUt8feJ09yUcVuJ38PWP9+5hlVddqj2DXWabquzC62O0BTAc8tocR6xdrts
         c4ma2ebQ0Rr5mfJV/R37xnGto7VL+44xef+mDmQ+Q6wR2a6y8UbWGMVTmuvzHWK4yp5q
         d32NOXMM1OwAibebaDFiZmGKFozvuAHFvhLAqxQgkASTK8HQdPprtAtKS9wLlnMdVq8C
         WRPpFBma7ifh3s8D1tTCbseFSAbtxLFAosDAgWu+hisxRRJI0OAcSZSjsy0WGll03Qzz
         Xbc1soWyKzFeWdC/yIwOQceym9rWWhpnv863TLjVoEPNMZaGemzrMwZjnVBR43JDiQFQ
         /0bA==
X-Forwarded-Encrypted: i=1; AL+hErFbFc3Ie0971xxiH/rKTljU2huRn60hNOo5vFnmTvlYpFfu+eqi3U0L+fNV64i1edFVL41GSgH/b58=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bz4j/7ojxoGZ8hFosBuS7fE4sO4HpsO1jqGfCTBhrp7nGzmqQ
	ZnD9YxUtAyiqxp1tubffcOVy2rOVSjxRryKBT58gGVco2izCMdB7HM0i
X-Gm-Gg: AYBFou1HyBsLz8M9jOf76HLjWp8OwVLwBbMJYhlqyFh2ktSWSeslpROfBPyFWrTziHI
	P7A4GMIQeVp0JqpTg03uMvyfCUl2CVu9Zeuqn1Aggzbn6X+jCJEedjaD78Ih1pAfHUwLgCCe2DP
	kt+Hlb7t5eBoxn/gZwt2VFrbmsUYIpG/Datzyx48+kO0q0Oqtl1efZmG1Lph8dy1a2RfLGOZBty
	c6WDrDBKDyYrbuF1SQgb+ixaf3La7m5xXHLkN+EjnMyW7sWqAqRHVUZVqintOKA4ymxuAl0Il/w
	eH66NBJ1k3NIR+k8oJtqHOqtGhciRf7npLKK/5dIkB9OtNcLOnTryrJQKC3c1i7iTxP5BAsA6vm
	LoMNQBBVo/bpQVelt7n3pRDd5ngKrt/bNNtV88mQnus1NBqtr8X5Qa5MlUp68IgT2ezWgcB1E9H
	Xgcch8TWqGoUsWBsFHw/sj7OWoIK7NJUd7J2xt2yshrwDFyavI4q+Xhx3v8fG84dSyvjMaotCim
	yj8nnK9I42R2koOnP+piJ2Mb8wHxtP9aHk2Uk4x3+PnDWuX3AvrVqCqygEt/1Scoa0fd/u3iCQZ
	J2R3Ut7e42+MTiGBHggowiHPUkIlb1wQGZ8fiaAuGdEOe3LIgeIkAnZ8DzcSxFP+ARkyGrqHd2E
	=
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr85326645e9.18.1795191150147;
        Fri, 20 Nov 2026 08:12:30 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm87149115e9.1.2026.11.20.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:29 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v3 4/5] man/man7/unix.7: Document SO_PASSRIGHTS
Date: Fri, 20 Nov 2026 17:12:01 +0100
Message-ID: <20261120161202.27163-5-gnoack3000@gmail.com>
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
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 22fd3b3c6738..0f014fcb1c40 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -337,6 +337,35 @@ .SS Socket options
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
@@ -874,6 +903,14 @@ .SH ERRORS
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
2.56.1

