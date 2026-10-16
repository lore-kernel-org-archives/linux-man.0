Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35107582B8A
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172005; cv=none; b=lOcNMz62pLUz6byweLLZ3O+j+lib/Sdw4ECduzokHOsEFXTIqa1uRuEr2NG4ZybySJj4P86OsnCngGgU6JMaNa9sGqHkU3PKvJ2m7jENHVo5hibTlXEw66CsBn4f3ksZ3lvq8KucbPTtZOtYpK16lEjmkXdxq30j7qAjcC5TD6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172005; c=relaxed/simple;
	bh=pnAn9EuBGd6fk/heD5fTt61RaAXFQ70Jwstp28GZCNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kGPISdIzM1b6IYGZRpHsciq/Cu/gK+/T0KkzSa1BL7jg/vzT23PNiSOK6uatPVF9Bgg9A6do65McHrobOq1TD0du1zPA2ZQUvSWUNux2RMaViQ028cNdKyEpWzVOQ4Zvnvg3rfeBQkHX7AZIh0eCAbQr1TagEFmbx8I1bSjo8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXhoqE8H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXhoqE8H"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso1775565e9.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172002; x=1792776802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uGUNTHou1oDfLS3BnuXjUcGAY3xUoCOEEO+6Y7yQKH4=;
        b=AXhoqE8HXz7VqbOUeQY5nvkcZg6yb2uyNAeil/WeRvHLZZVbAzc024lCzP7C8uGGf2
         5+ScTxJ5rqr0IXBEQ0SYDTcLC3VbyxaTvBVuIgbrV3FyJJgX/lhuGCZxzP/g5Yz1pnPP
         bEeLV3Fipjj7w1cBy90zlK5saX/wuSriHLUJNCdJVUb/WX5CXKY49S4C2KIhY5x3in7d
         QcH9AOV7Jn9mvJIu1vFDS0jLExw1XTM7mbLyg9atrda830nMqMx8d09wgk+iAA7SzA01
         peToMHvOtKRyMK0/1LYdkaocsfMOKMMFs09QcLug6EHigAWfqkOgFPaMUd0uMuhiYUv0
         xlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172002; x=1792776802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGUNTHou1oDfLS3BnuXjUcGAY3xUoCOEEO+6Y7yQKH4=;
        b=n6iTOy8wRFKIOs/dPlPLLtZeoxH8pAGn4ustCWd56TW5hdx6xQTPc0D/lhOLjX89RX
         Kt43B4UoPyosa/LQYS+Ih6fTD0snRlAgKQ+6K2/4mEC922PrVBVrVB68nIzXS+eBS5RG
         RLdTM3ojYYPPrumZS/xVvrp5fqLZAvMnqRCGRmMz1qdqiqQeM8zZzEssthXB/YtPRWKZ
         PwSPe0tBgXUQbQZ13Al1F5h3NE2FHzi+7ZwIc8AsqTiA/24tP+5NsI5u9o7S/Qp78SVm
         u5lRUeRU0KUvd6JNSPDCdk6/AAwMFZyR5P5asruF7gbmjOEUDeS5nq1ryhCyTEMQJ5tf
         DwJA==
X-Gm-Message-State: AFq9FYIP7RWmZjVSAam/ftnY3SkHgtRVNu6LfHj90O9OpC8kvHE9G3aX
	M1+apDlHAf33P2sNKi1JZkVMfZyOqgoCCLBsO61cxJrUIuIZRVDJiN71
X-Gm-Gg: AYBFou1CjicX26ZGuiIc7Btz8rb9xctMtQHUZJ5RRwROWAae8P4z2/opY9OfA72jOPI
	KJ0uuuUsFEQz0MqoqHpeIY1MOQKK36h3Feheh/Y0L8bR+ABaG32B5lujgj472hSRxMZil33VdMj
	Kf4mImWwUlTLJCM5onpLPxBnuGOWuN+YLM5dbCl56pGrB9wtM5g2rAWd9/io9sqmFIxcouaYkxS
	QHRNVfCqtTWVMGzy4To/Uj/4aVP9b53c5lKd+lu00dfw+zr/3CCFfoKjkJHLgZBPIybGhgjRvpP
	/vFQDrKFaznq5JXISFyyMfjj86NGq499rsz7d+f5I+q9X9ONgZExKsIQFAkNed/Di1Cqc157oB2
	aFpfxDMyWCNVh2CeJFMZsMdAZxrTFU2bgBlRJNzv5icf4myxWQkoha+qYQJ5iItNS7RbqFestO1
	7EM5xIaukngLNXA7IARiz0WVFjja3CXGZyUIgyLWDXlKS0RnjiosZszG7jPR8RQXOxRsGRgbcje
	4AdoArb1RlnDCiT7LMLlfLHhB83viRy5w==
X-Received: by 2002:a05:600c:3555:b0:4a1:d52e:c2d9 with SMTP id 5b1f17b1804b1-4a1d762c1bdmr10212765e9.23.1792172002411;
        Fri, 16 Oct 2026 10:33:22 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d7659805sm11206575e9.7.2026.10.16.10.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:21 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 17/24] man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
Date: Fri, 16 Oct 2026 19:31:32 +0200
Message-ID: <20261016173139.13076-18-gnoack3000@gmail.com>
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

unix_create() in linux.git net/unix/af_unix.c does:

	case SOCK_RAW:
		sock->type = SOCK_DGRAM;
		fallthrough;
	case SOCK_DGRAM:

so both socket(AF_UNIX, SOCK_RAW, 0) and the equivalent socketpair()
invocation succeed and create datagram sockets.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    For completeness;
    
    It is more complete to spell it out, but on the other hand, people
    should not be passing the SOCK_RAW type when they really mean
    SOCK_DGRAM.  I'm on the fence about whether this is useful.  If you
    want to omit this one, it also feels reasonable.

 man/man7/unix.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index e5cd2b888ca9..787a48baa97a 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -39,6 +39,11 @@ and (since Linux 2.6.4)
 for a sequenced-packet socket that is connection-oriented,
 preserves message boundaries,
 and delivers messages in the order that they were sent.
+On Linux,
+.B SOCK_RAW
+.\" unix_create() in net/unix/af_unix.c
+is also accepted as an alias for
+.BR SOCK_DGRAM .
 .P
 UNIX domain sockets support passing file descriptors or process credentials
 to other processes using ancillary data.
-- 
2.56.0

