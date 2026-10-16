Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6757F73F
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171969; cv=none; b=YaE9Bh3oZlw7yL/H1HrKI1jWWx0O+OG0mM7y7dZvRiMsV2KdnXEaXlxwPTlzjBvVpK9lO/Tg0HD2Q0/6RAC8qD6irhoZ/FdAEQxVPkWdUxsjfZr5cSY5szOHvSSxK3pfLsTDtrfgudjCfQo5BvaBvtsRjNL3Wusph/veH4u9Ess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171969; c=relaxed/simple;
	bh=8V6QPm1x6EWs13ozRbqAngd3DbUDFUlzDuXvl+Nj/OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YotdujMlNoN9dZitS9jr+J0kgXNtkc6gJ37LBi1K6o1VR810ECFcr13y0spcSa5DsPcQwzDAVgf41+z9DXCdlbvILiH3ykSZ2iGZJrfUN3i5JF8Cc0iUoYZ9zBkED548tGp2WfxjBZ6LbBh+CeqZ3yuXIMKND6NFGtlkZ+Bic2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJPj84UF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJPj84UF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49e73611928so8130175e9.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171966; x=1792776766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQpP9kJG6lUOvhqK+hfk7hFO2okE6TQsVjoYnSvhhu8=;
        b=SJPj84UFxNsxciCw+rm0lXq/MsQOHr6+qa/frcnPlO6i2lZG2WJ7xwfMTSM+WxjJkk
         Xw+ONcQs4xA8v6IzQRRSNSd19lZ5CbSfGAEew9rxnI3UIGynsTO5YZz1ZH4L7pCOoQd+
         K89r39+re3vRWz7gAih7FfQyPUsc23Unwz+XEeOZajocfjCcEx3fpvhBQViJLuggwYHP
         kB0lMAF0IblbzzVoxd7of3uEsB9aD9FBlGzDs4HntEZHL9Le+KuYIfdZY1yA923XDg8Y
         vIOHYm+8HbRxk1yz6sE/EjIvf58GrYDlwq9NDC+XnaA8qMeLEBxDPLrH1NdCQcx8Ks0t
         ZX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171966; x=1792776766;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQpP9kJG6lUOvhqK+hfk7hFO2okE6TQsVjoYnSvhhu8=;
        b=KU+UQDSxVlJh1o4rFCr2926VqdrwGff/ZZPt+9a243G/9zEinHdljHLsA9vgsD5Ndn
         QlPZ6Z1QYkoMhkWJ+HBNo3+wmJ3o4xEzPuLWeGpP6tGKMrL2iXTNApsk+RhJOprrYSgO
         oiemR446HXpx+jqlNTVXZp216rqqYfI0dVTtVvdlQQcZ7/NCIZQLyg6oaLX9F4W6S80j
         IjZSdv4vMbKdRHA4gHPg0rrPwA3UiFd7Aw+k+PmKPv+5apBxfaK9fPJ+FbuITHuhmJTR
         Y0OMmhX0hBsvDdMtRZ6tQ/qaPmPMCAAH+nyns+ccd0fkGLlATyB0GaWQCfe18z1smaAr
         dPkg==
X-Gm-Message-State: AFq9FYKwERVpJsFQ0h/7uRZ1k4elMmUD7Q2vB2phYKdleyk9grvBT8Fe
	KIhu1HTpE6Gu4RabyY6VZJTmUw0u+HTEeJaR0DnkCQhSeKRyhhTfZ581
X-Gm-Gg: AYBFou1ZORwHR32GCPKTj7NCd+Wd4xVWm6FyTbX3MPwdmqNxdQg6WexgjCBrY4DYWv0
	X8mXwJcrBK6TyUVSuRhPXcdwcOHM6OyHme89+EngUB5+xLEcAqQxnbNpmANgRB2KQtIFQj18NZg
	PFswEVBEN/Yc8xODqCflHfZ/jKLis27sdu/i/AvjLNaP1EJ8P/8dhW0WMk+LLYzmczlI8vx37kS
	+O1XSdR8Df3mk1CsQDKcbzCDLqj5uW+6s4ZPCHbB+iEUEuSm4dTmomDat9jnUsDz+O78AuezSHC
	luVIQLE3Fnsw5VyCTbt2u4qQCG587LhMs3yaLUmq4l7ZI5Ra6e4WV2Z8T/0fDExVcbvm19Y2wS0
	P2Zvlorp5LWWqKyfMe6q92L9F0mIG5hhQOYKHSyH8YIgUo3PMQypwjn5qjpq1RiFI4E9BjfYInI
	9tCrmnGiAfyCSAGQhtRU3W2qqVhQepNgJg/KbMDVrL3uhMDNC65qfpwdyK2pUxGn9659X4a9x1L
	B7RAvUSq0+YBz/va7vxY7M=
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr10905765e9.14.1792171966396;
        Fri, 16 Oct 2026 10:32:46 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a88bbsm167419715e9.3.2026.10.16.10.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:46 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 05/24] man/man7/sock_diag.7: udiag_wqueue: This is memory in use, not memory available
Date: Fri, 16 Oct 2026 19:31:20 +0200
Message-ID: <20261016173139.13076-6-gnoack3000@gmail.com>
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

For non-listening sockets, sk_diag_show_rqlen() in linux.git
net/unix/diag.c sets udiag_wqueue to unix_outq_len(), which returns
sk_wmem_alloc_get(): the send-buffer memory currently charged to queued
outgoing data.  The value grows as data is queued; it is not the amount
of space remaining.

Fixes: 4f6a0a4a (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
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

