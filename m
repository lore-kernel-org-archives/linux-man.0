Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BAE476068
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106978; cv=none; b=U/kbdYmiSJsLRDYVtSc4Ui0MlfwdqJ5t8RXbqWo05n2xpJmMipEzUbL+9By+INYrFiomSF8ZYXx5BWbX7GR9oX7WtjaIslISYStM2xQyIOaXPJqkOzjTVHmjFgo3yASrPbPkLYjvFeYY5xikL3sQesEIXhHR9sJlcltT25A4NDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106978; c=relaxed/simple;
	bh=+sxc/pzHrlxzK2kuacc/4ReWyl0ACsLBL9hegiMM+so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sK4Jttk/2q8hhKEGzOKbGk1Q2NM1yM8eBNCEuMbceuEuZlQdSioCE/xiorSdVoygOgVW72VrjxZQANhGopmfshlF+opbvqF8q6uODGsl8O3QDjwfeFGcI1MjeFH4xOZOxP4PUPS8uuAEDPoqrXMKE4PjJc+t7UNUHSilvDejiu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuePzyuU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuePzyuU"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3600071a91.1
        for <linux-man@vger.kernel.org>; Fri, 07 Aug 2026 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106968; x=1786711768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IuCQOtst+b0eK6rAJLoie3n8Zf0DcvNJxfl6crDIvF0=;
        b=iuePzyuUOteY2t0s0tVAg9IcTaRnh8E/7w/iYWy33gWZ8YxwcsQ5/BVpPOjyrQU2Ap
         MrLkAhpsAof5eKmpxhVIqXrAsfdaOf1PPTTgiMqvgPwrjS+fRExltKvg9xyVUjeo1SG0
         35UT0qgQW80AIThXx7vpBm2wRe9zzu7YoqkOl906CKxAd8K73b64ahKdhZxC7A85+i8/
         c0UgzOYRcIoqgN7UBvSUfFLRWSof8lbGWDW0ZIfbwiB8qxohsFq1Ey4hjsOZwuZyWHi3
         95ckV8w4aUFoxiRwcyDOhndoxzRQAScCL1dv2nV+ppAEB5oqIkTdwgCvsUcZJ6v1qWFf
         QlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106968; x=1786711768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuCQOtst+b0eK6rAJLoie3n8Zf0DcvNJxfl6crDIvF0=;
        b=sJHu7jIUbsEHvgUtdYfhHknHQQY7u6321BNrQPymR9V4BLr53w0XzfmaOVjexSx3Qe
         MIHluNkeks/sZFSLOX/ZgpCjqaFHSrVtGereakOL4hJ0PSuMSn7HlFliKyoTZvRalwH9
         YmNe3Ra4YRmuinyRBEZTJYhCoB+1FQ60jLS6QCjlNcROoiLK3TmEqWsdLOS3195VMmXh
         mio0rTBLHDDZSNFPzgNg29iUw5RTs6qdnko3LlTGzyv77SrCjjCMfIAl8VfYjqr3ZbtO
         g/aNwUO1Up85XdH4ZcEVt+SRc8klLyaVpy3WmMhLOMaUbf7sAZRNsOO8PspymeD+CqhB
         LVSw==
X-Gm-Message-State: AOJu0Yz6mH6hzwEwoYlFUQmi0Us4ntSQxo4gI+gNAobSAC61SAQpjyPQ
	dskhDGumDR2JSk7M0BLqz1AR8TvYs2FwmHRSwHI9z9sumvgHgVqABinM
X-Gm-Gg: AR+sD11rTgt6d+2rvyfLaOl/UHI3C6I+u+PmfIyMDaDxteSHpihnGkPjrjbQcPx6MzY
	g93Sb1qWjyqhT+H0bUp+SRlwsxDQLyztgSL+9qOUXxu+l2xcSn2E+R7bqKAaLWv7G4xVKdpRWgy
	+RpL8AFJDBiMz/5hTGv05ADkaMgYn76C6jrunFJkqqJNM/Mdyvc9hVctddiBAVdITC5zRyMjQwt
	4mAsIwGIcjBYx4Ko0XN8yxshb3GXejFHTr3qNRLrB4KbsTzEal+fjr0/Ngd9KJZxAD0pgfM2tos
	kAKIcUz+fTv7RNINlFvN0O5EFR3l6EzKcfnLciwoOkP7KsCZlwi4/w2PrkwukzQ34MmngEB/y6J
	hSaK+dcGYtkWrFRlawYyG6wfa0YTSB20r3rxgKzz68icIUiYJskmL9sGvxc1JIhDRCiP+303xkm
	Ej+ndn1BnQ0bc8blUpLFG1gSj5e+E6twhHP6MahaKFILTYq2DXt+mnvYuj44ab4PkE8P5Fb01Hv
	YHMfvZjgu4xSDzFzK1hZFc+wQcwzoZfGluOLJAtmVHwl7QhFpjmTQ==
X-Received: by 2002:a17:90b:4d84:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-3903c5dfd9amr21206013a91.18.1786106967958;
        Fri, 07 Aug 2026 05:49:27 -0700 (PDT)
Received: from masabert (softbank126139061086.biz.bbtec.net. [126.139.61.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dfcdsm2604771a91.4.2026.08.07.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:49:27 -0700 (PDT)
Received: by masabert (Postfix, from userid 1000)
	id 679B123616F1; Fri, 07 Aug 2026 21:49:25 +0900 (JST)
From: Masanari Iida <standby24x7@gmail.com>
To: linux-man@vger.kernel.org,
	alx@kernel.org,
	mtk@man7.org
Cc: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] resolv.conf: Update MAXNS header reference for resolv.conf(5)
Date: Fri,  7 Aug 2026 21:49:16 +0900
Message-Id: <20260807124916.18007-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.25.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAXNS limit mentioned in resolv.conf.5 now points
to <res_state.h> instead of <resolv.h>, matching the
change in glibc headers.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 man/man5/resolv.conf.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man5/resolv.conf.5 b/man/man5/resolv.conf.5
index 8e914f12a18d..89f9d903a1e3 100644
--- a/man/man5/resolv.conf.5
+++ b/man/man5/resolv.conf.5
@@ -50,7 +50,7 @@ or an IPv6 address in colon (and possibly dot) notation as per RFC 2373.
 Up to
 .B MAXNS
 (currently 3, see
-.IR <resolv.h> )
+.IR <res_state.h> )
 name servers may be listed,
 one per keyword.
 If there are multiple servers,
-- 
2.25.0

