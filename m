Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752E910F0
	for <linux-man@vger.kernel.org>; Sat,  8 Aug 2026 02:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786155345; cv=none; b=sKFGa3YrZyEN7qcVuFR3T/96dwPIH/8S7oZxmG/GlPnzvbIjsvfZpNub65uHhRQN6uBXjDEFu6+oPbPrLcbp+nIXuT/x70yscIder6L1xHqVPljwSIAnM6nIY2r6R3tcrY2mhnNt1yBuuVX6h54xLivkeHUbx84+FkwguWFJ3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786155345; c=relaxed/simple;
	bh=k1urObhh6lRmzp+QUkWSM0dY+n+pmUKcNRs7b7YdY0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aj3OvIaz9w75XqtDc54CrWqXOh08PokrIlIZFv7h1h/JbDDlSh7aTZTHoZp0z9iZ4ioSQA2bZ27Fd0SgCaL5Zs+dL2MCIiMBMvBGDlkP61owPo0zB6QNwhUalxAKNujsGV1T0XeKlt/cPb8TyoMK96ZseTgoS3Tfa6jfEswBujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfWxSkTE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfWxSkTE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2867055b3a.1
        for <linux-man@vger.kernel.org>; Fri, 07 Aug 2026 19:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786155344; x=1786760144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEHpM/fPp8g8DtpaZdR7HMICrdySTMdZcspH9MwAFFs=;
        b=SfWxSkTE9rqGquanHs0pW8+Cv27PrFO9r2acaxKyg9mzxiOypWhaYrQ17elT6Oh/p8
         i09saFaa20dVxnGNG9APQbWUNh4T33nZ8xaDBkcyMlUtznhd4YXfZyIlG+pNkKwAfsis
         398f3hVRyjDbr0DyIoAOZUWYxbbalpMW5JtUBH84OOykoXig87d1fAmRq37wzul90YcG
         XGE7Y0sIBHF/hjhh0gCAI43NSvNNg5X59jhQMaIfl4NNeuGBTQXgl0kq4yYMkUm/vAFS
         Je4jlStJArONjxkz1OpItZtayOYSTHeV4pzNArf5gS2uEq8zjuk4FWVvW4QAmzctOghY
         XXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786155344; x=1786760144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEHpM/fPp8g8DtpaZdR7HMICrdySTMdZcspH9MwAFFs=;
        b=Qy+5HzpKGCV5tUjoRgUvur5UiWz8bV1zGyIYIBcvjwESkaG4MpWpSsoZEYDHK07iW+
         ZPSkmNez/S4WZ1Tzj/EQYkvdIIO5KIDSf94cPkektKYt3qpcULmxunaDEmiogpi8+c+s
         vzw1D/92bjF5/WSu0DegnU3tFIFdoFPk39JBpGLRZxjxKwwX3eAZt6qTKytupc0/zk4t
         gMZlCgJfdC9o/Hf8USLxIPVlNfB+MXFDv777y+WRYC6ccBAmxLPVtnNkBdKvRsl7tZhg
         3I4Uon9Zb4kxMU7CMoxmNuZ4jTL+Iry5gWT1nQzPC9SOuN46BFZovrkWgOpItX5xP9nP
         6PoA==
X-Gm-Message-State: AOJu0YyZS0nBfgx5lHPxq+LWTKlBtkGFvzQH1IYmXLdQcsvSBm5X/qaC
	VvKPb17uw/FQzc9a9OtIItAqJHAsmzy8/bDMxibyq3P7Wkxeg3Ap7Ike
X-Gm-Gg: AR+sD13HfrXWuQFdRVxudzfqEfEfTSFlOCs60XZriCcIQ8+HYqIUdQe2iCvp/LxQIOW
	ehaj6HL+iRRYydfVTQ4YCVdhoSg0B+nkpGpd4eqvfGPoBLpKn8AZJAbQz0UkqU7wk2PxgHBM6qL
	QeNVUqMcLPS6s/J3+6z7pb6klVmCyGUQwgbvvC225DCtKjs9pSC6FlxVls3Dj8piycD/YOiAXe1
	r08lp5EjupOCtrEsPnHMYjIqsuLIfz++45ERldz2b0QffSmkKknUCDUAY5dPmVyDi+N12TVdieu
	tOsuq4V9oXYx55nqc3XEpPJP5Acug3mHJjuB8kNAhPahW7Beok65wX7Sn6nF49PyMJmLTOB2nuL
	8YlxOEQz/PO/IRBVrZnq+4yEq2Mhzz55lDjhHdv3Kw59d0qXKtj6LTlm4QEgdaQIfvxTsrAO+i/
	P7ohLKQeKOhqsYEtnRnYs21e4M5c99SFv4kMgSguasLaJt83VhkdrECia8So8OUX7LX53Y5dt0N
	PuUpY9Wn7nC6PhLrF3NQtlKy5fWGYazKCzBorjRm+0=
X-Received: by 2002:a05:6a20:4394:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3cbd3c7c71cmr3088831637.18.1786155343706;
        Fri, 07 Aug 2026 19:15:43 -0700 (PDT)
Received: from masabert (softbank126139061086.biz.bbtec.net. [126.139.61.86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f35bc75sm1340559a12.19.2026.08.07.19.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 19:15:43 -0700 (PDT)
Received: by masabert (Postfix, from userid 1000)
	id 9ACB923615E6; Sat, 08 Aug 2026 11:15:41 +0900 (JST)
From: Masanari Iida <standby24x7@gmail.com>
To: linux-man@vger.kernel.org,
	alx@kernel.org,
	mtk@man7.org
Cc: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] resolv.conf: Update MAXNS header reference for resolv.conf(5)
Date: Sat,  8 Aug 2026 11:15:39 +0900
Message-Id: <20260808021539.146429-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <anZtjC89LJFudMay@devuan>
References: <anZtjC89LJFudMay@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAXNS limit mentioned in resolv.conf.5 points to
<res_state.h> instead of <resolv.h> after following glibc change.

500b3a499fff (2017-05-20; "Remove __need_list_t and __need_res_state.")

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

