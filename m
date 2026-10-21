Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617791;
	b=hypc16sVdGkeIMV7TTWPCGnnk8yaczBNWA3muCGSDyz0VmVibi88gLvsQ0dkoghgcyD1
	 vxGXImSFPKVCTjEsBSnNjt6+IDfZ2SnaC5nb+9wiP8LJhCI1VKb8BUz76/8Ntj5+znZQF
	 eE2BK7VPWqVwo0nHRDCvnegdt/NEPAGOeTi39ndbN/+bnrXuQETQ8IX3ogBxEweCJM0UV
	 cUY/pr2k57R6lFz0yOkw+GYHxBR5H80Oo3jGYoxey1mEa05kSw+h9ha2mcV44vhcoPhXK
	 jycZUz0Y7DzwGudriXphluYdRIFu9Ejf4MzJNI54kc5L3bb8a3HRNkxJ9xEBCI7+tug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FWK2wyM4IBMCINd1mruitc8Ocrk/wwU9j4vHa37lBOE=;
	b=W9G77pPXtcEmN2AqipZIYkfLq6W0vwwEWZ6CXrtV5WzOxbIrD9VkaaQvHvNjxGOlgKj3
	 e9kJWMdtNrrpVd0Sz8oo0v+b9nxm7xpTUEQ3VRnFEHUU0UchsEmC5fdH9O65bL2VWzOGs
	 nqelIEkIrK1I89NO9IhqpcoUkgsnBAoQZeOVroICh1md4xnsMQsPtga7vTG3P7WATd0x7
	 JUFRcgNx9qcDhlz28EqdSP8wjYWF1aguX0HBxOCLVbHQIY8BUaHFp9BVuH1p8QhbvUS+1
	 Yidrz8xA0jMBC1MdA8eQj4mkDNGmotA3LfHt2sL1iAc3vZq0dvLyEG7NyO5KbJeEJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="n6FwP/Qc";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5A3606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5A3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n6FwP/Qc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso6412515e9.1
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617789; x=1793222589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWK2wyM4IBMCINd1mruitc8Ocrk/wwU9j4vHa37lBOE=;
        b=n6FwP/QcB21uzGzft853nyiI3YIPbWAkvmdl+TKXPpRrf3YBD/jYSTiwilXy9MaaX5
         HQr9ZeHdJ0zgZP7NcoN9FNQkCcjRClOMQQJGx4IcPXqzrqnzaHjO2wYaPvdBdyf5V2ww
         quRQfJmyikietS7b6SEK3MY4fqvpDy1jvqeOHEn1JjktnMdcnBpoZm1gif85h8Um1ifk
         6StCxjMC0jOHI0EqjrAVJ3nIAovT7cVx+SkKuau5lxTix+59fYxbr1MyucIHeOReBD2y
         OmesJshZ+Ze8SuMKXVfjBu0AMtWq5fxuGAtkhs6mRha19SQy3MHDByl4Q6yPS7cs2nFn
         pLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617789; x=1793222589;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWK2wyM4IBMCINd1mruitc8Ocrk/wwU9j4vHa37lBOE=;
        b=2qj9oVV5vJnHGra697IMVlWN7Y4NTDDK/GoMCbaqro1xY/uT9BVHNHSRh31zmlMzF8
         ts34eV906/27D7zQkE1VYRJlYRC9ue1IKLc4a61kwDPc/77nG1KqERrHpLEOtAaHix07
         mC1lwjXz51BSXzE5piZGMSvDGriCCCb/h3MAPWbt+Sn3LWKmulewSqgZqf7bsg7lYMJj
         0oRqv2A6sgmxEX1b/rovYApkoHgsInyQmoHOz68IrRNItHA8bHnP9ueOex3mFbq7anX9
         D7EGIsbHRis7vdqJXiFDMwlJM52xa7WCj0VPVVN3FHPWiD0jwElx8O2qGlf4Lm26ZuMH
         Yi9A==
X-Gm-Message-State: AFq9FYJdVoVvS+QFygfjZ8Kw3XXCc3tWIB0tCCbHzNy49V+wSObleGKC
	f/XRKDqzMCX1fk0B0h0eh/NOdkJpPafG5vC2aq8869r4ViM7hxPDHAFP
X-Gm-Gg: AYBFou1ZWTidEBwscSLW4am+j1e/ngC7J2OVqz4j6kH8KyjzT46OL+uWDAoQvw/bX7V
	tarTaj/ud11hvVY3F+stoPh8GGlS3L5Cxtir/DIkEGmKFujPnfVA8mflA5fVyo3zY5XOC71ktVl
	j5n90exB9x5BnYHW+I/7I4uooU6LVJRaSqo92G2V3cqcY7IxOEzdDkHL6E0V/GxIgjD0l3h9zOH
	6vHCD4xwAXxNrm7bqBXEnH85bxuG9oXdGQ1xIlYNJSHTvef50ZuQSPlQCT48TkvJlokpCT3oy+1
	OrKQVFyCkU9/cE14eXzsRY0KYHRIa9A20GCm/vObRNSGycf1jHVdm16jU5UHHy2jcZmfmcyMUhQ
	IY34+1QOdqA5xKrVSoTNaSiY/zbirGQ0rwmPwKILFTGfH+DYTh8bKlwAAuWAyw5PUlx0xysuZZG
	gNS3TuEFfB2lQi3ajbBmZ0dEqp8dNx+JxuzN7XYh+bGBP1ciIc0QJlwkTxamzCDF4958McixGD6
	563m2ewW0w3GxBqAnNPRg6YOkF5ezRhoIVNnAiMPxK4E2OjDGY1k6JqVeqgFqqzRe5mWb4uVeIq
	Hms6
X-Received: by 2002:a05:600c:c16e:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a1fdd12dbcmr56658905e9.17.1792617789372;
        Wed, 21 Oct 2026 14:23:09 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0e6a9sm18873215e9.4.2026.10.21.14.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:09 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 0/7] unix.7: Socket Options and SCM_* fixes
Date: Wed, 21 Oct 2026 23:22:49 +0200
Message-ID: <20261021212256.27961-1-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Thank you for your reviews on v1 and v2 of the still-joined patch set.
Compared to v2, the following things happened:

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

More details are attached in the commit notes.

This patch set has been produced with the help of a LLM, which was
helpful for spotting a long list of inaccuracies, comparing the
documentation with the kernel implementation.  (More details in [1])

–Günther

P.S.: Part (C) will come soon, but not today any more. :)
      That part is more independent again and, being about "sock_diag",
      it is outside of the main unix(7) documentation.


[1] https://lore.kernel.org/all/20261018173712.27670-1-gnoack3000@gmail.com/
[2] https://lore.kernel.org/all/CAAVpQUBh+J-aBLbkpzT7qmt7B714O529HWcTuQsVLT4wLBnDJA@mail.gmail.com/


Günther Noack (7):
  man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
  man/man7/unix.7: Multiple same-typed SCM_* messages may be sent in one
    message
  man/man7/unix.7: Autobind: Clarify when it happens, and mention
    SO_PASSPIDFD
  man/man7/unix.7: SCM_SECURITY: Generalize to other LSMs, not just
    SELinux
  man/man7/unix.7: SO_PASSSEC: wfix
  man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
  man/man7/unix.7: Document SO_PASSRIGHTS

 man/man7/unix.7 | 215 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 201 insertions(+), 14 deletions(-)

-- 
2.56.0

