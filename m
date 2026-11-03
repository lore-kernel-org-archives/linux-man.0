Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737364;
	b=zAjUEb5UJhWj06EL2pm+peUiAllA3uMScqP7H+4Ul7PwoUIMyxE1MvD3hcvtAK3M6WSv
	 eh0n8WgdRVA8kJFzOTs1ix9Yrlo1MACJGPFQbOcYEJJLCd3Q13PXrLyku/aVcBA5mlCGc
	 Ok9bMbzsNIDEiXfU1hiF5It3Upgt12dcxkauh0AeRf2BqlCU+PTEpghsJGf7CllmIEWj6
	 SG/oEttowJrpXIkNazGKuFtODhYbuM5tOxNcoBV/f8gLOQD7FcUTgj3npC5F+qTC4lXHw
	 SSHg2YgyoSRxDUamfRzm2M2Rcyoe3JB1F61vnZkUBZXkQw884U6pQe365YcCaWp8RmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OPf+Y56iO6Ooed7IywL11nzdmSw8XShKkYkVXasFE+g=;
	b=vjPHnWQ+u+neVjS6r2G1Ykq/NmtHC+4XoBk6Muidw7s4jg9qfjvg4tauNpTfpZByEFd7
	 KovyWBn/k9Wd+1F3mMoVmnze5DM5xAInCjQ3FmoQPdpTb93mfNUt8HeeRvxceoat8vY6g
	 Izdh8BYaaU4WQalf7tNXKkTBHPIJWD6631f2bkBVsYQxgR8yECy7ilkLYe3ot+v6jPNeD
	 RXRyPrR14n0+YzKu7ZrKoRKTaEvmCAYepY3kQxyi38UrSiJb87Ye/DQXOfdqL8FKp7GO4
	 U+M/DrfHOOlaFFLaIqqeoAJro4lsvgNMewf/+HqRFcwiV/587uMMALLh13T9z7ureCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iitANRhl;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88014606A326
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88014606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iitANRhl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so29506435e9.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737363; x=1794342163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OPf+Y56iO6Ooed7IywL11nzdmSw8XShKkYkVXasFE+g=;
        b=iitANRhlc+UDV7HAmL5S6GcAjYoFUsZWajy5lTLUHaFRq+caglxdha+7yacCalTq2r
         zXOSKURDBaT3TNkLlYqUuO7MIrMQDWeZHqUR7RI51fvrHfJK+k3yWZobdIolFGXbNP74
         j3QT1uXFVaWDpCsodH46JU+h/zIXpzAF75bznHrVggdxclfWQ7WgZtE3ThiKf6zeo38h
         SYWPpnmsCetcpoLgk9mrt06I32HcAPbZhvMk0qEYZgbjIhViixJxq+zWK26ZRId3D2qF
         jHn8UgGREzciBBExTPAVxs47wURhK/Uvw3CwObkdnCOBgraLYF9lIvBBhzyLd7VTJfCu
         L7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737363; x=1794342163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OPf+Y56iO6Ooed7IywL11nzdmSw8XShKkYkVXasFE+g=;
        b=Dwf8oH8SPdOQTv8kTHu1RuwtczW0wfZGc/DCyKOLk2iFTxBRNzfKjXs3B6ZgMk+x+N
         9Mv1hQJlhpDQb9u7HuwrWMdEe7N82Qk1TczAx25S2o4JX4EAgCYsh0EgFj1MKM+p62fT
         bok0wvS8xe2qwZtg0Patmp2RUKmRTgVm2ZpSukjE5DRxhYMYLvVruKO/avz1UHaJIoKE
         DlpTxTiFHHCtB0OiiWk4FR5Hp1SFcbcwu6Yxm+PG7hSJrpL3ryyc/9Qaivl5G/oM2fwk
         c4/Ds+2KUfG0G6cIC80NBCPSe3QC0oeCA19F044YmOnBx6lTAVAb82kX3Yjwz75L55BT
         rz+g==
X-Forwarded-Encrypted: i=1; AKwUvBwqM/lEyUZIibGnD44WfBNvt3+p/sHOkCu3niYK39wJkpZs8DHCHHRpNuZJpYlQr0ZS1nMhX5AhKVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nf1O2uLhgejUwKMNFJ61OOjr8qNtbjWgUDtK/I/I8n+WupW05
	QvIYELw7egKvfSpnLAPpG2ZngoQ3leSSd+qbv7W4QUU5JBG6x3ZRORAS
X-Gm-Gg: AYBFou13BKz96tzpq2iU6flg5VFkD/MSFxLtAV/etIvuf97Wpi0b3BAGVh7P2Emc6iW
	6xitrzQKiZ/08M+4ITK3YZdobssjqB4Z0IPoqgPsMKK11/3/P9EI8vx1B5UtZM9ckr5TL+w9WQU
	wbjgusUKq1iVQnKGrJ4lIAdUa91Iq8UbUk+OvuvCj5NlBOIjXj8n+lJxrL3sao/jeFN9S0u7FBI
	wK7ZkvVwNnmpd/5IUAuQwOzXXU2DYj74L61Hw+JDp7nfCVQ8D5obydD5jtnb8n8OSlbM0e+xJ/C
	5SuywOtA+z0tfKT0EQZwS9KIAAlnSTwUzGcELp6lZlcW12s2aJfIyDPCxpHMmkbEAVMTGfizPMc
	r/W9wZZ0vbHRvsaZCWXm1/m96Sw6Rk+8Ma/3cRxVpmR3TlRIcA1XaSpyrkG5KIOQvgTPbx1AYb3
	/boV1zUn9iL6lHT2f8LNUJixgmunkXtb/+sicXtO47NDS5OWq9sw3cmvfBMS6IK95rme+YbfJNN
	yWyHJcqFUflNdldmVmsu4cwuBoWRKXBvWDkR4TZRH3gk+FxQQqpOPfEY52S6XMyw/AdDprk0DXz
	21REZGs8qBr8e2u6R+afo8ZkoAzxH7vihZxFhrieZiMLW3r5OSg6cxJaSuafXGb29hRyzN1yyjk
	=
X-Received: by 2002:a05:600c:1c17:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4ac18b7ddcdmr302426985e9.20.1793737362936;
        Tue, 03 Nov 2026 12:22:42 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcca7d4c9sm404814f8f.34.2026.11.03.12.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:42 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 5/8] man/man7/unix.7: SO_PASSSEC: wfix
Date: Tue,  3 Nov 2026 21:22:07 +0100
Message-ID: <20261103202211.13820-6-gnoack3000@gmail.com>
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

Use "security context", as in the description of SCM_SECURITY.

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index c0e2bdbacdd8..93a0a335e791 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -312,7 +312,7 @@ .SS Socket options
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

