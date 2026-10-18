Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3F3D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345051; cv=none; b=VwSBgKCCCftRViVgtCJYUJM9CH3nalU8exc+8ZQ8i4cMTy1Y9nyagXrMUFjC9FTZGln+/9scJhs2CcfLV0CTIKXgndlySGWFpRTYfV5djFCPN49M5I9OdKODUKezjfrgpr1Sz5Zp/5EV4Zz17laEgKtLT6rLL+KSpo+O7rwE4S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345051; c=relaxed/simple;
	bh=tvcV0X/i3xUcKedYw0nB39zgYUVKKGfUjlPJrvp1fpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfmzFVJqnOZ3F/wBjppfhveEsaU4Tk31Oh8q4epRL7RvCRlPxiMT/lAnbfl3rD+heR85IMxZwVG56FtpOs5Dn8lk5aowkAMxc2C2PtzosbDwp/JdotgmwYLT9bEFFOHBqHp9TAoeT6Jcn6fPgKrdD9j98MkSBEtxDXLlKo5vJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYvITSz3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYvITSz3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso1209536f8f.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345048; x=1792949848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hS+Gxe8KmByaidVk22XG/BbpGqs7CaZMwyISgHMqIm0=;
        b=mYvITSz30+6VLrokmBqkYmRqfrXp4ty+Wd/sHXW+XLVhm2vXm+2zi4+03oqSOXAxPj
         b0DuiLZk/t9/ulsgJTJncLjfNClF2tN+EITXl5WryvDxPVIfHSjMM9FT8mVySFyimP6E
         9IMqR0WxrN1jYhvF2ud/pudEDcgWrJVTlfioAgz89iKIwuoXra4CVAsKDOqFfkqxG/97
         e8IXIxyRj1OlPtBtBDIQ/ZSAgk9rTzxfnx0p0PPBXKiASOvr9296g+ixgVZcqW95iW5V
         Xf4NjXDgkcizYUYOs6zaeypXQbrPZUjMwpFsLiudjZg7oHOdSnNBHr9gYCmV2X+o6jm9
         fcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345048; x=1792949848;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hS+Gxe8KmByaidVk22XG/BbpGqs7CaZMwyISgHMqIm0=;
        b=cztdSO8mO9Eylepz5i8vA9ZVTpI5+KDjZ8hyujSGmRmu9u2jvCzeAeEyKrPIuZTuby
         0WAIMXTIKsjB6UBUf7dG2SP/6VQNM+xgA0X47HDs35gNNzUfr7GIzd+/IeZzTvX6z+b/
         XuJfhdnATmy8sHlKIgSauPa61v6zwwzkB14NbiZX3Mu5OT3btieLEryY7453A2UzheSP
         jJuniUtIE74loM0l/kl8lYCMR/rzJmHrXzc9NJUi2vdSJtO59pyaDLNKgFifv9q88w0J
         Qe88undH40IbgvOXbq5WWan0+skNNGBu7L0q34dDlyEfvZTRRzkI8LaWTLPSHW0bTg53
         WfYg==
X-Gm-Message-State: AFq9FYL6YOEOJ5EmFb+y6m++Ij7WaDq35VBkTIQYpAJ5xsbsfbS9WB9d
	9+sueyrzbc93qF4aSP0Tga0thKGWLxL3SdU5WsnOpHqlQi9PYjwZTC9T
X-Gm-Gg: AYBFou09ouE3MCgOCY9EtI/jfOA2xcD+RkgD1lIxdGRWHxWvsCvJI/ILU1TQ0GKJWDw
	Le1I/iI46eNccEfk+kfBc4NTXV0fmMxSIxaq/2msTz0eewnwkEpXiU95Gc9tOiG5EVL+yM25uME
	79HtI3rJ1HqUQqz5NBpRzIh0lMJeZt2hoMRyl7g/BaZDp+IFijLqATA9dnCnnj+FhqAhb8VPulu
	sEdnuTR+x9DLdalPMbt/g0Nr53uht677jgINHoYcRgO6w5FPvkdysoyvNJ5EXd27OgCUX3N4N81
	9M47TldbRu5rynCAikFF8ObxRM3AT67dyTpr7zmRaTELxOF+TCZWpn0c3YKmeMiWJbOfvli/yL0
	uMO5j0O1+YyuuvwRKTbS7r19jc9yl0Cq+oHm3i2Hhipz8/LLWevFJmge7RCOYjG7cKFmEYNR58n
	X0RuON/xbSCdG/XLAqHD3Z/iyoFCZnDOhpSi34S9KyMgr2vlibX73p9jjceRsfqLdFA67nuUJaI
	m/7leVViL1B1xRlbneKGsY=
X-Received: by 2002:a05:600c:4f88:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4a1d75fe190mr112169995e9.9.1792345048269;
        Sun, 18 Oct 2026 10:37:28 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df370381sm72707155e9.1.2026.10.18.10.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:28 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2 07/24] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
Date: Sun, 18 Oct 2026 19:36:55 +0200
Message-ID: <20261018173712.27670-8-gnoack3000@gmail.com>
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

The ETOOMANYREFS error is detected in too_many_unix_fds() in
net/unix/af_unix.c when the user's (not the processes') in-flight FDs
exceed RLIMIT_NOFILE, and the process has neither CAP_SYS_RESOURCE nor
CAP_SYS_ADMIN.

The check was introduced in linux.git 712f4aad406b (2016-01-11; "unix:
properly account for FDs passed over unix sockets").

Fixes: dc4eea68b565 (2016-12-17; "unix.7: Document ETOOMANYREFS for SCM_RIGHTS send exceeding RLIMIT_NOFILE limit")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code -- the condition under which this error is
    returned was not fully spelled out.

 man/man7/unix.7 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 9df4d3b6f635..86e72d0f58d4 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -732,10 +732,14 @@ when sending a file descriptor as ancillary data over
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

