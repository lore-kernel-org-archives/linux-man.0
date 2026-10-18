Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBBF3F44C5
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345063; cv=none; b=Sns+yJ0ZCHFhM+z1BE39M1YmuWcag+aBYeO2PL3I9R0ACDU73kncp+lOs6oLjM3OwMaY/zyDynwTEX1DJk53KKtQWnSTtdPN7AbuvBYOyL8HzM0a2F0CKiCoHKfALt21stkbAGhfQu6SDxo/yPq/PQ9BVCiMeHw/0c3M3EHjfYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345063; c=relaxed/simple;
	bh=5f3nnuId+HKqejpAgLthxwuIBxJc6oc2xMYGT4YWfE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHWWn5Jg/Lqj7R+2YniqK6+tpv45g4BALSJiwNTU+/2UiHh5GpJpeJasiPSj9r2DWHYckRRYZDzlJV14vPh1zgn9NT07QFCzoEW5odl9MTxtRaUnn7rM5IHGhv4Z/jZfvGUSiT1yQQyyqoSwxW04/NmbSL5WVRn94i25l6YSpE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3taJYF4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3taJYF4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e00eee27dso651883f8f.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345060; x=1792949860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oe0pX/yeegaq4+OCqXcsFAnQBntPV/KHFcH1otbtuyc=;
        b=E3taJYF4E/QsBJrV8vAWeWgxxTqIKr516VPJQsAchoKOZtKqhm71wU5zugbuK5siCW
         +xUTVmArqQkin1uNCcGPgNWZvudb7CpmvYE1tDZjjBD2lo9vldRhRy4vnb9EvRydxq2K
         8lGuYBv63p5m+jSiVaao1uIJIuKg9jbvojvy0T1wY/7TRpsswj3t67EoOLqlftB1ZQQt
         2c9hSk/9pfbDjmLBhPFkYZaWzh9Rdhjdgd8GAcjIOI1TRPvW/Fp1n/gG8/+8fN3/sh8a
         H2zxgdIp/gKnBQoP2G3+n7drlffVIWZ6B9Rpw7w7yoN3T+iQQRQwJistGGIzZ2fJxGRo
         aaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345060; x=1792949860;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oe0pX/yeegaq4+OCqXcsFAnQBntPV/KHFcH1otbtuyc=;
        b=DTiEdGICkF5w0T5jWQVk1G3PGPPL4/hBWRzlrOfP/fw4fAghXgNUV2R/OYpERAVbyq
         QPfo+KuvIxSn+EW0JYMn5B2X7RTOk9j3ZpM19eW1rP2vd0zBBwMUPCj0ti1/YgdTacy7
         J7bKCF1HbFhbc40J8k6oLn2foO6Mkd5ckM4otYZJ744zMtfcX5td+6kS2Fhj0DWFVeXI
         C73+fc+zrGvH+Brpo+a+67jf1bSWQbrQBDCT/GGiJUhIja95NFj+Z7LNrSPnHt4I0cQC
         /dWwzY4Jz6AVLabP3BlH8rT86Olov/sGtRuyugLxbSTTPR9PdB81ATsX0/qyKN37Ou0D
         fV/Q==
X-Gm-Message-State: AFq9FYJJLYiiLQvAfOJ398/6c1sWZbJuvUhBosOKCVuuDXOPjiID8G1b
	Jh8eGj8eVhIwp7nQ2AaerFQ1k9RV69BoCagTKtnB78/+ebHHOcoZxcK3
X-Gm-Gg: AYBFou38iRmd1q01GuPxF81ecCD/zcKDMhNyICUuFwanQ8nNiZFxGWBJZARNWKHFo19
	I5pDLhn/K8sxf8REZb+0fnU1KpJcUI6K2jozX/6WCdEaByi8z9GxLvBhMPr+WRfIlmuFaQEVpn/
	tzpF7pLGJXm7PZlGik1XtRMhdGtbm8kiiXJg2r+fq24M0qufmxtrupMmH30P6dKTAwUf9tXa9XG
	kyLxIyjbz5fi/tVCQKrcUlphNE7H/Db1Zt/hHTKSHPHJ2Ny9q6dveindxZxxf0bYo6bnIfQT6Wk
	q+LIeJ9Tzf8Nr0Icl8XWbfODoo4k82DK116e+B8NuvKRNoh08cDd8b3jjQWCiusYF6PZQlzdoT2
	tgwGhHLLFQNIGh6gRWRy8NgBtDqtPEaMMAhK2G/ZqH2vpfwTpXnXTCH8o6Mt7FFAgbSKWU+pBTN
	eKpRgYfEBAibGCYxoMrGGozHIu/lWOZZnwOSr6awOBAAkZSB7LGQAfv289cmpW8kruBGCTFS3Wp
	WMvNgb4yvyPdGAzN/ABX6w/
X-Received: by 2002:adf:e34e:0:b0:48d:b8a1:53c5 with SMTP id ffacd0b85a97d-48e07fc0ab6mr7780313f8f.56.1792345060339;
        Sun, 18 Oct 2026 10:37:40 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d1bcsm18292367f8f.54.2026.10.18.10.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:40 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH v2 14/24] man/man7/unix.7: Several items of the same type may be sent in one message
Date: Sun, 18 Oct 2026 19:37:02 +0200
Message-ID: <20261018173712.27670-15-gnoack3000@gmail.com>
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

__scm_send() in linux.git net/core/scm.c walks all control messages.
Each SCM_RIGHTS item is passed to scm_fp_copy(), which appends the file
descriptors to the existing scm_fp_list, and fails with EINVAL only if
the combined count exceeds SCM_MAX_FD.  On the receiving side,
scm_detach_fds() emits a single SCM_RIGHTS control message.  Each
SCM_CREDENTIALS item is validated, and overwrites the credentials of the
previous one.

Keep the recommendation as portability advice, and describe the Linux
behavior.

Fixes: 5b5cb1958062 (2018-07-10; "unix.7: When sending ancillary data, only one item of each type may be sent")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    The factual analysis in the commit message is correct.
    
    I kept the LLM phrasing; it did not seem overly wordy to me and the
    style is in line with the paragraph after it, which also documents
    Linux-only vs. portable APIs that way.

 man/man7/unix.7 | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 4d431ec6deaf..480a565f7d04 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -528,7 +528,24 @@ option must be enabled on the socket (see above).
 .P
 When sending ancillary data with
 .BR sendmsg (2),
-only one item of each of the above types may be included in the sent message.
+portable applications should include
+only one item of each of the above types in the sent message.
+On Linux,
+if several
+.B SCM_RIGHTS
+items are included,
+their file descriptors are combined into a single list,
+to which the
+.B SCM_MAX_FD
+limit applies as a whole,
+and the receiver gets them in a single
+.B SCM_RIGHTS
+item;
+if several
+.B SCM_CREDENTIALS
+items are included,
+each of them is checked,
+and the last one takes effect.
 .P
 At least one byte of real data should be sent when sending ancillary data.
 On Linux, this is required to successfully send ancillary data over
-- 
2.56.0

