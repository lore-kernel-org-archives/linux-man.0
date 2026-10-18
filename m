Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26363D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345060; cv=none; b=apYaZEGTavVy7P5Uhc+tHTIdICwLRmlL0qOKtgZzqchQIIWq2eq3lGtUcDdhFcYxH1QxdawQP1/A6ITC7N2BEcIdvwTHERsgkeg1ieHHTRghnh/nO3ItZ69zM717y71wPK1opby4nBzr02qQ0FpcI3ckN9/cjTWvvgUSV6EMVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345060; c=relaxed/simple;
	bh=b10mX8xZfqFkQPTaIa6T/p8pLdhA0+zVLNMePGi8jrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFN/mbXRzrcbKAXU8uJZqAEUrWswJ67giLjtI3TXSAZOka/yXHeC+kDI5rla/1k4dTUWj1aphwqcgMf64I0i4GYN/zr9qk3ok0DL+VcP8O+e3H3FzqjrddrUL5XsUXSdGVnd9SKucSuC++SFNQiQN4/XCmvYaBrw3aXxAkPjEoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct8AvZe9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct8AvZe9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so15155505e9.3
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345057; x=1792949857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GdMzlAoWYmC0lAQDnkbMmmFUgNyfRn6y6z2mVd5BXE=;
        b=Ct8AvZe9NutXz4C+RyeGwusDQEUtp8LZBUrJ1q7/1/TYdve0qw/z0CgaACJJaRuSLl
         gqsNX4k7hhOQg6hNc8Y/7Axob+w1Ygf7xuIPs1mY5H1YrVwaOwJoJZzwEw/2trH1/Ywu
         6meGP/QO5qAEggEWkwGrZ+MJ/ahbaqJAL4/nxpXfk2HtEAlMvdaLHhgIkRl5pwkoI3iN
         CFv/Sza72jd2h+39axhVrLgCylP++2YDNLOsQBR84FLVAX+xNfHoF7Df2KhBFnWicVas
         Qcd1DgE7/xpCt135Id6peP8YW+jnlykeGRmag/BuL+46CsaAMqtFZmDrb/8ppZVn8zqS
         SEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345057; x=1792949857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GdMzlAoWYmC0lAQDnkbMmmFUgNyfRn6y6z2mVd5BXE=;
        b=h9zScEw9PpHseOW133Y4SV4az2AbpdJXT7JY0f5RGsfeTA4Sz0DBDrSTQqtEmdtJgM
         sMqRiqUhWA1yQ1T9/63QVWlDJ5Xn/t/ofBi4H2ni98RFt9VQ22AAc+2ecJQSsBUu4e+c
         XjVyYT0TOTLx5/5lQxRPt05C2bTeLYPUgABzz3sCnBsH8PeAQEmaSpNwBt6A/dLnSx5O
         bOBgeV7U4x2CAfC77NvQsYJrGYQT8NT7UP6/l/s7QcsY29mbghOFRU2OPxdwyNCklU8X
         FCfiAM+FoXF8Lfk7Rn1ZhugGDDuwDj6/7Edt5Iip3q47qgJUBNpztON/Lo3yCE8lL5hf
         ZiuA==
X-Gm-Message-State: AFq9FYJFN0W9Df5NmNTTgg8UEDvUeMQewMvuuvmFUWFh2oVxGgjvdKcT
	uirfy8B0NMjYg12IRne0Omq3hm1Rj36DBqMw0luOgJyB6ojHZc4I4eob
X-Gm-Gg: AYBFou1PU9UoOmVr7dqKPz5pvQ0pxfk7weriB3PORdq/JhvBsZ/b4ppj0MMoXw1xL/n
	ilYwP+P8QRnQsV239ZCxHbUfpZtiu2qbwdO9wS/Z0nh7tHGNniQUQz8wi8FY6IGpvUjVDig+BZH
	FI4ThSgllThW8OFXpeaKU5XFa4oV5g+MoyWGi8x/mUWdXoHvtX8OHZ2upq3V7LoqNhn3WtWwNsu
	HGIWgEmAexgGDm/hGevPd8Ls4LhwlVFYC/a7qu4w70rYZbb34vHkON3wkTqd/5RGUlfPlbKsvTa
	XS2zxYKkaq3BdgwK1Segj7QPGk5SLleLZ1qejIRzx94h7gGeAsFnADdfKkkDA+jQo1yu30KyFZQ
	SazNS8D6qpdpySuOPbeK3bpGnH65FpTqjw8RBM+cJ/DZU84Z3RGth3nUKnMoXqKI8wpnUGVf0e1
	zoxz9x2i0hZIwA8+kOashos5rBGs08jtS0AkL4Q3/1ySRoP8GIEoNB7pxAU/IX15ArG1iJo+wVU
	gjv94zhHbH1weubEfRuAt3z6SMLkreO8A==
X-Received: by 2002:a05:600c:19c6:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a1e01e1f69mr60484775e9.5.1792345056997;
        Sun, 18 Oct 2026 10:37:36 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dda881f0sm110858935e9.15.2026.10.18.10.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:36 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Pavel Emelyanov <xemul@virtuozzo.com>
Subject: [PATCH v2 12/24] man/man7/sock_diag.7: UNIX_DIAG_NAME: The payload is not always a pathname
Date: Sun, 18 Oct 2026 19:37:00 +0200
Message-ID: <20261018173712.27670-13-gnoack3000@gmail.com>
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

sk_diag_dump_name() in linux.git net/unix/diag.c copies the sun_path
part of the bound address, with length
'addr->len - offsetof(struct sockaddr_un, sun_path)'.  For abstract
sockets this starts with a null byte and is not a pathname; for
pathname sockets, the stored length includes the terminating null byte.
For sockets without an address, the attribute is omitted.

Fixes: 4f6a0a4a909e (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
Cc: Pavel Emelyanov <xemul@virtuozzo.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Shortened and simplified the LLM phrasing, which initially also
    explained the possible valid ways of populating sun_path.  That is
    already adequately explained in unix(7), so I removed that and linked
    unix(7) instead.

 man/man7/sock_diag.7 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index 20733cb8c8ae..9a2b54a67b30 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -169,10 +169,14 @@ attribute as described below:
 .B UDIAG_SHOW_NAME
 The attribute reported in answer to this request is
 .BR UNIX_DIAG_NAME .
-The payload associated with this attribute is the pathname to which
-the socket was bound (a sequence of bytes up to
+The payload associated with this attribute is the
+.I sun_path
+part of the address to which the socket was bound
+(a sequence of bytes up to
 .B UNIX_PATH_MAX
-size).
+size, see
+.BR unix (7)).
+This attribute is not reported for unbound sockets.
 .TP
 .B UDIAG_SHOW_VFS
 The attribute reported in answer to this request is
-- 
2.56.0

