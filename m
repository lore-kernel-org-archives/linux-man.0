Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C63D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345049; cv=none; b=fa8bVL0IMiprW+TpvS7OgfxasPJZsKu0ccxxMjOOG1CLe/uXwK8q+EhDrxA+1U2TyxxoE0vixZA6srE2VrrFUSJn+Gf7uNDLrUG4Hpi6POCSDd5qoJ1Bmrb778kaWRTy9JMcFsco9p1FDXq3VELVosjBJh/gC/e+e2vsEXEDOqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345049; c=relaxed/simple;
	bh=y846QOhH8qcEsNI5+dvuu53vR4P14ajFxWiRweNEuXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBuB3AkpTCBN3qwZMfH3JbVJgjIZkXkjRUIXbbhIShuGzHZCvuuPJ0XXtgIlrtsUW3f3pLHZy3NKlZCgQi1PvGtPVF/Wnj7lkMwpIt1dGs8X0ftGw3tq+cEQRzieTMWpKVoV1OX0KKRMtI9YxgsqsTaOqR/gQDBYdYJ4C1UoJlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haOsHyZu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haOsHyZu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1df146015so5751255e9.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345047; x=1792949847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Zf/5i0/9KCYnuiPyh+ozjWwPw17yiRchb/Aj95Gvek=;
        b=haOsHyZuVoElmPBEM4vm6Qpvq+v7QeHI5+VxC62CtpXU0erpj8wdaHyhGwYtxv88Od
         AD+upA8xB2j9ayQGfVIJgBNh4pNCawiz7Xb+Kio0w5C2YTkSCzZFQbca2D3qGssaOpMC
         9eCmd1pVgw+ZcGPzhuGl/jmMOOIo8hXGJxyeRNxU6/Wb4SmHH6kYILAcvU2BzrXVWg+e
         fWGpoLafvBEhoV+/Co+zn+qkGqzgciDqmJW8/w8H5SH9mWdHLMeQPElx7dLEjtwgwl99
         k3H+51hv72xmRlvtspAso/kqrrSAdXdQLB0CFTAhknaGbQGujiG4IacGPbCMf5mPIy/+
         QU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345047; x=1792949847;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zf/5i0/9KCYnuiPyh+ozjWwPw17yiRchb/Aj95Gvek=;
        b=kyk9ZOW2ee55HSfr3P0Sr9J8ITSupgGsIKUoNsAR+SIDaJq7H+3N+MHtTBeoQJu6UJ
         EMnX5ae8ojdSj/phlAS6/8ptAEC+MNZd1nEVIPJzbzphRMsDsinKrwl5EbNFVyWDC5Em
         CS783tR8gAXGvbCzmJGjNifF4mZEg9ms/r2lUHCrAJIVLydD4t7jO34315AOcTmuTE3N
         Q7+54ryZ4QEjm7nsCfD6rFoYlZggmwmZBkaH7uLrv4Y+9wOYEM7VDanDiZ/0HC7IUjkK
         IbzysGv30JiYVKeeIwYuXgUrKNSNkT8QRn7jUkzdUBxVGhg/+nN8c8tUK6oQys8Y72p2
         Kvfg==
X-Gm-Message-State: AFq9FYLF5iRK/+CxFy3pJEZiTsJugoiEZAUnlZdntROfwS7/yPYmTsQi
	NaqfOE1PRsvQq1hwHPr9hBkIzZuWpxx03ApJquYGLSQHoonfGawpKiQv+LFcKK04
X-Gm-Gg: AYBFou0UAnNRsqJ7/5ko9R2RkP9gj2/ZcQiYxI/cies5lc/GGJ/QSEPwbovV8WgO1Cp
	aKCv5NLuAv0bs1uTC1jpEL1q/qdl2goUiy7C2LlRiRPPs9T0rREjUklIGUwdkGD7Rir0QF9Sr0f
	+LgJmEtxqtY7gL4KjLoAv5Ztj0G3QVqgAhrYr/x6e/WM4gG+c+ojPKSD05nSwAlvPIzIJmIt5yH
	9B9OWW759NsUDy8NdHXUYj9lxHQrvVaz0xaVuI5HJbX4Yhr6moGChGCeRrbZzM5tu9P0mUjyKXu
	g7KZ27mcVDNfjMaRAJ8dB2734DYCnYg/0b+SYWmilEFLWc+GkQzAFcblBxz96S9Tu9M7Kjsz8Re
	8n2vcOLgg85WgwPOrOahTdc1RPQpIFErohF0oZWX4wp3r3nvZvobx5rNj0g0rebdbHrtC3XT90z
	8CXKzAADCBZp+ImTrraWezh042+sgGnaeEPlMxmUMr+83WC0ksOXR/o7aO79RlxIoWyAiCVerNu
	ce2wC6jEgiIsdvbLrvuoCU=
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr115008385e9.0.1792345046598;
        Sun, 18 Oct 2026 10:37:26 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm18415710f8f.47.2026.10.18.10.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:26 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0 is also accepted
Date: Sun, 18 Oct 2026 19:36:54 +0200
Message-ID: <20261018173712.27670-7-gnoack3000@gmail.com>
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

unix_create() in linux.git net/unix/af_unix.c starts with this check:

	if (protocol && protocol != PF_UNIX)
        	return -EPROTONOSUPPORT;

Therefore, not only AF_UNIX (a.k.a. PF_UNIX) is accepted as a protocol
value in the unix(7) socket(2) invocation, but also 0.  0 is the usual
value, and is also given as example in the SYNOPSIS at the top of
unix(7).

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
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

