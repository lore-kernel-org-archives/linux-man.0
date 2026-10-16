Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0713598BED
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172025; cv=none; b=OEUbkfPbfZwp9X2cflBlHMSo6PtszZKovlZCm64h9XEJrUEFE9PFW3/weMG/gksiJ1nShQTKFxtrlIk7pkyOsgwuvRst8+AiWFRMAzxiUM4UF9j1oJFmKb2E22Guw9fSMEbaH6j6ulLxVGIhCXt/ppscRpfiyXTkUL8Rk4fK5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172025; c=relaxed/simple;
	bh=ClOY2RK7G9x8T0j6ZWVPcQCclEFCQlSb9tkRKN5fftk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=djjRWRNMTe/aC/P6Tefesq67ipMSECoRqOE0BfUnCT3/D9Pf8MV4iEuGbmUhBJG/Xbs1mimdZTvaiMbjPX7mv3G7eihnd5lLHf0KXODiY66R2JTF9cVtPIzJCdVYgTZXulDXQHJJj4Lb1XV/R+lCfe4fZz8QPltdtL/hnCmPMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjBitiM2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjBitiM2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso1889905e9.0
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172022; x=1792776822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fyi5ByfM1ZYpjVMi1ILSgIUD8MTxXMX6sHbrlS2i8hU=;
        b=KjBitiM28Uwcw0gwzjv8L/APcTN6s7PtEXvCv9moJjb4lqSCj+OWMMotYSw4ozbQQC
         YzfiSZFRNXdtE6yrp7ZQHd+L+bShQof19CpisLP2oH1KxQSLy47mQaNTzZhMiw3dTpib
         fg1DnQd+nfzL+jTVx6F1d9Oqbb71hnE9Qr0X0zoyhm2uPTIsjXOecKiaTpUPwzW5JkCb
         RBoj97imwVuXGNQCb23Lrf9amYFj+8Sd2+gJIMUw/L3LP15Di5wNX/7XlFw0PGfOXGzo
         aVo99nk2e+X9BlAY6i29f7J8hqUMj3oHijCaf5duTet0TtVVW4ZpGOth5MQhQNiykGpp
         ZxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172022; x=1792776822;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fyi5ByfM1ZYpjVMi1ILSgIUD8MTxXMX6sHbrlS2i8hU=;
        b=S5veGJRjclF5mNeWuj0mVDB2TbPQPionr6cqQ5rihJjJL9sclqLq9aGmdN0biY5lHG
         JKmKjuC66EGH0V4h+Agyjq/KBz42t9K/cU/bzoshOKHDPNDmuMwyCzFudLx2Ux9RPlsf
         wg5K6KO+X9oxqsAMcV4eg6yE6jJsLfc2wSpv15QShx4XQ/HwWn4d0SyKJ9O+j0swU8lc
         AHCJvRnXfYsHTs+bSqAYYMF6Cts9UJ19/2rh5106BgzO1XjRtfjOl4bmCC9MCqm5cWF2
         pL1yjKbD26uqEfKeg5rYkdNvZiTfPUNWuM5odCs3CEBxPCa2aaPmW6ugKHFGol733pZs
         G1Gg==
X-Gm-Message-State: AFq9FYI0qVQ2hxwbHvrnV+IzC9y3tKQ7KxW+YVw+V9I1M+ffm2FJsZVL
	oykJMiVGajZ2euhrpF77ZMbOx/jaMx5CL8YtI2WqPKR2ju8j7Ur4QZ38
X-Gm-Gg: AYBFou3FDgqdAxalSuttbNtQSiW7UdJq7qHAaahO3kN2ZVkfTwNhYDnFHsw6UGgpnBJ
	EQH/xn0S89Lmh/OvFToXUOA2RQUWMu9db5xiSe8oxddfq39XpnR+ztG5d856Z77fhj6EXRCecMo
	acILZss5ikHS7kiltQlO0sp/mPRKxI8NRApq5rWdv1HzF4rLW/oM/cM2rV/n+dA75Pv+c34pcBZ
	c4E+nOkBRvD7cIE9IyTGWh6cocTUDoBwZKjQy6yVXPbvN3SB04eq1+YtZ8psrD0DC97PcrTwLnF
	RdzhmoJyj2jpHZ+AFdbIjQRDog1M6kIFFlX9w/6pyaN3MJTpUe+/xZ/AkhzzBXc/6ef1udSUpuU
	udsU6TN9lYPsLZst1NSz+HZWlmVMGdN1P0CX84l09ERhgvCje8thVunTx9IU150lwwprgB/oluH
	arOXg5I+C6MqcxK3DyfpavW6WIEiZzQr4SCDnC/gLo0sHfrIrQn7BbxGnu5JcsAOu0izsrLkzbr
	WOx2kakhvN2GRnuHnRY578=
X-Received: by 2002:a05:600c:19ca:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1d75fce82mr10936525e9.15.1792172021925;
        Fri, 16 Oct 2026 10:33:41 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm55780955e9.5.2026.10.16.10.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:41 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH 24/24] man/man7/unix.7: Document SO_PASSRIGHTS
Date: Fri, 16 Oct 2026 19:31:39 +0200
Message-ID: <20261016173139.13076-25-gnoack3000@gmail.com>
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

SO_PASSRIGHTS was added in linux.git 77cbe1a6d873 (2025-05-19;
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

Link: <https://uapi-group.org/kernel-features/#disabling-reception-of-scm_rights-for-af_unix-sockets>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Willem de Bruijn <willemb@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 6283d455ffa9..fe3feaced07a 100644
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
@@ -886,6 +915,14 @@ or
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

