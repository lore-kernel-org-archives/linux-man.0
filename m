Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737356;
	b=GIqACesLNA5sPGjriJCPfP3DZk98e70//L4MKtUUilKUhW+kgDLPG9C7yUmVaQSR7aA6
	 FEO0oJhzT/GjDziBKTHDH2PmfpxbStEVizyjqaL4ARXoZe7Mbkx8M7FvJXfpd8yzftWZp
	 uW21CEfuyJ9RiQgIlfcPyLhw9EiknpivZp+EeP+lHQaPlw9hngVDE0/bNawo2yIFnpehK
	 2wcfL7hbBckGny6KiSyht2hfxxxGS9P5RTE/IupNtfdofgt+4ElwtLIQJydYYtzx8EI65
	 l5P6uoZ4OtjaX/ouSm+tZrUmRrSzLT/mTJ81znKUM+/wMXTliUnQhfRvc42TJ3fAosg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0nmqdoGC/WLg/3xKoqiLS4TH/t//LLUgA6HDIJAevh4=;
	b=wRwK7tDga2Nn+GDt0I1zqaG+C4sZg0P2qEzQZ2J214m5xquE2IB60NkMJeI/yWDTK8WY
	 SoVQ1zxfwj76Veba4WgkqwX1AIMzDYgz+huS9mnljHKLWcU8GXtbTMbkJFQ5SK7khcLfg
	 vZPfkihu4Sj+W4Ev5tRKAvq1PEF60qLBqpNoBHFjToksumNsa/PuJvYI8xmKZ19hIDmND
	 NHOYuQjCPmI/BQ2tSdHH2qlGvVooGwy+NK/zWkaX1hTnKtG71h9JGNeGpqBNMO9XDbgBw
	 WT/TpU8P6Ed2Av4L/ieqx5IEaFAjSVUZRPqT/IUlbiHS7WLyJrNykBs3BLz5GRV/gig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1UJM8Zx;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3455606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3455606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1UJM8Zx
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so46723315e9.2
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737354; x=1794342154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nmqdoGC/WLg/3xKoqiLS4TH/t//LLUgA6HDIJAevh4=;
        b=w1UJM8ZxYpZC2ja1CjctfOxZN9ihRCZvFXUd5P++EQhC3DZJB06SQ2NRKgGnuUbOiH
         35LMd/mGPURuDkexSczTU4pmOKlmhGjApLhP4CQwbxvf6nEByDPyWmqxbe4aO1up+Lw+
         0rz4+6MPImv5lRgwqIjdARRDhdvY+cPC+Ykzp5GnnL1FTPh+euLp9c7UADvSZtInOv3x
         MOGmIU0Vr/qzkUvDB9bG75xOW1M5FuxTmhA/hINUQwHc+hcL8xOahh1KJhvPeaNj6hMS
         0JgTQ8rmpkqqEzjVwoFBW/OltA6u7Ty2/OgheNWQ6jQs6etaTxSPCOVRu1w8SnbT5556
         jpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737354; x=1794342154;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nmqdoGC/WLg/3xKoqiLS4TH/t//LLUgA6HDIJAevh4=;
        b=kbbFWSt1rxu//Il2yCRr4Ru04OxU8Gu71IBPLFgV7nZ3nYXICPfUCtBlw1GeLDGV7P
         lpq6pPNh0BZf8akxJ4yvcgUxg2SZPYakP+axIhr8BC1aGhrhqOLZdSkwrIsCkilXjW7l
         vmu0bhdy/feK1MnlHQtr8X5IAy0o4H8KgOQB14F2T165/jJWsx2XI+4A/loGQJJu1xbu
         UU+OyESt0EYOYHp9Yvnnp+Bgr12pk1Ixs9828bHudYf5nGlVUw75WOZxy1mGsK828dCr
         OMPXXkz1gJTr1cEf6ErtYlb9/ruvNEThQccjxws1jPk+lAmdWT7uGDFYix2VLJEWsFXD
         +X1w==
X-Forwarded-Encrypted: i=1; AKwUvByaNtzuq2agvg/LOBj9aYlp2SfskIRxzkSKXIM5Wca4A2MDB5opzIYnfjDJ0BA2g9DpUNRpX3CEoSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WtjebMAX3/CIjw3hshnNiLJPzlNY/SRqWPH4e1biq1412jbwl
	mUC3EsiOUVuF6on2rILgafKZEyGk6xhpD1GY23TE086YDsZAjE06VZiV
X-Gm-Gg: AYBFou3wDV8glPqEGCcliIADVBlw1bYah2FFaSCZIfdSz8fSqIIP7+/+oirri5/ObTS
	4H4BG55KUyi2AHmePKs0N3qb2vNt4vvAVCKaqkvI73jUwVkL97SIXYAEbjzSzzYo/KuiVGUWEjT
	7HIlhqiqClpPhUm/JqNwfGCwSdtXDPxKfe9AYW2Y6QdJb5zxiaRQmgu5NgoW/3g9OjWMh9P2h6w
	KBGPdjVZfQ+bRZG969hqqHOflz8r7TyQaj+4h0rpQ8I5lWQ7lKxljvmhyBZIdWSejTBK5Yd1Nxw
	1fdcJebZHSgQCHKibriHMZSYHUSTvUecPYkvVjQVo9IydhB1KZ0zAajX3jk9JupR5ztrQBq/UU0
	I16nwwZxyfCm3TMi62wI8wI55O6/6nNBxn/j/oWv8/wM303GjHIBokh8fS88VXqTlGKy3IQ0Mfr
	YtqB1k8pXUDG9M0rpEt7XVxhV8w96FeGlBBdILl+H+rYaNtJbM8TQOChiYJVdElA8MXGKoYnFZr
	zPSbIOInD+R7Im+veK6fV/b39vy1IcwzLAxMTk4zk7Dq4QqIH5zBbitjGupxaTrFv32ruDV0AbO
	Yf6PX+l+ezrBPDoCpS1VyeJFcv5NeJWlFPyn1ruo4E7RoYm2141Vpw==
X-Received: by 2002:a05:600c:a41:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4ac18c73d85mr311219815e9.26.1793737354246;
        Tue, 03 Nov 2026 12:22:34 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm124545615e9.2.2026.11.03.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:33 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Willy Tarreau <w@1wt.eu>,
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v2 1/8] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
Date: Tue,  3 Nov 2026 21:22:03 +0100
Message-ID: <20261103202211.13820-2-gnoack3000@gmail.com>
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

The ETOOMANYREFS error is detected in too_many_unix_fds() in
net/unix/af_unix.c when the user's (not the processes') in-flight FDs
exceed RLIMIT_NOFILE, and the process has neither CAP_SYS_RESOURCE nor
CAP_SYS_ADMIN.  The error is raised when all of the following
(simplified) conditions are true:

* user->unix_inflight > task_rlimit(p, RLIMIT_NOFILE)
* !capable(CAP_SYS_RESOURCE)
* !capable(CAP_SYS_ADMIN)

The check was introduced in linux.git 712f4aad406b (2016-01-11; "unix:
properly account for FDs passed over unix sockets").

Fixes: dc4eea68b565 (2016-12-17; "unix.7: Document ETOOMANYREFS for SCM_RIGHTS send exceeding RLIMIT_NOFILE limit")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code -- the condition under which this error is
    returned was not fully spelled out.

 man/man7/unix.7 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 2163a91514b9..94b9e82af3c0 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -775,10 +775,14 @@ .SH ERRORS
 a UNIX domain socket (see the description of
 .BR SCM_RIGHTS ,
 above).
-It occurs if the number of "in-flight" file descriptors exceeds the
+It occurs if the number of "in-flight" file descriptors
+sent by processes of the caller's real user ID
+exceeds the caller's
 .B RLIMIT_NOFILE
-resource limit and the caller does not have the
+resource limit and the caller has neither the
 .B CAP_SYS_RESOURCE
+nor the
+.B CAP_SYS_ADMIN
 capability.
 An in-flight file descriptor is one that has been sent using
 .BR sendmsg (2)
-- 
2.56.0

