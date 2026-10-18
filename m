Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BE3876A0
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345044; cv=none; b=d04NS6itei6w9D4w6pCBvh4I2rTqlRDKWjMDjZm56C6FUk+fLiNVr3hOMvTlvN80Nj4Fg/Pr3RGjc+nLExns+lfNdhB4B7thNz/IY9HFpazf1tzvXj5mAUeUaSXsgjSMehPQuwLdpESkxOg/0+B91owMED+zsHPF1aQn3ECF1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345044; c=relaxed/simple;
	bh=5wgtlzCSarz8MZOQoxH0OjRZ4CxxakokDuJ6Fb9iAu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OM3ICdhRxrusIGsLa/P9/H3VLmRy6CaIbTzxe1/oGUSbBOsivBot6Z8o8b6QSt0Zwn+bOrnB1k1NWFqy/A3GHQWyo6FqmpW8ngfxrDzkXaen/dMlPTPmv5Ay+G9J9lIc+NBjdZqaat//5WF5deoSehw7DyoCABRiReHrGBvU8tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyYosMRu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyYosMRu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b042c0759so780496f8f.2
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345041; x=1792949841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xRQ5db1NA5LGdx5FjBOGJVhPmEaX4iOzhhH3cM7VIhI=;
        b=IyYosMRu0u9irje7hC4hc9qqU6c6j00NkBJMUH0rvOJnEYAskHaCgewtDhF/UxJ0Js
         QMec9oSBSqepkAecgjqA7MxyXdCsCJwldZZrarudRcAZr7jVN2s+nVPPOy592xmjftn0
         /RqbsjlPeu+c+SE0yfeC3Qhas7dWlfjCfmYExV6vKiKQ/rUs0W8XWogZaC8zgYsx41oc
         6wuSw+tJtJ3MKa2DaLALwNJx2g8TN7gHZLmkuIVfdcjIJzPoJiEWVXcOsiDXwKp6hxnq
         RWTak+OIZrzR1fEaXHHUSzlN7vFPgm8tUQqr0DC7b2PH7aq1+II0/XiOfulS8tzI5qwq
         amow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345041; x=1792949841;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRQ5db1NA5LGdx5FjBOGJVhPmEaX4iOzhhH3cM7VIhI=;
        b=MAGgcl5m0EqVeMUFPStuT4kYAI5QeS+p8ORzW8qMq39474p/OTB0uC2i99E67AFj1G
         vOvIs2dSaxbRywa4QQ7Ucet6V6UZ6/DZUbHk/jbv0hpKRyiGW5sC+NPSnGjq2h0veqy6
         a9yCk3PtVYiDC4kLDftKaFOnqJtzX2aKQjJc0SXm0+m9xAy3JMClA3lwLam/VSH/TWFY
         2CNN88wgfnfmZp3/Y2c/4YpsD49aPfFhFpX5XpMqPI6P2jN/BsX3SUgAaXXl1VgHD5Ab
         k12gBhx8+ePb0scOTcpmsN+MDL76saffa28TObR5u/xLzRam+iz/NxG9OmlAYYAFRztK
         rPEw==
X-Gm-Message-State: AFq9FYL4sci/scPKJ5qp892MIQOCElgpjzZJTM3lT5ATz+U+1en/cTPZ
	yVNxXDxwWfRv5+jbI99hB3tKC84PVNcf3t6Uc2dAySDYdiQ/wGbSGYL3RDVLZu7L
X-Gm-Gg: AYBFou0M1TUWYQYkpPu/MhaVA0y9pugjBaHIYwIpTGtd4IyASDbvk7WlNsZYn5cPHby
	4P2rqUCnoP6lmWToSdmdXTy5xVa3M7IJfj8bMN4bVkQmMR8zg8BviANpM0uqz5T5gxEBB2Ylk7i
	/EDMfgPFOmkrEeI44hK+l8QzWPt6X3Bh3Sx/ygmfAXTvQhHZM+T/3Y1aWGQcpDsj+h2GH8Nbe6H
	Z/iHE35/97VgTUQt1hS+6OZj52l1mbBvOfPGDRf9+uAORuJcLP9mPCkavRPzuLIay4IWmpy6juf
	Gy5M8vt3rR1GtasPOiVvWrJPoQYLR0tdaSrISQKOso8QIEY/8+dJ9kyQ3hMbwCb6ioDC3FvWSGX
	FT26YWmv/bOZV8jWWb0Jy0SkvUoIkwtQs1aF+vcv0BpQNPzEm7Km2RQhfkKiWUKpiqKRXYOfk5Q
	/toc7SO03ztJhU/crFWbZU6T///n7U6HeYTuM+YStX4QF8xIE7XCejZL6KTZ12jog0lnhpdGE+i
	xBFkEemmGllMOsGM9zN3qc=
X-Received: by 2002:a05:600c:4e94:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a1d7626630mr118860285e9.30.1792345040863;
        Sun, 18 Oct 2026 10:37:20 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d12sm18373952f8f.36.2026.10.18.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:20 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH v2 03/24] man/man7/unix.7: SO_PASSCRED: ffix
Date: Sun, 18 Oct 2026 19:36:51 +0200
Message-ID: <20261018173712.27670-4-gnoack3000@gmail.com>
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

Only SCM_CREDENTIALS should be set in bold, not the following word.

Fixes: 421d34c63217 (2018-12-23; "unix.7: Clarify that SO_PASSCRED behavior")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
---

Notes:
    This looked unintended.

 man/man7/unix.7 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 1a94b00c6783..1054d7f52a30 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -276,7 +276,8 @@ as the level.
 .B SO_PASSCRED
 Enabling this socket option causes receipt of the credentials of
 the sending process in an
-.B SCM_CREDENTIALS ancillary
+.B SCM_CREDENTIALS
+ancillary
 message in each subsequently received message.
 The returned credentials are those specified by the sender using
 .BR SCM_CREDENTIALS ,
-- 
2.56.0

