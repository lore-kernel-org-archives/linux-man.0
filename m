Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616902;
	b=JL7BKAXpGhmdD1Q7V3sfwn7s48w/atRvfioiMAqkEvJXrF6C6DM4gEF9lBr1sYddS/wF
	 VtfGJlOCRgqn9i5N1P4cmLNqE+LnMy3+0Pd/P/V5ctomzSx4o/AkR2elBqrXVay1PlMnx
	 uqT/r66ZESwrzWcOiObczLwv8Er6aGF21y0s0Lk4ynXEkf7ZxlCD0FL52IcbuYq4HpxZl
	 QJvCjSvslizE6ii3sElgqnGhsMdyg3CqqcpCBLQpWqV/qrni3OVMoMTgOkyBNyOPjMxtc
	 qCr5PuaZe5zCnO0EvUajfSLNM96EyErX3o5wXjmiBbrCwEAYV+IT3Rexg7xgBcKxFFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0luCcFCxU/WJqdiFwVR7vBBd8SDPvZ+TSqAW4xI4TV8=;
	b=cmrpL2qa9+lZZrOciPAfBC1BqzylQBWXlsOEJt1/fU/GumE6e9wtdDW0vV1I6fs7oy2i
	 QZgRieQ6DjIUm6fo8Y3CvjG7Uo+IsANPuooX8Khk51ubAoBFBw9K+hLS0YPZDclVzI4EN
	 e34ki1hDMb8tnwZ5/f/TDS7Xt7UVlhth6hZi/VpydvfkR2RcP6L8kZURzpZ/33JsYeZQ0
	 2zeI2rhBmx0CHbzR2XukY2LlLqf6rFTmxRHMBBQP96/yGqCyV/1DnUt5Yv6MsJcn1AI+V
	 l78cww8BwUICVgj3ZaLQxlLdXDH9ImkTy+OEjujoexwBC/+lWAwfqXrhBDFC8NFgy4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ELx65Nar;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB74606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB74606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ELx65Nar
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1169407f8f.2
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616901; x=1793221701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0luCcFCxU/WJqdiFwVR7vBBd8SDPvZ+TSqAW4xI4TV8=;
        b=ELx65Nar5pNObHQwFCxKT7faRYP1cvNViRw6tlAvFreTWN/tUjko0084OdSn8S9/xZ
         PfzV89dZB4iyah9RJmMpHo6aw+3SiACS0eDvfgbaaknp3JGhR2nIwrlsc3UEEkKMNsAJ
         bHlNcguYXvUsQ7g9pc0iEJ7UMKQjWEmB7jnjhqpl4NtDg1zeMwSa+OivyRRF4q/p8jEi
         DxbzqWRI6LzW53DnAl1SG7pSGH0fYEyBif4LfWLZB42yTe4tkItOKYP+v2FzbPXNEsy8
         sgRoBtk4CfRaBH6bFhqt7ZO8ySAyzbwvO7i7c1VC9lrcGBg/vqLs3b/6yeFqTAewTVpb
         WQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616901; x=1793221701;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0luCcFCxU/WJqdiFwVR7vBBd8SDPvZ+TSqAW4xI4TV8=;
        b=Ks7Ys24riktDvQn923EoXEhyQ0MmoQVFbkwcun1QJCI1cJeGzJAy4D9QQGv63y3ZQ2
         HBcm4MEji8oVRQhfyEH3Ur/ETwz0UkZpmqTjHFS+7NEle0KXJjmEUoIJoAU1dj2juKX5
         bdQGYTLMz539RihpZkImHOMF8HeU1HEKXJysr10LhAXoFVv2Q2llY8NRUdT0F43qMLjV
         bO7Tu+mCsUVCc8+Aidrka5aCaMNjrbECojq+04eICU157dVpxsMc0V+e3TP2jon7K3mh
         tX5sH4ha6guD3/Jw0b9ATtmyNJmKnlTO8Vd2U8y9uVcT8wGqJhycJh2nWiWwlLs0Kpog
         RWeg==
X-Gm-Message-State: AFq9FYJDdvGNkEFG0TUepqOipPyppYGUtiaaAOzJ6GSQiMGvjGSDSV2F
	VPkC3P4ZmU0AI1fRH5zEOTft96IbjuxMT2IKorKCNL/HURfjtXk4YGvY
X-Gm-Gg: AYBFou182V55C47Bpp2TTy1CX48RjH4MofF6Nn/a7l8fay9F5JWlVdC/9k6VFx7qc3l
	4a1yQ/Zd/gaP5Gbl6Ezywny+wHn8xiIExnYBuxEZapACSPhUMLbtxqHIPxFdNjoPTEInj7acb2I
	dgdH2eFLf9BuzyF7ngpJsiVJgtm2iVfiayEjn3nP1fqUklqfeHvDei8NIr3I/fFIldLldG/rsUf
	p/QpT/1/tf/qA9t5YEP5p9gcZvRPnxGyOCYoLWTWmD/LIy5nEeMpiuN28t441vfqvZikqpWqSIa
	ua+PCnxJf6TXpC90DyLs1ctzgwb6U62XwTwW75gXBlREGSrXUMrjSisdBUjPyNsdl4ofW1y4a2p
	ADxM8VfelRSEKlZ+yFGkv90F8SwtBYDv5GOr//eKl706yT14IydY3MqIF9JKaxyHdOGTZlYGmtw
	3+ogye3mOKNnlGblAPgTeP3kWFuE2KMOWJ7ltpYyk57lHfiIhkTCiJM2s1gnjsJ0iF1V+ZzAqcV
	+wMoLa/XWsi0kNW3XdbzdNu3XtYv7lAeFguNMPCJVKGInd4o6FDf0/7PBxhamWNWT60FYNjzWAx
	a1wxtAu6UOGaYqWD2Og3qGSZkg==
X-Received: by 2002:adf:e00e:0:20b0:48e:1e03:687f with SMTP id ffacd0b85a97d-48e264c3ffamr4961607f8f.31.1792616900591;
        Wed, 21 Oct 2026 14:08:20 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25833b9asm8278588f8f.33.2026.10.21.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:20 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 3/8] man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
Date: Wed, 21 Oct 2026 23:07:55 +0200
Message-ID: <20261021210800.27338-5-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021210800.27338-2-gnoack3000@gmail.com>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
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

Document the SIOCINQ behavior for SOCK_SEQPACKET,
which sums up the lengths of all messages in the receive queue.

Restructure sentence order, so that socket type differences are
discussed in on paragraph, and commonalities in the next.

For reference, the SIOCINQ lookup is implemented in
unix_inq_len() in linux.git net/unix/af_unix.c.

This function first rejects SIOCINQ for listening sockets with
-EINVAL, then does a case analysis for the three types of Unix Domain
Sockets:

For SOCK_STREAM, the result is:

	return READ_ONCE(unix_sk(sk)->inq_len);

For SOCK_SEQPACKET, the result is calculated using:

	skb_queue_walk(&sk->sk_receive_queue, skb)
        	amount += unix_skb_len(skb);

For SOCK_DGRAM, the result is:

	skb = skb_peek(&sk->sk_receive_queue);
	if (skb)
		amount = skb->len;

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    I double checked this all in the code, and quoted the code.  Both the
    commit message and commit body were substantially edited based on the
    initial LLM-based version.  (Nevertheless, I would have likely missed
    the inaccuracy if the LLM hadn't found it.)
    
    The LLM initially just slapped an additional sentence into the
    paragraph, but that was mixing the socket-type-specific concerns with
    the general description -- I split that paragraph apart so that we
    have one paragraph for the three socket types and one for the
    socket-type-independent description.

 man/man7/unix.7 | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index d0c1765dfd79..4c46b54206a5 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -606,6 +606,19 @@ can be:
 For
 .B SOCK_STREAM
 sockets, this call returns the number of unread bytes in the receive buffer.
+For
+.B SOCK_DGRAM
+sockets,
+the returned value is the same as
+for Internet domain datagram sockets;
+see
+.BR udp (7).
+For
+.B SOCK_SEQPACKET
+sockets,
+this call returns the total number of bytes
+in all messages queued in the receive buffer.
+.IP
 The socket must not be in LISTEN state, otherwise an error
 .RB ( EINVAL )
 is returned.
@@ -625,13 +638,6 @@ defined in
 .\" That number is normally larger than the number of bytes of pending
 .\" output.  Since this info is, from userland's point of view, imprecise,
 .\" and it may well change, probably best not to document this now.
-For
-.B SOCK_DGRAM
-sockets,
-the returned value is the same as
-for Internet domain datagram sockets;
-see
-.BR udp (7).
 .SH ERRORS
 .TP
 .B EADDRINUSE
-- 
2.56.0

