Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800001;
	b=5snrNyfoN8VLo5X5Xqs6HpP0PQtvunyrtALxtHS/CllvBo9+yAA68nK7T2VCDDbflKUQ
	 SqZUjTJDQc6/rPj1852pcGMycjvVB4YSVjYukTkL/JbfojfRsFZFjcz6GI7+7/0JU1xcA
	 0ZYN8Af0gug141WafEQ4X00/lWIA6rTFudzURTwR64Ip2chN0hbeuY/0ftubJis9KrUky
	 3DB1ydaYlFSbIN+RAbUymBSvCAMtN3eSKyux6/T9GcjBgrsHdYC5CXiOnYGa8zaY44oXy
	 nF0V60hHFbZlCOHqE/RDOtI2hkwluMx9vyMNgCikLf2y7yBJm8jRhruxgu2RK9DPMOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=nlTtnR+wCpHl9FSCHLEGv7xGmXmxOT2nZcPf4/lr2y4=;
	b=1hNJaRuPpezF8+8FHYTFgbMHSNVApGwZ3LAtJlr7f62O/OfCsQ+umJKNfWKQOsmdEjpQ
	 cfFLIH/FgKIFcz3cHJ/rKgXuItnO1y78dWZhbEPKk5uzQvztqEMtosxb7ftzMqa2QeYO+
	 026Lvrvwx29Mm3gLrmcfY3sNbVOW4cPsFXhWEa3w9r25YYrDHgijnjVJdQG8KxDvvSitV
	 AeXiU57msXLsOmKC6AUsbQEqbQvBPJEwj4GcaC0b22kHOgan3rLT1cmUQrWWnWr1C+Gew
	 NDKJDtD6EJjNmQFSxfLR/2sOqZv0eB+oTCg0bAXmul636BMJtiUcDP7GTp00mQ733hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgaUM0ak;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F46606A321
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 03:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F46606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgaUM0ak
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9495f083657so281965285a.0
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 19:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794799999; x=1795404799; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlTtnR+wCpHl9FSCHLEGv7xGmXmxOT2nZcPf4/lr2y4=;
        b=hgaUM0akhfIblJZRHS1um/ResgJtAxAoSHYbf4DebsNzZSgSEOTK2PUUFJYr46ycbO
         SvWxtAghL3ugAZ9pai5SU6+wNpu+O9I3gK3N1i5RZMuiWf+59EDoF67X+yQGTmWaDo6c
         8V4HYkdesumvwLnYssRCdcJB25yQNTfhnma7NQNRpRzsoCt4MLeF7Ia7ZMEC5YYn8fUm
         UoEHspP2YPaP2rFpG2KWdLg/f2d2n41NxSjOdw9txt8/iddqYt9CxJQhpzGFzhZE+RSM
         o6aXlJjWDz/vL1egZ6Y7tUMkgakD0MUgVXKktRggv0cn7BZ88ASPRxmwXt/9bEeu2vQW
         qQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799999; x=1795404799;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nlTtnR+wCpHl9FSCHLEGv7xGmXmxOT2nZcPf4/lr2y4=;
        b=OYd9+ush/4j6youAh7KXjFFEFCg0bcb/C3L2xKXWGMDVjAtvDHafHjYFksAESh04OO
         nY55LOO3kNtX2kTvlOrJPiRjI2nRP6vyDLazYbiyDptiH+qVIdqqQfxRde/vns5KntHF
         F1IiZQ2USgplZ0FOrVV/JSH0AW76dioLx8NvSzqbJ+TDeUuG0JJeL7BBfw6XZWCzllvz
         qHxU7SWHEGpnzauKNdx76cAAFCjNEixFbTr9vbksOSUcYYtvRf+5FN1HrGZZ3UuXgXgG
         sD8KXR8GYtev5uJzA5LLSCpolBKuVIjs0f6zqmVyrOf6WyU5pTdWeiuf+X4iqTCfz13e
         D0BA==
X-Gm-Message-State: APuU4Z+p651qJIRHYcOUrPy206ULjH9VDrvnpXONvSMUXVQeFcOpL16f
	F3R/wdtswIyKJgWLfAxqThZE3QcMOkvPvuT59+Mb5jj3GrFXI9UEyojI5585WA==
X-Gm-Gg: AYBFou3KrAHOVGu49qCCBGYwxSHSJhI7gtYVWoq9qcgA5VlqAkfTYLsFprzvldDMC1r
	r86WR41RVUIxDtxAdPGC8Ixl4EV2ijK+ux9AdAszICzFUhfmrYFeI4Blr+f1sNhc5OIXpnlNniL
	Joh0eUr7+ZeBQcuf/vKBN1Ba2wbXv1hX6aEkiOWEbuAwGJG9X2aoIKo0+sdtyzVjf+JKBCqw4gT
	/w9exBicqkf+KdU4p1/GgoF45sYHfPj2JAiBOKTJoaKzbMeGPpgwwar9OYJKL8Cglsijyl2IPIH
	PSCl6+VPkJSxm7xgHF5oasIFA+Jk3zPzm7ouvRC+EwswwmuheEPiBEkg6m5XpVTrlXC3pf6KGEQ
	PSj0nool/lwkQPYYvHi3dabigz+L32ehCVYiBg5cSDA3S498aLSr5Wg4twyXT4V+e6eDWeoGxC1
	jWQsQV2Ow218X8azNXTxEUT/3fXZxvF+deIUolW3B4+IubR4oKVhceDJxbE8GvGsoxWiUZSlBD3
	IgA3tbNkmmWC167+sUXF6QhRjXQbIWcFlqKBJue8L+QOlxLBZ9QDgl3b84TJRerh4BT0aGuiOVU
	7J2gQ2IScqDaLOQbdli3nwA2fd9vSHkh8qiFnsqRggbsNAwGt/T1kaZvnQM=
X-Received: by 2002:a05:620a:40d2:b0:949:76ed:591f with SMTP id af79cd13be357-94976ed5e0emr393702685a.8.1794799999296;
        Sun, 15 Nov 2026 19:33:19 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.77.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836f62sm753411885a.23.2026.11.15.19.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:33:18 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-man@vger.kernel.org,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Alejandro Colomar <alx.manpages@gmail.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] mount_setattr.2: Fix nonexistent perf_setattr
Date: Sun, 15 Nov 2026 22:33:16 -0500
Message-ID: <6099049.DvuYhMxLoT@daniel-desktop3>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The problematic reference had been copied from openat2.2, where it was
fixed in bbed82c0693a ("openat2.2: tfix: fix minor reference typo"). I
performed the same fix for mount_setattr.2.

Fixes: f3a5ba3f0151 ("mount_setattr.2: New manual page documenting the mount_setattr() system call")
Link: https://lore.kernel.org/linux-man/20200929223509.11783-2-cyphar@cyphar.com/
Link: https://lore.kernel.org/linux-man/20191003145542.17490-1-cyphar@cyphar.com/
Link: https://lore.kernel.org/linux-man/20210730094121.3252024-1-brauner@kernel.org/
Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
---
 man2/mount_setattr.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/mount_setattr.2 b/man2/mount_setattr.2
index 77233f589..5f26119cc 100644
--- a/man2/mount_setattr.2
+++ b/man2/mount_setattr.2
@@ -786,7 +786,7 @@ acting as an implicit version number.
 (Because new extension fields will always
 be appended, the structure size will always increase.)
 This extensibility design is very similar to other system calls such as
-.BR perf_setattr (2),
+.BR sched_setattr (2),
 .BR perf_event_open (2),
 .BR clone3 (2)
 and
-- 
2.53.0



