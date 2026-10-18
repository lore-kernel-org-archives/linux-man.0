Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D237DAAE
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345048; cv=none; b=uOs2AVThS6YWOrhx1BSzI6PFtdX23zv8dBn4Z4EfTFNoJ1NVid8QgDwrdct8Q7LzXDJCoEMuTDspMevi6TTM8cgv7TI3iWaBcmJPUBC5hXGb5SA1+v5S/R8EC93A8lcZc43MCqUDVmwCARj6GcKQOIEFTkQWMZH4WxeKZN0P0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345048; c=relaxed/simple;
	bh=jyiHHwzL+5emPikY2icHShE14AyheuStA77CwJnf7rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEYLv3h8xqkx7Z0p8uwI9s2uhOvwEjVf+S+XOuh/pQt0LNlU8egKzdB63PkDp9VeQPt3Z8qfVbSq8MJ8UTtKB5X4P/j3dFDASEjj3zQQuxYCS4vgFUaKK8y5kZsXwAoOzltHrCbNb/kJUprleZwdTMSwh0eiI6u7WhynxnPlrVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws38Fk+Y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws38Fk+Y"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so941736f8f.3
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345045; x=1792949845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1262nuMGYp0UJJFi2iDIACSyvWk50Ykvi3F/xRa21bA=;
        b=Ws38Fk+YlCOdXO0N8HqEKCjTZc/HKzETDD+xx52FPcOMHxaQZ3hoHMzfkk9VGYiGfZ
         4dN9FMdzD2cAqA1oc5Ok4wAcxOlix2S9la20CH9DvQMNgXy4oBwNQ68roeCs23zogDMh
         WXz7wiUwY1/mbpDn8a8bov695+/YQrxtjwQfsOXnjE0Mn3j5VktZKttGnlVKoDPkOZD1
         CJI0Q/HLUrSHB6j/g1fRHV+vxQEzyqf8weNS1TpkkoH0wcj8XyXrxhWGmRgWOIrr/Lwi
         s2AeMtdMykihVFVP12A8eXPQfYKa4eCXNx4G20jWq5L8qrphwghif8v6zd2yuzodaqHd
         9+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345045; x=1792949845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1262nuMGYp0UJJFi2iDIACSyvWk50Ykvi3F/xRa21bA=;
        b=C8IHe8j6VynOAWHTbBBt2m69lRYc3TvcxVXT2Z4jEHScXtk9XkfD4P2698ybjXTT2y
         D1ZVcdA5oDgvD1DeJF6Bsb2vy8XqheIdBk86tmoGjpxsj9X+ThmxqDRGTiL5orHG01sE
         8Ec+ohU6XrifUCc/ZflpNZDHLrUAYQX9TIYt/06b1awuEGJTwNtikcWZK+kOow/ErsBG
         GOqtwgdkfB+Xe0odzLIqu1q5CtnbKDMMcoBMoBifWCIA32sEBlMmfYwQWXXt/sXVR5Fq
         3zMe6cX5iS07wvu110kuGwK3GWjtdPwIMmM+kZebNbJufHWaD4A6wZ+h3ioWkgbU6smy
         jTAg==
X-Gm-Message-State: AFq9FYJXuR6gaZ60JC4tKRJwsxpyJLRea0kUCzQI5ooZUh+FlgOHYG9d
	+6scOiJoGcpgRPATjfzMRGdTu7yc0SgBlcN80jYgBBDPPfulzeLJ6zcN
X-Gm-Gg: AYBFou1TTtoaSUe4XoKDvzjEjvlrZtvSDQDjhI/JHNRyx9Qh6sCyXlSOJx3+DQ89Tq4
	/Comv6YD+cVhK0/bCBsuHB2ymeJvAbM7GA19483L3NOBI7Slr3a4DJxE1psoTVYdkDjoKslDNR9
	uOEmTIOJmeZ7BjKcIcByEBrfBXySWq0+4tQwABVyy0cmGKfUcpTtcKLh6GzV0gXP+OPaUq+Gt1d
	XqdkEwoBndzbj6qNDc27t/5A0mzhc6G50DVwcnyweLBYYEzWBeIrCrD5wCfvhZyqPF8TJEhO7/8
	xsBeA5wYDZNJ++t9qaVLEkt6ylqz1Bm8X4bygVJHgpLf5TFA4eISvDIlAkVx4p2UEYbHPTPCX+v
	GZ+SyB1RE4hyEJLP45oVuk1jyj1PmyQ+wTJ3hdcG0IIhmdj8zCAsfnMROe2kKAlhwrxuyaVfZHr
	Rza9AiSxBPm9KaGnDb6uiFWlRixslVESQt5/N5cTCAIwjzLyQorMgN7ast7zC62TGPYgcie8mIh
	u0VivghJhgW5KoYG/Dv6x8=
X-Received: by 2002:a5d:4dc6:0:b0:487:1575:ebe2 with SMTP id ffacd0b85a97d-48e07fa9d89mr8009750f8f.44.1792345044936;
        Sun, 18 Oct 2026 10:37:24 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm19313936f8f.41.2026.10.18.10.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:24 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Pavel Emelyanov <xemul@virtuozzo.com>,
	"Dmitry V. Levin" <ldv@strace.io>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH v2 05/24] man/man7/sock_diag.7: udiag_wqueue: This is memory in use, not memory available
Date: Sun, 18 Oct 2026 19:36:53 +0200
Message-ID: <20261018173712.27670-6-gnoack3000@gmail.com>
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

The reported value is equivalent to what SIOCINQ/SIOCOUTQ report, as
also discussed in the commit message in linux.git c9da99e6475f
(2011-12-30; "unix_diag: Fixup RQLEN extension report").  (Those are
socket-flavoured synonyms of TIOCINQ(2const), TIOCOUTQ(2const))

In Linux code, the reasoning is as follows:

* The udiag_wqueue field is set in sk_diag_show_rqlen() in linux.git
  net/unix/diag.c, where for non-listening sockets, unix_outq_len() is
  assigned.
* unix_outq_len() in linux.git net/unix/af_unix.c returns
  sk_wmem_alloc_get().
* sk_wmem_alloc_get() in linux.git include/net/sock.h reads its return
  value from refcount_read(&sk->sk_wmem_alloc) (with some technical
  tweaks).
* The field sk_wmem_alloc is documented in the same file as:
  @sk_wmem_alloc: transmit queue bytes committed

That this interpretation of sk_wmem_alloc is correct can also be seen
in the places where the protocol-specific code adds to it.
The UNIX sockets increment sk->sk_wmem_alloc as follows:

* unix_dgram_sendmsg() and unix_stream_sendmsg() in net/unix/af_unix.c
  invoke sock_alloc_send_pskb()
* sock_alloc_send_pskb() in net/core/sock.c calls skb_set_owner_w()
* skb_set_owner_w() in the same file increments the counter using
  __refcount_add(skb->truesize, &sk->sk_wmem_alloc, &old_wmem);

Fixes: 4f6a0a4a909e (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
Cc: Pavel Emelyanov <xemul@virtuozzo.com>
Cc: Dmitry V. Levin <ldv@strace.io>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Verified in kernel code; the udiag_wqueue field does indeed have these
    different semantics -- it's the data already sent, which is still
    stuck in the output queue, not the maximum size of the output queue.

 man/man7/sock_diag.7 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index 35a6d5a80ffc..8f8b28b4404d 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -248,7 +248,9 @@ the backlog size which equals to the value passed as the second argument to
 .BR listen (2).
 .IP
 For established sockets:
-the amount of memory available for sending.
+the amount of memory currently allocated for data
+that was sent on this socket
+but has not yet been received by the peer.
 .RE
 .TP
 .B UDIAG_SHOW_MEMINFO
-- 
2.56.0

