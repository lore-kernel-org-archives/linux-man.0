Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5714360EF2
	for <linux-man@vger.kernel.org>; Sat,  5 Sep 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594304; cv=pass; b=NYTP0KNDLjOs1S9FrV7F6FdELu1cSJwVlcfNkOI8vgHBRshruuElsS0eH8xyV6M87YMlLwpTMnSiuIq+bpP9c9ox/qRRkE5SKo1m2jmDmjl4lVxdBFhxZ38fuFe0Xiy8kJA56xB9875+2SA07Ri2t5DLPxKSykS2IYSH/YfTXz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594304; c=relaxed/simple;
	bh=IE8OG8p5uQydnua8hHcuPY8alsqI6xZ85rPmyQ8WDJw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OXwSv04UDiAT3IXHRvop2dApwS+cLzcf/dxF73xcFvXooKKmVGBXLYsl/zXAIS8LlJ8Wm526rdqlRc+cyNGjPHjYlQKy6HWO3727teJL7izZScOtudznrwlYjhwOW+k2h18byVNs5Uh6xRxgw75eunRfckvS7AjssgiYdFzFX8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGcUIL5c; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGcUIL5c"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fb7ba702eso237996d50.0
        for <linux-man@vger.kernel.org>; Sat, 05 Sep 2026 00:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788594302; cv=none;
        d=google.com; s=arc-20260327;
        b=HiSa7Kdc5YZ+c5jnVXWCei9kr8MdkrgTYBPZm2sqSU6Yg0CDAnOlsoEKbllT4XMZ2Z
         g3rpifWpR95tl8g9Tktfbj7fl+83rWdmbm6+KntF8BHsDl5aqS4ToaIkwz83KrD5BNmM
         tFDIxK0b4za4BcFBYEj2fPG3AMdVzuk2mIujt9WGMrFpuBbueeb36qOt5/yD+bPMcxFy
         fNqfdnxd8f1gcuMQe8xxSSUMUCapejAR2sqmu4CSF5Ka3nxX9RXx9WvU3YvSJfLOpBSu
         vH02K14M0brL5+bJvglcU2yBGwQIa3t1xBBcPx/WUPuxsmgelIhQLiCD7F9mNscKKobI
         8n2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JwMv17OZqCF9gY7rjS/MUfInGCEGI/xREqPC2SUK4n0=;
        fh=HQrAeJGtoj0mrk18UcVkFyZbpURbuUn9DSibLkpCvQs=;
        b=kcbigfeB8AXB9YAXtIv26d1Km3Pzb5yA3YmQicyI2kgDuiacSJM1FK0UXSz6FjMJQE
         W87nlF0guNPZK9ld6Q2ZUMM8Y11/n9SRlCG0+Kfa7V+5Tt/TEA0N+HTHP8oZt6QEzhvx
         yUlJkLRXBqd6Wq8rzQsMzTU+j4beSOOHqyCEr4MK2dkBlFCdnF+KQYeku3u4XQLechJN
         0bzNiseylOJdfUFNJXRLVQY37fiCGTxJu6a4FT0YauVq3YomBfdfY4LvB5it3EWPETEr
         slAuguKQPj4wfk2d/gvoKZstdniNE8ZZTxK5WXmQ3wzHQqiD3OvlNqRmw3FYoRxFq/q9
         U+bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788594302; x=1789199102; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwMv17OZqCF9gY7rjS/MUfInGCEGI/xREqPC2SUK4n0=;
        b=JGcUIL5c9x2I9KtuglnBkcYcG0R6H/RKzAQWoJO1cKxyfDg4LodWCR2gE7dxx2ZC0R
         ui/13ndXzlZlBnkd21ND1dI9zN1zfOAPAlqXGw3KEugkqAiaXEyT4oJMRZwvNsjcS4FY
         h3EUGDwufMJbbloux2/HLtm0VYmv2QEGa0qRcjnjmjKRzjyS4QD1+6autkHMpOBMPekk
         Xdn0JbM+417UsG8gw4LkcPcV6vpKxwSiuVIAttyLIoymxS9HrtCW8mDG4gfCTl63nQLM
         IqJtGJbbPsOi0B+R2qjQf6hAUcd9ciaHx1CNq/Rt76NVtu0pA0xm8jEepZGYp9o6qqAs
         Gw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788594302; x=1789199102;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JwMv17OZqCF9gY7rjS/MUfInGCEGI/xREqPC2SUK4n0=;
        b=WL9tzrifjiGg8ajeT1JhMky575OJemUdSc38KWdPfIqcY/umy9AZC0Ec9TyXfpqK9S
         g8p0RWaHD15yREr2re2zuSz1zC7AxrS2yXklOV6ipFOJ+z5lvY2q1ArepOS07Ivc7Js2
         ORPSjHZ5+4KcfIfQonPXagSYaDVB2DyTXcbfkuh/mDpilgcEtSQemwOc4rHCEjZft2EM
         +SMfTfbr3PsFPmt0cAyosS09Wsaz//55E4LSXtj60zri3cicXd3rK63lTGAd0clmdZhe
         TnSkK8JhTZ8qi+1MWh3+5i/BA9mKtuD0vD09uyQyObf7rhJZN1o1JpGTGyBsdwicCQia
         B8vA==
X-Gm-Message-State: AFuF++ndP/+v9QZTlPk/En8hOrU6MwUVtsHDpTRIYnDV7uAJLtmAU1kb
	CNKhu8R3F6t1bBJzc6EFPRTf5IyXlnyvk7lAdyP0u6Oo5H3khL5jECCxNyK8qF0yTIQ9hehjFYp
	ChjgYTekuSnnhPa1sfIo6i8G1F/yIfjC35bnK
X-Gm-Gg: AYBFou2HxiyF6ZqjtJPVofoqCgb96raUbmXuiMAgpKdEq/885sCGHLLPApWAV3QtaAv
	f1jM3xN07aJfleOhvr5ON3+Bj7VRVRmWkzNPw924spkaAp2I2t95LO2aV3EHyCpmmiAcKrUqrYa
	jd/Lq45baFxyTITqYLhrB7IPvwyYf/oSV0CR/Q8UVuJSZGUw0lG88i0oa9i2dXXrRMql43SNZ7P
	gnpKr/yYMoEkhCooFMZ1Ga5FnqbEHGQ60qn6TrniDtVQQGj7krhajE+89LBMP7gb6LcRvVGdXv1
	jtYh+wCKhbD583ClYiVb2KHQJsbCb4YShQpx3xUwgsei9nlNKKGexw+9TrylwUkY/wmSr0AS9w0
	=
X-Received: by 2002:a05:690e:4083:b0:668:9402:9938 with SMTP id
 956f58d0204a3-66fc2fd5793mr1481193d50.4.1788594302479; Sat, 05 Sep 2026
 00:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Maxim Inozemtsev <milnadar@gmail.com>
Date: Sat, 5 Sep 2026 00:44:51 -0700
X-Gm-Features: AcwNN1W72rGbHgmQAVXYU2gyatYKn30eD36iQt1ShXNWfPGNLL1XHYRV5OFHfOU
Message-ID: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
Subject: Subject: [PATCH 0/1] inotify.7: Fix typo in struct size calculation
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The documentation explains how the size of each `inotify_event` structure
is computed using fields from the structure itself. However, it mistakenly
uses the term `size` instead of `len` at the end of the math expression.

Since `len` is the actual field name indicating the bytes in `name`, fix
`sizeof(struct inotify_event)+size` to `sizeof(struct inotify_event)+len`.

Maxim Inozemtsev (1):
  inotify.7: Fix typo in struct size calculation

 man/man7/inotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.55.0
