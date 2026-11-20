Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191145;
	b=iggmYRx+EHApjZ56A/xlkS7qOBlGgmL73m7pTMzQDgV9YmHfYwBgzivJjkXijxj5/CDt
	 qs8C3lerMs72tJLWVxe5Z+IvRI/zmGNv0z+eQQg81ARPdfhPOvaN9ThchWZNfUjkjbNdZ
	 zOl2N3l+42dAisEva6Raq4XntugXBY/WqFSBZ4bi84PuwyJhfbd2RaaBd6667BcaZ0CBx
	 auuD2+Rxweddaz9BzSA0jZcqf5btxD1yuItOKtBOfcbu+Yobaq3Qw2uhg0zQ6I6laSlIE
	 f/jPg6r40asQjh4oiM78O5iq68X1VSoWb6Zhyk5zEwhpdyKRmhn/IkI8CE6vCShI0jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2XhWElJe3wJEULyF7mJ/wvXYbX9k3wvUeTmvgYQYqaw=;
	b=XMkjOD9B4kht+acnlg9UhCCIH+FJ7HpBaafbw1m7NFI2Y6VfmIBwBUKsTPAPlWW6QvNC
	 3oI0FI02+SfIhRAKPO39QI5uOI8n7v6LDO+cUZpjrusNePKHwiEfADGKFe6vdWmELyivo
	 61cPJbuF1ngk57RJjzr0GOXG084AxAAQxjpZdjJeEoe935j3xrNIf/b8Z41nv5mvrAkgl
	 IT+ibAngDatHehq3MYZoiEz+KpvE0aUBbM53k77mObH1jqKvtBRz8gOUk4gbGmi+RnFmL
	 KLM26fn/Ao0ajsnDT+cD/ZejOQUN9IO85/F6kBKdACexsVBr4yiawuP8msV3lgj1png==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPlxAYFK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C728606A339
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 16:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C728606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPlxAYFK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso10690745e9.0
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 08:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191143; x=1795795943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2XhWElJe3wJEULyF7mJ/wvXYbX9k3wvUeTmvgYQYqaw=;
        b=BPlxAYFKvu7gmXu74W1ZFoXaEOt75lgEjm8TfyTB9zSV8WsvT4inno5RjaPpVVnlSH
         BRrTzdGhPsIF7gJMm1+Z+ge4Nzu0sY1T5KDyMz0Z9joahsn6U4N01eU26JLsJm4mv/fw
         /E6IcpW8w7MRVzDAzxu0sCgcsYww72PIUuE4dIh4QIFz9BiN3bKf4Ysxk+LO4FPor10J
         i0NPtz0+QaCQaOA75LmQYnblzMBwqFBYrECFccnVuWaNtAGdZh7ZdGpLN8B3Cmt3aEzb
         eesVX2fo42d5PGL3Wl3XqzKavD8jSewXlg/cn/w1SbpdD1ifnPuhEFeoWsc+izamCZ7k
         8zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191143; x=1795795943;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2XhWElJe3wJEULyF7mJ/wvXYbX9k3wvUeTmvgYQYqaw=;
        b=di5H/fdMCcaJxPS1tWOnbVTjKJm45PJA1smbNDZsCDrgrn/SB7cDfFE1pNBuSRC7b8
         w6QHV+qWn8qOsJbX9niHPCA4j6/ReRwl9p+rm0crq8G43QdpLDypLP3U2xPx8Dy8Hrtm
         Rr4U41c3+BPOh++RiGK2gCJZcIXWoCBstxqhw8GQuIBDUqbJd/VYg2fX/BbweKRX7GwX
         Zldhy1NLPIHkivGEdTnitHZ3isop7VcfwJO+KZWyINjLW6ltcUSkqx5Bwo2sEO6kyfk4
         8MMQv1DO98k19p5ZCEEsAfHPXKyw4vUIlFt5y0s1z0HzAqA2kU1cKzSVvZFePbAoTBgn
         0qaw==
X-Forwarded-Encrypted: i=1; AL+hErELXEjgMBWIBro1tATPLlMk/aaxdVz69DEk1dEOripnLVaMdR3U8O7UlUsvcgA0dJcWQulapt+3ZtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AmWSKDDxpwKQSzL5ciCUgVlVlINB7WM2raB2oxmNWnbqthvoe
	hU4K+k2ycFGp6I9x2fChGGOUq3JCwHq3Ztws31No8wviHjLyb6a5npLsdNQoedwY
X-Gm-Gg: AYBFou1xxbVj6zM6MQTJxUYouq1Cruc0X4ycjf+UBNqi94Y/gAPV2/B14H/d+8ma5UC
	/bHADkmU06Y2fmWQwp3V8Dl9/5uXLk/8m/slgmlJwDlSKr8og20J/6eg19Lm3vv9UZZFvljW51U
	ZCJBwQSONMXGQDAkvrwNRXGVNkAzR6vC8tiVVull4v57Im9pA1se0KZ8aDbwGsn9L4aIH0CMzTt
	ieU0hsNb6DmKVyCzdH53WSx33Gi+aFAe2GlGtvRGC3aDw6VnZCmvi91s/7WImMNJ15o5ldwhD/J
	gwHO8eHp9SaCrItB/xGP9w/9/25sxWGBFI1AGK9q2wwLm0aN9DTd361W3t7BuF7KpDeeJyNGom7
	/lzq1r+hnXbfC61SjHmNOnEhBEYr0EH4zMAmkEbe0ah2zQ3sDXPPN9gppZ5dtPLWLcsOSQtKhcx
	aJQFAkJIz7Vc6wkzhsiwJ+AmqBkMvclEyxtayF1kPcgpO3ekvTa9mSO/xjCDOYtFWLcI1rx+byK
	zyPSNdmpUU81h+A1IYkuXTV9ii4FHfe4ZTUVTAAzNERwdxmTjv8hrXa0frojdpBhI9rGrYLH/+Q
	OzoEAUyZEN5vm/CxZExMAHLY/47CLopoCb40OCgaILY9PKwRLlyE3A==
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr93319545e9.14.1795191143272;
        Fri, 20 Nov 2026 08:12:23 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm6414838f8f.58.2026.11.20.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:22 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v3 0/5] unix.7: Socket Options and SCM_* fixes
Date: Fri, 20 Nov 2026 17:11:57 +0100
Message-ID: <20261120161202.27163-1-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Hello!

This is patch set (B) spun off from the "Documentation fixes in
unix(7)" patch set [1], which is now split into these three parts:

 (A) Miscellaneous fixes, mostly in unix.7, one in socket.7
 (B) Socket options and Socket-level Control Messages (SCM_*) <-- this one
 (C) sock_diag.7

This patch set fixes unix(7) documentation related to socket options
and SCM_* control messages.  The first 5 commits are fixes and factual
corrections, the last two commits are documenting two relevant new
features (PIDFD passing and SO_PASSRIGHTS).

The patch set is based on the "miscellaneous" patch set (A) ("General
Unix Domain Socket fixes"), since it is touching some error code
documentation in the same corner as what is getting changed in (A).

Thank you for your reviews of v1 and v2 of the still-joined patch set,
as well as of v1 of the split patch set.

Changes in v3 (split):

* unix.7: *PIDFD: soften the promise for PIDFDs slightly --
  there are cases where it can be missing
* unix.7: SCM_SECURITY: Mention truncation, but do not suggest a
  buffer size to use -- that is dependent on LSM.
* Remove already merged commits.

Changes in v2 (split):

* Mention commit hashes in commit messages, not in groff comments
* Reword __scm_send() code snippet in commit message
* s/the last one takes effect/the last one is sent/
* Rewrite SCM_SECURITY section to be about byte buffers
  and independent of the LSM
* New commit:
  * Remove mentions of "namespace" in the general sense

Changes in v1 (split):

* Some commit message rewording (especially quoted the kernel code
  more directly).
* I removed the commit that changed the wording about Out-of-Band
  messaging, per Kuniyuki's suggestion in [2].
* The ETOOMANYREFS commit is a SCM_RIGHTS-specific error; the Autobind
  documentation change is included here because it refers to
  SO_PASSPIDFD.
* I am not 100% happy with how verbose the SCM_SECURITY change has
  become, but I don't see a good way to shorten it without cutting
  away from the substance.

v1: https://lore.kernel.org/all/20261021212256.27961-1-gnoack3000@gmail.com/
v2: https://lore.kernel.org/all/20261103202211.13820-1-gnoack3000@gmail.com/

–Günther


Günther Noack (5):
  man/man7/unix.7: SCM_SECURITY: Generalize to other LSMs, not just
    SELinux
  man/man7/unix.7: SO_PASSSEC: wfix
  man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
  man/man7/unix.7: Document SO_PASSRIGHTS
  man/man7/unix.7: Remove mentions of "namespace" in the general sense

 man/man7/unix.7 | 169 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 156 insertions(+), 13 deletions(-)

-- 
2.56.1

