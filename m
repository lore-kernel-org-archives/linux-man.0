Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C13EF670
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345072; cv=none; b=MlG/INC8ayl4A+xhggzyLq/ywWBTPLS1BRW3Bn2MJJlg7YqKoRb/8AMZwi/2zJW5ptZFBb9Kf4+shwKRhsP7b7gWkJJzngvWz+jNqKnoKsS+J7s5JbKkRnWxQJP69MiZoFwWyjQD/IpY/3+92xCzw2JrgM/t3r3ocilf7ce0BHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345072; c=relaxed/simple;
	bh=gGY1Ob/ie5zqPYrRlE7DmnqXVvWjZZDcDFn6m9lm7S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJFwxk5+IiRxQltG9TAF2OdTb2F7sbusDQ4d492PnR0AGWE1qfmf1BHBU7zVi7urYmNQk4OsRL/LCrQSy875eczxNOuXgxmaF8o6rUXV119iBtb7AFQtzNaC4Mh1gjuSFnZsVYDgzP+Td1ZqWd8OAi6Yt9SJJo5oa4oY9XKQLQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwt/zCFp; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwt/zCFp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df54150dfso957022f8f.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345069; x=1792949869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5IhGTItCjmDquRTpggw8F12EVEoCysQ6BLJVoy1p8GE=;
        b=Wwt/zCFpVB7s5iX838NypQtjibVV9AQizi2abcGUWLBT/laF/Midsye7AecYB5c/13
         FG5gubr0aY98B+MmSLAQ+yRjqcB91uD3AF7IYE0oRwofqYE5dHfO3+sYZZdqhxEtkeCf
         UgowbeBAztTjTLscHOl9/0rLdGPp67Vb/gT8rL/e1GLiyPXGPDQ/Oc2lr9fyVwHBKnjz
         LueBP+kRF3AVA/+7wBQk/4WpmE8cWMjxeZgYyKcYbbtRS8jQPlCMxKNIdXBjIWp1GxP1
         dETkR199jK6Swt2+QimCI4t0BTM11ZnZenL/9P+iJ3rnAOcZTL4HQnHbTkCyRQE9egCo
         CjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345069; x=1792949869;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IhGTItCjmDquRTpggw8F12EVEoCysQ6BLJVoy1p8GE=;
        b=lHWobby/o4wnfjKreyd/NRGZ98e8Jy0bc6dh99MgjGQby7uCsHysCdfuVBuLFWiw5P
         B1weHNtYF4f3NA0yCx7alCBgtf04H7nIeXD6S+YRhRD7w85fraO4nBPAob7q0PSoYPYJ
         QgERNnszBWMMzRs3f2JdLItLmjRYjs2DEdYtNWYm3kdflnGqWWE9VEULrcB8xgwgXHvC
         y9yvToEfpk2GAgTlvJVwsa8tOdr08uhzfQFLH4SvtL0g4cjsBt+ufvgzckwXySlcustf
         JPXNyqmLlz/QuXWmSIqM9tF+wRQmiMC1yiEyrCf3xq1n1C9VwIByP4jd36dLxq3ZYRLA
         yQqw==
X-Gm-Message-State: AFq9FYLrhFvcmODIZTZcGccC7LC74Xqy3yw6+XKq9OXm6FOip61Lh3eI
	XBsan9i8SuqvfnduK5iDF5YdF8/ZpiL1WaQju/rao/tlYXtolYatASE+
X-Gm-Gg: AYBFou3L4hMP5nFhcw9CDSTL10pBawf8XGh5ZKQLSOKJOR3rjyo40UGOKXDGsJ0ZXxB
	S+Kvu4rfuqAfDjNdypsu32ANbM3XvaSHK+WmjIBh2fx7fhysE1Mml7oVU+0ZwMyqpbvi7Som9cp
	nHXT7rEwJjB8/DUCdOe+uW1KTkpz6YM5/9IyBqLMuUpKW44LRUTj5uOGo1f8EopFrimXoV9lNNE
	+BAOcID+VpqLPWC6vxyZQ9OL/uFt6QflhB2N9+GZbvUmEunJpAHdCts8fxLsxHT4vRrJtd3h0IO
	CrLzWkeaDHUgBPrTt6jMdvRpu6vGu+5gmNmQuEw34sMe5tVIFa/RNJ3AxGsNyTjLxoZXhW5DHev
	XTfdeRv82l0kUbDx3XR1zNnLb45zKFhAZDFAoXJXx+DFZrZ4c7OgVM2QKSwxmdJFnoFJmPYnsa3
	lFiCIP8zijF0F1xO4EAItiksZC7uzHwBSBy6rZj8aTfgRbjLMqwMtPjTATuT90tZOaOeJNeUPER
	Lj+ZIPRVgrlnlBILadn4Tc=
X-Received: by 2002:a05:600c:620d:b0:4a1:946c:953d with SMTP id 5b1f17b1804b1-4a1d76254eemr138734535e9.27.1792345069228;
        Sun, 18 Oct 2026 10:37:49 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm413254655e9.1.2026.10.18.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:49 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 19/24] man/man7/unix.7: SO_PASSSEC: wfix
Date: Sun, 18 Oct 2026 19:37:07 +0200
Message-ID: <20261018173712.27670-20-gnoack3000@gmail.com>
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

Use "security context", as in the description of SCM_SECURITY.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index ff5a90863378..ca862df7cd95 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -307,7 +307,7 @@ and returned as the result of
 is an integer boolean flag.
 .TP
 .B SO_PASSSEC
-Enables receiving of the security label of the peer socket
+Enables receiving of the security context of the peer socket
 in an ancillary message of type
 .B SCM_SECURITY
 (see below).
-- 
2.56.0

