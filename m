Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737370;
	b=apQnp89c4N4R3mZlw4gx5jMkFCgbnHUapWtH9aOId7paVESJx7cJhouNtpMnjuqn2ew3
	 CScgwUIEIX6hA/DF/BEe6NpKgN2pKhwHsJ6B77DaeLSWECUo1QprVqfk2fkLye2kpLqRx
	 BBF4D+y3VQf54gMAXip3GstaLkbwH2jIgQh/UAjthqvpjPYtnv17tq5XchDhk56XiW7kb
	 kvDnFd7bCIaR6aaDUS9MnQ7dRIWIRQBwW8iD7tPpKhapUiioqH7Cflp2KrzJc4D6wdMmD
	 lvTt/qc6dX28MP1N/MRi8Pqapp3WtxwgeMW+uhNDQnoCLeh2LjoSDyQ+db8raid3PsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gTaPDqM4NymrsVkOfbAmC1yvFSWep/AI2Tz8UplWfzQ=;
	b=4giMzvJj9kCnylCX1xc4yR7PWE8GeXILhyJXubSpWKM9RJXgm2PaYVdrTgrSzPrO45DC
	 jVlwt4U+VQ/wfdDyf8Og+r0tuElcRD73npnaqf31mXH064FhgdjSeGc4tPzpOB8zCeQX9
	 XW3yu/jOC+bCID6zmQOpBqtQpuKVza3cbT+Epma9FJ9pFh+kStB/Z6o3AfvpxlBEXTOVj
	 3JzP3IKByF41AK+fcOArdib5dHVz/Eo6yLhT/kNusBK6nV7lunTUSYc6TLGiH9+KE096K
	 gRoySkvAWNiDXJ46G1dIjf6SH86R5LMahJvGEdtJtbi9KHsqjjeRif9mq3+okRTJkvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L30L85BI;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950B606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5950B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L30L85BI
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so29506825e9.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737369; x=1794342169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTaPDqM4NymrsVkOfbAmC1yvFSWep/AI2Tz8UplWfzQ=;
        b=L30L85BI8g85F+ZOvIqRWAc68b90FXms3GUuQ+j7Pknt3sLB0sPDW6nHu4h6vrVZ5H
         nJW97JvWmNHNgKq5M3yo5rhUooqG+SUj8oaJT4/l8Pq8qNzSwDW01bltyLP7n7CeHlKI
         d7t2LE0byQObz6dyQcakFet7wjLJzwVq+XBFaXmom1FfYBvC2UpOuQcybvABvlBh2eZm
         KTS3yYMeEN6eHHmChIHCBHa1CQ6RDpW3JrTjVGTO8haVRnXuVWzyPxJma7sRBJ+S+KV0
         TCbwR2xQeAIvexUruGHkX6P/lSTCrcSFpWrZT67NCWvMAwU8v2U+eEwPlmwiPsbKsyAi
         KfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737369; x=1794342169;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTaPDqM4NymrsVkOfbAmC1yvFSWep/AI2Tz8UplWfzQ=;
        b=rwYZwYWE9yZ01idKfrrfjmo/HEasHiA+rer6pVFTiJ5M9Pxa91RFyNS9ASc1bTC1cl
         iw7fnKaPfHq+nmKLF09h29Sn4UjYpzn9aS/sdNSzZ7xyZT4pyy2CJCSeznJJLYYO6Xrn
         LJpsDl6bpEIjRPm91oSMDStHBgRkVDSuYixexSqpvaUIelKS9gl0RKjm0l9Ig5p3PJUf
         tJWzq451ZPU8Q7be0Ut53IjObollljOaniUPs8PHvrPWWSSqgbcVdNLPPIBDZpGDBb4u
         0H6wTVw/sJb5KDflIFqIQLXUBneQc0oYmpIJw14QTMzAKgVHn/MWEaqj4GbeJIRizJqA
         P/kw==
X-Forwarded-Encrypted: i=1; AKwUvBz4CbygGfqm2y2XG1AHfA90DIo2xQw/SeMdYKBcY4U/pu7oRzKSxC7BpzZ1C9HuiitRxD8ggDPCBok=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D9bf87ejc9OzhJSKRlPVHnxiBHzvjtEpFeGudLuKnnfaSBM8R
	bfxT2AeNYM/H36oWYF9xwaaqUPH+Oqh+zXlEVTD/rzjUyGd9lUKeHpE1
X-Gm-Gg: AYBFou1c5ATJ8PCt8Ju/nF+YsoCFGj9eZrv1Umd2BtpPJBM43mw1EVLP1OZOKJdibHa
	gGxep7guQWZLAqIMCKMBhzh6TGwCYc5DCOM/3bwELiXfNoaKRewGwQwudMEpLbIPOjYa5TgNoI/
	OcJQm81Lo/n9h99ypvrwRdqLBHuvHiA3sphjl31vn//9rwDznygVxi7oW2dPtC4VeMCbe3OkU5y
	CfOVXkKRLjRML9uu21XDpIYXgLu2vVEHGS1OaE8jLEHZdi1+9RKZsFdgh0jT/TIuWnBXC9DnrOT
	G6SkxFlmZvJohB72WgZMHimA+C4hom8P2jjlbX99Vg3GJezFQknsqwv2PKrEg+SArdAucrHFKIj
	Fbi14BGeBIQCNJv/RrMD4qY+XONRJwxfdzyFo7dlfFB2USgqO/TGVK2Hj9V3p6X8oHGhhsTz5V/
	QXVLgi42CcXTyAFNt6jQipJDaWFXkhrCUo6sa1BKk6qf/X6fWnFMma1//Go73GSinfbpKK/jevJ
	+SMPAJWwqCI4ckuWBolWQGhfxMGPRyebHhL8N4GTxkw+hstnk33mitpmyqjGq1ZM9/kRPZgr0cU
	RRAND2/OpyR66EwU6LJIHk2RLqM8Bk28xCaXTPQwhW3vWqQFeEBn1g==
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr317234755e9.34.1793737368602;
        Tue, 03 Nov 2026 12:22:48 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f88sm5494375e9.0.2026.11.03.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:48 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v2 7/8] man/man7/unix.7: Document SO_PASSRIGHTS
Date: Tue,  3 Nov 2026 21:22:09 +0100
Message-ID: <20261103202211.13820-8-gnoack3000@gmail.com>
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
index 140e77ea12ee..1b4cd242657d 100644
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
@@ -871,6 +900,14 @@ .SH ERRORS
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

