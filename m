Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4B57F753
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171972; cv=none; b=BVos0aUgS2ioWtzCDkrLWFmXk+cAeo3IL52djQ0fgMoYFa9WGHxS6IugKbF+mIhAJL8MQ4uyjn9sVuOOHi3CIk0ZlJRQ8dSCXoBI6Eg0vgBO7U5Uyn+4jKrdoiEARpQA/jajLbjSq54PqfL6sRfk0Jah8zXSttKMeuoNtwyiVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171972; c=relaxed/simple;
	bh=iiPmYGBeJyLXLRjw1xOcpqoSua5XeIg75zusfDefI64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQKf/bl1wMNNF+FLMTb8xe3Y5tLmKf/hMjIZksjp6C8wXClsgYEKl07oZLaS10Id8jjtZr+wIYyuaN2sDqpkbYOLPTejBXIEBMHma37LZYbgIXf5I4sCBrE9kJjDjXX5Uq+4ZptPZ48tgxQuLwX0TIYVe1QVyXlPnlzN5Onu3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYFw7Lxi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYFw7Lxi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1af482519so2153005e9.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171969; x=1792776769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/DUgMFAVQdd8UwDxz8BXrR0imOVd8DSUoNAagCPfUqg=;
        b=mYFw7LxiJPEokiQB5t0ENBJZc0WBnJcVQsZKkE1PSQe0RuedXOsNQYFo6vUVwdEAZg
         RhB2G+VekR4+4TtE3BEb67Xq/o+2bRn1c5+j75viiN2NesRvNTiOeN1y0bztDoIjNALC
         yCahOW08G2DdagMRNhvtgFiwTIYSRxYqHowNOVjiB8ZaTgJRJicj0GqD69lz8bfEXDBq
         rhtiAslKJzT3OsvqIx7+hoDXhCn79tH5cOzphGQF2gdQTGFPgnE99s4UD0GdR4GpmYwC
         UbrUZlqgfqtwMFnVAXXu4+5gomAEExvj1iagBGIKFk8YHyNhbpY1y6P0xD+dRurtLkEC
         /qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171969; x=1792776769;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DUgMFAVQdd8UwDxz8BXrR0imOVd8DSUoNAagCPfUqg=;
        b=PfWKqbCUjvIr2CMhUGBxeedJOg77Vy114noXeDqIhT4k/z2EUbHsCxgfaSWIpiZnAc
         Jc6odygs2f5uXfbJCu/smga8mCVNW833IB8D9uIZHdK++B/3dl0GSIW5vDj/MM9uTLB1
         Rw1kpD97SqWKPEwkitYDhWCmPnaQYnKRwxDSDdynwhPXR1WDhAUY9PKzvg9EaCRGSNTb
         kTt1X7AZpRPDB1jakZqtBmR5uCj0TRfF9gizBWXeCeirmvC2fdJyfkrguLPMILq5o8XY
         lSUIV/MIbR24P+tzfffqpshSGDeSs2UoXSGBRtJYx86+uZ/aiug+Cc2NBf+qi4cS0XcU
         JpZA==
X-Gm-Message-State: AFq9FYI0KPA524U1Uw0O/G9089ORlmLreOCOKujk9hwZTt9wcmWuAP/M
	mTrP/+bs4gnI2Wz4VOZmMX6/tuJpwkUAbTa61Hw1KmJcn5AKaj2xQ3PGfxJk15lO
X-Gm-Gg: AYBFou0pyjxAmIfTWrOzokegipa+JVLwey/dHwaLn3dP4enBCqLzZ6hK4lfll++DOP/
	FLxNkq4LwjmTq4dE5uitw0Io+nm714I1AgPTDt1wZDfGTIL3yLXrd0I72q1fo+o2G6+qYnD/M8b
	31jAeqHb3CuQfmiwZPMPwpCd1eLDj+cIMw7HmTSCcYW46Oah6s/RO4qn3N8lTyWnVmGcpJaxRTI
	pjFnXCQFnFYUzJihiy5vY+bvWhuLoWrOj4oIRqqGqXsX/xXg9A2s4gidzmDk9aL+bdXcVvGdiqe
	3RKDhT1HF2s7hLsblKto4p1AXOmB7sVczGHgBOON/KvGBZmr6vXF00ej0OmuqntBfpY4ivDiS2I
	S0rSHmBnHXuY283hVoM5AcAL/HNnR+J72cLwz5UORKyKwwdc9mLTToowC3K23JkzC61E2hJTs9u
	eSc3FCt23l6CE5mkdDb6x5wC+lNEoPRZJy8lwWWowUdFzegcc/L0D9BuIfd+avxIWiZLZuCqhxN
	7jg7mRsBiiVBO5yFg6nTxY=
X-Received: by 2002:a05:600c:c04c:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4a1d49e17f1mr20968615e9.2.1792171969028;
        Fri, 16 Oct 2026 10:32:49 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm7274969f8f.8.2026.10.16.10.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:48 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0 is also accepted
Date: Fri, 16 Oct 2026 19:31:21 +0200
Message-ID: <20261016173139.13076-7-gnoack3000@gmail.com>
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

unix_create() in linux.git net/unix/af_unix.c only fails if
'protocol && protocol != PF_UNIX'.  0 is the usual value, and the one
used in the SYNOPSIS.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    I double checked it in the code.

 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 1054d7f52a30..9df4d3b6f635 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -708,7 +708,7 @@ or
 .BR sendmsg (2).
 .TP
 .B EPROTONOSUPPORT
-Passed protocol is not
+Passed protocol is neither 0 nor
 .BR AF_UNIX .
 .TP
 .B EPROTOTYPE
-- 
2.56.0

