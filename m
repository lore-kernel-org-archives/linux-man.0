Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE656E05E
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171991; cv=none; b=sxZjFVAQP7uMYxR7QXknqxr8L7s9097mThl1BAve1Y/Q/6+uqnsdo5uPw1e4/oOZ4porPehBDUke/6odr61koD+h71EHyjwHD6NsdHK2MguOVv0OFq0QNjhZbzF95m5JIRh68XSfrZFGmkOdJXrQ9pQ+GTmZZv5WOjmcrS6k/zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171991; c=relaxed/simple;
	bh=VXmwK6JW1HnBh7nSTU0++eaZiP61Z6nH8kY3tGqD4/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4bE+xwh3NljDIrf3SrWp/3yy5VqDxyT2l99m2o7tzTKyidYm36DzCmuVK9GpBd2m5+DBIY1w6X14fa+uzeEWtm9ykAme9gzzRUXo7+5L258IpJK/ipLO6+426dJ9II46GQ/9X/iK477k+YH+mrIiObBDvoO5fM/zyJU6PoQ9uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3R5edhK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3R5edhK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1801505e9.0
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171988; x=1792776788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gF09G985gHvtrKBPExT2fh/WSM2HqepCo7QMAb5DuBE=;
        b=X3R5edhKWWiIt/+q3obxHvOAUo7w7s9grOs9/qIAEKYB21jdDknmpbiPyxiMOFdgYR
         RFYR1rKuhcRs/KGlB815u6FKb01u6DTwQBdnJUDANPizn1GXnce0fhS3DmtweoBlsD6/
         haDx7wvnUE1UrMYvMC5LhtJg0M6LQjrvdezaeRi5UjpSn1FW+JhyIwwWHMnl6xfrf82A
         f1EIdHw8sTmdKbNlXxmxKDmZBFmv/97s1CYyA8a3CNv0EvQ7GtrQ2l9FxfGKh6JrRo1X
         lfTFkrgeONkxdNtRp1dxiSLq7wUvq5eiZiLXOU/L+ZCNXQPNftF6mLBM0fxWRf8cFJwQ
         +WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171988; x=1792776788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gF09G985gHvtrKBPExT2fh/WSM2HqepCo7QMAb5DuBE=;
        b=oVA9gB1asoUg+lMIgJ21bkWhZPLT1TcK9F5CKz0kh2YF6MkucBS5mVOePcbr9l7UYA
         fpk09GgDqQBiqz5VrTMMsOzwDW3cbKRVcwoPhN2Q4fMZhZZ4aoiMvkCVUKD28deoOfgo
         tzI9Qv2eqVvR1a+EaHgVptm5EwGjmJgGx79a9Zxm40S8SZCFsQocmnv6Llre8FxI3Jj7
         lfU6iBggeqyFQje5YF+d2gxqbpfuVACQLCHf5rcgtjsfJiuA4DE3ApD3kx/bH0aANpzW
         GcunHNMQfbH+G1MgfltR6ozOA2BEk2C1GkQwnQvW4CY9w02tC3A4E7CMMVUFWzE/Y5G6
         pOfA==
X-Gm-Message-State: AFq9FYI/FF+MANZxO6YK8neGURJArdh4ORXwvEh26eMrRLlpdp9kmR0L
	iTvSe6BFe31KG62K7iDGf6wihtsje90w2EusgNKH0NMEinNdqPudBgQ0m8F1lnf0
X-Gm-Gg: AYBFou2MkjFoeJa9Q/mjikEj2gA4KBuSBFxBRGxdni9/z+lBM57eB9QK8p+2mV5Uw28
	COg+CAQW4eqLWpbRKYGshadBP1PcZ95NquakTGhwZiBnMvSrPcw3KJCX+mAIzdk9XKHx2BN9BeU
	gKtUqRTCXsXYdCsflJYKhi+1Q0dIsdzhjUEMQUR4ObkIIbzotYnxNaQABmTq+Lx+aoc5Nf2b+0g
	FwiNEHJE+3tze6BO30RpLcEL8SJkdA+2rU2dEsGksW/YPvlUgi0474eBdDQHe0N53dEs/kmrMLu
	WoD7ixf2iInQgNNVXVSXjqWuL+5moJOR29KUs8BnE5movzwqxVqS59T6VcvZmMwEb6hJIlbWfLA
	AnX6l4fbvd10ks4+sB1mAUt7t7h0ZPvrserPT1iXakCzNS04OHh3pipvWf0BWwmFvyDC9cc/aCY
	jqYSL5hUYvyEmnnk6GrDbbXLxRrkxEi7zAJ9t5DJcnUGyKHB9a9/FAbAO3Tj6gSVPWT1fOuXoV6
	gd0lvwWqfd1GOdOhI90PpE=
X-Received: by 2002:a05:600c:c170:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a1d7604597mr10767845e9.14.1792171987876;
        Fri, 16 Oct 2026 10:33:07 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca585f6sm34253235e9.4.2026.10.16.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:07 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 12/24] man/man7/sock_diag.7: UNIX_DIAG_NAME: The payload is not always a pathname
Date: Fri, 16 Oct 2026 19:31:27 +0200
Message-ID: <20261016173139.13076-13-gnoack3000@gmail.com>
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

sk_diag_dump_name() in linux.git net/unix/diag.c copies the sun_path
part of the bound address, with length
'addr->len - offsetof(struct sockaddr_un, sun_path)'.  For abstract
sockets this starts with a null byte and is not a pathname; for
pathname sockets, the stored length includes the terminating null byte.
For sockets without an address, the attribute is omitted.

Fixes: 4f6a0a4a (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Shortened and simplified the LLM phrasing, which initially also
    explained the possible valid ways of populating sun_path.  That is
    already adequately explained in unix(7), so I removed that and linked
    unix(7) instead.

 man/man7/sock_diag.7 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index 20733cb8c8ae..9a2b54a67b30 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -169,10 +169,14 @@ attribute as described below:
 .B UDIAG_SHOW_NAME
 The attribute reported in answer to this request is
 .BR UNIX_DIAG_NAME .
-The payload associated with this attribute is the pathname to which
-the socket was bound (a sequence of bytes up to
+The payload associated with this attribute is the
+.I sun_path
+part of the address to which the socket was bound
+(a sequence of bytes up to
 .B UNIX_PATH_MAX
-size).
+size, see
+.BR unix (7)).
+This attribute is not reported for unbound sockets.
 .TP
 .B UDIAG_SHOW_VFS
 The attribute reported in answer to this request is
-- 
2.56.0

