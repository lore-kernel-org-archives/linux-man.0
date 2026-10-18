Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842283876A0
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345080; cv=none; b=bpkIGPdOZ9DkAlj0F9ZW05vkeLkzsHuBU1CyXwrbhnLuAtdPRQItsg29m1s/2evob+6wTy0oLb9AyDvl79FP88ofD3BJzgPips9OkZ/2moA4WUCwqOEiv5+GJWnziMGvyej/HWquOq6HCIU0fb0FihIw6hTZE/4VS3f5qhetywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345080; c=relaxed/simple;
	bh=+2cGXJ+XIS4JHTLL+Lccl2FKj7C0/A/275tVXAY09aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lOOIHbhF7g7+XDvLPI5TB7HQS8ldRagqOdr2wBT3CXg/+F6sGVhVJ+bh91wgIzMT9q0dInbPb6NcOGa9UQvYkcqsx1GO2jn5BjxVsj3Zp1Z/cRmfQWGe7X/9XaxhK589BR+/iMhHadx3e9hk6f8PrfBCe+bbis3Z5KLpcSBlMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdjnXZzI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdjnXZzI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1141786f8f.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345078; x=1792949878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/N6HQXpcr/swddEzxv4p1shu49lLjcriKBP+PLRWnd4=;
        b=FdjnXZzI6RYvjQI9Vy46W6heFubLzmzldta6N8hIoMCUHkUcDgh/9TXNm/QRCjG+mr
         sVFuSX/1/QIH72gPuAc2UJXHW6+oXyH8i88AZ+8sjp1nzJwYHoM+Q/AfWbDq+NXoPax1
         Q307a5PJQInCa2/c18MyCwJSV6LCVaXMNicTgKNJGMXdpaQ1GoUQG2cS+EQUX+yMLj0H
         W/22GjRvrz/mWt61Swv5phZSBXj8DsCBA9MlYHMg0NT/LAc+TzivzbPZBmzr+66tD9AF
         EgBfprmUziQpEBUNVj81ncDEHjWmeyghMi/9sLUSHsUtgQC3Rvv1P+iQFt+VxqiegtY3
         pcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345078; x=1792949878;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N6HQXpcr/swddEzxv4p1shu49lLjcriKBP+PLRWnd4=;
        b=FP5q0wOdPuKqe/UvWSWH1NuNvn6GBt6By5kzbUP+kATcbUIqYUwCUtPFOOmC3cUAtp
         Wl39r6ZxrzhUaHdveesS7DFBPLXEbKSedCAiO4p3q34Ss+cpr8T/DaIYL4V+t6wtcY8u
         7gW1bc8or0Cb2SkkFmJnw+DSE+8aMSSR76Zs8UHG/ipHJ9YqBVOUfsSugquHCYhqonew
         D2RRp6yrBNK+FGN/FTxhghOomZf6Ju1TH50etyZELhjI9eG7YLIQ08ZrFQNy2rVivDNz
         6Q5EDPOxYhCKpCGLd47my9WNYtb9qPo6ENbUC8zT2opEBK5MmK16wtoQQ0QqjBN0Z5tD
         Zd2Q==
X-Gm-Message-State: AFq9FYIBu+pv+vMXGpu/Yr7BwQyO0j7EV797pm7p5s/a4ShhFN/SwEK4
	5q4W34wVFzzT4MGnjZnPgqTHC5++PAi7rNEkff9gOG7wUBIVdZRVhgRu
X-Gm-Gg: AYBFou2siopAWmW1Tz2oeWbMlnpBkHAxkurOQ5q5QvjnYyXIJuts8SsxPVyUh9DCGGr
	HyQPAsXBMcdt06rZ7O+EhXOtBuX1EmK5AyhwgV4KBWLpRMONUrVaiLR0PiWoLoUrLePJXZUGB8K
	6la+7FDZPGQ93L46rtKAXtLZVDEETNjfsoViBAxFcgjRBAxwuQ3UWVRsS30EbF0R0uKf7zPPAG+
	bcNmua09eb+DC5lL+bmWP8GrSBXB0QiZDK4vMd9urqxLJrNNN+sV6SjnZ6ZUOy7U9wYY7H+1JOA
	nwuLT9N4tsbYOX+phPfRBwq4CSg4upVtXvABqZROLsMqVV7l77jE6FH9wd6ZVBGuFZ9LvDXGLIs
	yPUdUpAh+JM/FC2Dih3jScneVAJ5RVt+Igt4Rg21JQIONmgMhOg5xd8iymJ69dIKitrLnXboyHo
	R2Z0G0vc4Bixfh59o+AV2XUOcq+ld+UV7DxifgW4/kKJjoCpTwBPrDaanr+Hfwp+yknYTZcNKb2
	0s/NApfFX4wzk3GgXPmyQI=
X-Received: by 2002:a05:6000:260f:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e07988925mr10782376f8f.8.1792345077613;
        Sun, 18 Oct 2026 10:37:57 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm17651046f8f.9.2026.10.18.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:57 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v2 24/24] man/man7/unix.7: Document SO_PASSRIGHTS
Date: Sun, 18 Oct 2026 19:37:12 +0200
Message-ID: <20261018173712.27670-25-gnoack3000@gmail.com>
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

